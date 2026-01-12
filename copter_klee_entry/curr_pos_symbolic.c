#include <klee/klee.h>
#include <stdint.h>
#include <stdbool.h>
#include <math.h>
#include <stdlib.h>
#include <assert.h>

// 模拟 ArduPilot 的 Vector3f 和 Vector2f 类型
typedef struct {
    float x, y, z;
} Vector3f;

typedef struct {
    float x, y;
} Vector2f;

typedef struct {
    double x, y, z;
} Vector3p;

typedef struct {
    double x, y;
} Vector2p;

// 模拟位置控制器的关键状态
typedef struct {
    // 位置相关 (NEU坐标系，单位：厘米)
    Vector3f curr_pos;           // 当前位置 - 这是我们要符号化的主要变量
    Vector3p _pos_target;        // 目标位置
    Vector3f _vel_desired;       // 期望速度
    Vector3f _vel_target;        // 速度目标
    Vector3f _accel_desired;     // 期望加速度
    Vector3f _accel_target;      // 加速度目标
    Vector3f _limit_vector;      // 限制向量
    
    // 控制器输出
    float _roll_target;          // 目标横滚角 (厘度)
    float _pitch_target;         // 目标俯仰角 (厘度)
    
    // 其他状态变量
    Vector2f curr_vel;           // 当前速度
    float ahrsControlScaleXY;    // AHRS控制缩放因子
    float angle_max_cd;          // 最大角度限制
    float accel_max;             // 最大加速度限制
} PosControlState;

// 模拟 P 控制器 (简化版)
Vector2f mock_p_pos_xy_update_all(float target_x, float target_y, Vector3f curr_pos) {
    Vector2f vel_target;
    float kP = 1.0f; // 简化的P增益
    
    // 计算位置误差并转换为速度目标
    vel_target.x = (target_x - curr_pos.x) * kP;
    vel_target.y = (target_y - curr_pos.y) * kP;
    
    return vel_target;
}

// 模拟 PID 速度控制器
Vector2f mock_pid_vel_xy_update_all(Vector2f vel_target, Vector2f curr_vel, Vector2f limit_vector) {
    Vector2f accel_target;
    float kP = 2.0f; // 简化的PID增益
    
    accel_target.x = (vel_target.x - curr_vel.x) * kP;
    accel_target.y = (vel_target.y - curr_vel.y) * kP;
    
    return accel_target;
}

// 角度到加速度转换
float mock_angle_to_accel(float angle_rad) {
    return tan(angle_rad) * 981.0f; // g = 9.81 m/s^2 = 981 cm/s^2
}

// 加速度限制函数
bool mock_limit_accel_xy(Vector2f vel_desired, Vector2f* accel_target, float accel_max) {
    float accel_mag = sqrt(accel_target->x * accel_target->x + accel_target->y * accel_target->y);
    if (accel_mag > accel_max) {
        float scale = accel_max / accel_mag;
        accel_target->x *= scale;
        accel_target->y *= scale;
        return true; // 被限制了
    }
    return false; // 没有被限制
}

// 加速度到倾斜角度转换
void mock_accel_to_lean_angles(float accel_x, float accel_y, float* roll_target, float* pitch_target) {
    // 将加速度转换为倾斜角度 (厘度)
    *roll_target = atan2(accel_y, 981.0f) * 5729.578f;   // 弧度转厘度
    *pitch_target = atan2(-accel_x, 981.0f) * 5729.578f; // 弧度转厘度
}

// 简化的 update_xy_controller 函数，重点关注 curr_pos 的影响
void update_xy_controller_with_symbolic_curr_pos(PosControlState* state) {
    // 1. Position Controller - 这里是 curr_pos 最直接的影响点
    Vector2f vel_target = mock_p_pos_xy_update_all(
        state->_pos_target.x, 
        state->_pos_target.y, 
        state->curr_pos  // 符号化的当前位置
    );

    // 2. 应用 AHRS 控制缩放
    vel_target.x *= state->ahrsControlScaleXY;
    vel_target.y *= state->ahrsControlScaleXY;
    
    state->_vel_target.x = vel_target.x;
    state->_vel_target.y = vel_target.y;
    
    // 3. 添加期望速度前馈
    state->_vel_target.x += state->_vel_desired.x;
    state->_vel_target.y += state->_vel_desired.y;

    // 4. Velocity Controller
    Vector2f vel_target_2d = {state->_vel_target.x, state->_vel_target.y};
    Vector2f accel_target = mock_pid_vel_xy_update_all(
        vel_target_2d, 
        state->curr_vel, 
        (Vector2f){state->_limit_vector.x, state->_limit_vector.y}
    );
    
    // 5. 应用 AHRS 控制缩放到加速度
    accel_target.x *= state->ahrsControlScaleXY;
    accel_target.y *= state->ahrsControlScaleXY;

    // 6. 设置目标加速度
    state->_accel_target.x = accel_target.x;
    state->_accel_target.y = accel_target.y;

    // 7. 添加期望加速度前馈
    state->_accel_target.x += state->_accel_desired.x;
    state->_accel_target.y += state->_accel_desired.y;

    // 8. Acceleration Controller - 加速度限制
    float angle_max_rad = state->angle_max_cd * 0.01f * M_PI / 180.0f; // 厘度转弧度
    float accel_max = mock_angle_to_accel(angle_max_rad) * 100.0f;

    // 设置限制向量
    state->_limit_vector.x = state->_accel_target.x;
    state->_limit_vector.y = state->_accel_target.y;
    
    Vector2f accel_target_vec = {state->_accel_target.x, state->_accel_target.y};
    if (!mock_limit_accel_xy(
        (Vector2f){state->_vel_desired.x, state->_vel_desired.y}, 
        &accel_target_vec, 
        accel_max)) {
        // 没有被限制，清零限制向量
        state->_limit_vector.x = 0.0f;
        state->_limit_vector.y = 0.0f;
    }
    
    state->_accel_target.x = accel_target_vec.x;
    state->_accel_target.y = accel_target_vec.y;

    // 9. 计算目标倾斜角度
    mock_accel_to_lean_angles(
        state->_accel_target.x, 
        state->_accel_target.y, 
        &state->_roll_target, 
        &state->_pitch_target
    );
}

// 分析 curr_pos 对系统行为的影响
void analyze_curr_pos_impact(PosControlState* state) {
    // 保存初始状态用于比较
    Vector3f initial_pos = state->curr_pos;
    Vector2f initial_accel = {state->_accel_target.x, state->_accel_target.y};
    float initial_roll = state->_roll_target;
    float initial_pitch = state->_pitch_target;
    
    // 计算位置误差
    float pos_error_x = state->_pos_target.x - state->curr_pos.x;
    float pos_error_y = state->_pos_target.y - state->curr_pos.y;
    float pos_error_magnitude = sqrt(pos_error_x * pos_error_x + pos_error_y * pos_error_y);
    
    // 运行控制器
    update_xy_controller_with_symbolic_curr_pos(state);
    
    // 计算控制响应
    float accel_magnitude = sqrt(state->_accel_target.x * state->_accel_target.x + 
                                state->_accel_target.y * state->_accel_target.y);
    float angle_magnitude = sqrt(state->_roll_target * state->_roll_target + 
                               state->_pitch_target * state->_pitch_target);
    
    // 输出分析结果（用于KLEE测试验证）
    printf("Position Error: %.2f cm\n", pos_error_magnitude);
    printf("Acceleration Command: %.2f cm/s^2\n", accel_magnitude);
    printf("Angle Command: %.2f centi-degrees\n", angle_magnitude);
}

// KLEE 符号执行入口点
void symbolic_curr_pos_analysis() {
    PosControlState state;
    
    // 1. 符号化 curr_pos - 这是我们的主要关注点
    klee_make_symbolic(&state.curr_pos, sizeof(state.curr_pos), "curr_pos");
    
    // 2. 符号化其他相关状态（可选，用于更全面的测试）
    klee_make_symbolic(&state._pos_target, sizeof(state._pos_target), "pos_target");
    klee_make_symbolic(&state._vel_desired, sizeof(state._vel_desired), "vel_desired");
    klee_make_symbolic(&state.curr_vel, sizeof(state.curr_vel), "curr_vel");
    klee_make_symbolic(&state.ahrsControlScaleXY, sizeof(state.ahrsControlScaleXY), "ahrs_scale");
    klee_make_symbolic(&state.angle_max_cd, sizeof(state.angle_max_cd), "angle_max");
    
    // 3. 设置 curr_pos 的约束条件（基于实际飞行场景）
    
    // 水平位置约束：±1000米 (±100000厘米)
    klee_assume(state.curr_pos.x >= -100000.0f && state.curr_pos.x <= 100000.0f);
    klee_assume(state.curr_pos.y >= -100000.0f && state.curr_pos.y <= 100000.0f);
    
    // 高度约束：-100米到1000米 (-10000到100000厘米)
    klee_assume(state.curr_pos.z >= -10000.0f && state.curr_pos.z <= 100000.0f);
    
    // 避免极端的浮点数值
    klee_assume(!isnan(state.curr_pos.x) && !isinf(state.curr_pos.x));
    klee_assume(!isnan(state.curr_pos.y) && !isinf(state.curr_pos.y));
    klee_assume(!isnan(state.curr_pos.z) && !isinf(state.curr_pos.z));
    
    // 4. 设置目标位置约束
    klee_assume(state._pos_target.x >= -100000.0 && state._pos_target.x <= 100000.0);
    klee_assume(state._pos_target.y >= -100000.0 && state._pos_target.y <= 100000.0);
    klee_assume(state._pos_target.z >= -10000.0 && state._pos_target.z <= 100000.0);
    
    // 5. 设置速度约束：±50m/s (±5000 cm/s)
    klee_assume(state._vel_desired.x >= -5000.0f && state._vel_desired.x <= 5000.0f);
    klee_assume(state._vel_desired.y >= -5000.0f && state._vel_desired.y <= 5000.0f);
    klee_assume(state.curr_vel.x >= -5000.0f && state.curr_vel.x <= 5000.0f);
    klee_assume(state.curr_vel.y >= -5000.0f && state.curr_vel.y <= 5000.0f);
    
    // 6. 设置控制参数约束
    klee_assume(state.ahrsControlScaleXY >= 0.1f && state.ahrsControlScaleXY <= 2.0f);
    klee_assume(state.angle_max_cd >= 500.0f && state.angle_max_cd <= 4500.0f); // 5-45度
    
    // 7. 初始化其他状态变量
    state._accel_desired.x = 0.0f;
    state._accel_desired.y = 0.0f;
    state._accel_desired.z = 0.0f;
    
    state._vel_target.x = 0.0f;
    state._vel_target.y = 0.0f;
    state._vel_target.z = 0.0f;
    
    state._accel_target.x = 0.0f;
    state._accel_target.y = 0.0f;
    state._accel_target.z = 0.0f;
    
    state._limit_vector.x = 0.0f;
    state._limit_vector.y = 0.0f;
    state._limit_vector.z = 0.0f;
    
    state._roll_target = 0.0f;
    state._pitch_target = 0.0f;
    
    // 8. 执行符号化分析
    analyze_curr_pos_impact(&state);
    
    // 9. 添加安全性断言
    // 确保控制输出在合理范围内
    float accel_magnitude = sqrt(state._accel_target.x * state._accel_target.x + 
                                state._accel_target.y * state._accel_target.y);
    klee_assert(accel_magnitude <= 2000.0f); // 最大加速度约束 (20 m/s^2)
    
    // 确保角度输出在合理范围内
    klee_assert(state._roll_target >= -4500.0f && state._roll_target <= 4500.0f);  // ±45度
    klee_assert(state._pitch_target >= -4500.0f && state._pitch_target <= 4500.0f); // ±45度
    
    // 确保没有NaN或无穷大
    klee_assert(!isnan(state._accel_target.x) && !isinf(state._accel_target.x));
    klee_assert(!isnan(state._accel_target.y) && !isinf(state._accel_target.y));
    klee_assert(!isnan(state._roll_target) && !isinf(state._roll_target));
    klee_assert(!isnan(state._pitch_target) && !isinf(state._pitch_target));
    
    // 10. 测试特定场景
    // 测试大位置误差情况
    float pos_error_mag = sqrt((state._pos_target.x - state.curr_pos.x) * (state._pos_target.x - state.curr_pos.x) + 
                              (state._pos_target.y - state.curr_pos.y) * (state._pos_target.y - state.curr_pos.y));
    
    if (pos_error_mag > 1000.0f) { // 位置误差大于10米时
        // 验证控制器是否产生了合理的响应
        klee_assert(accel_magnitude > 10.0f); // 应该有显著的加速度命令
    }
    
    if (pos_error_mag < 10.0f) { // 位置误差小于10厘米时
        // 验证控制器响应是否足够小
        klee_assert(accel_magnitude < 500.0f); // 加速度命令应该相对较小
    }
}

int main() {
    symbolic_curr_pos_analysis();
    return 0;
}
