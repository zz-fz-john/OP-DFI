#include <klee/klee.h>
#include <stdint.h>
#include <stdbool.h>
#include <math.h>

// 模拟 AC_PosControl 类中 update_xy_controller() 函数相关的结构体和变量
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

// 模拟 AC_PosControl 的关键成员变量
typedef struct {
    // 位置相关
    Vector3p _pos_target;
    Vector3f _vel_desired;
    Vector3f _vel_target;
    Vector3f _accel_desired;
    Vector3f _accel_target;
    Vector3f _limit_vector;
    
    // 控制器输出
    float _roll_target;
    float _pitch_target;
    float _yaw_target;
    float _yaw_rate_target;
    
    // 时间和状态
    uint64_t _last_update_xy_us;
    float _dt;
    
    // 限制参数
    float _vel_max_xy_cms;
    float _accel_max_xy_cmss;
    float _jerk_max_xy_cmsss;
    float _angle_max_override_cd;
    
    // 当前状态（模拟传感器输入）
    Vector3f curr_pos;
    Vector2f curr_vel;
    
    // AHRS 控制缩放因子
    float ahrsControlScaleXY;
    float ahrsGndSpdLimit;
    
    // PID 控制器状态模拟
    Vector2f pos_error;
    Vector2f vel_error;
    float angle_max_cd;
    float lean_angle_max_cd;
} AC_PosControl_Sim;

// 模拟关键函数的返回值
bool mock_is_active_xy(AC_PosControl_Sim* ctrl) {
    // 简化实现：基于时间检查
    return true; // 假设总是激活状态用于测试
}

uint64_t mock_get_micros64() {
    return 1000000; // 返回固定值用于测试
}

void mock_handle_ekf_xy_reset(AC_PosControl_Sim* ctrl) {
    // 空实现，用于符号执行
}

void mock_init_xy_controller(AC_PosControl_Sim* ctrl) {
    // 重置关键状态
    ctrl->_roll_target = 0.0f;
    ctrl->_pitch_target = 0.0f;
    ctrl->_yaw_target = 0.0f;
    ctrl->_yaw_rate_target = 0.0f;
}

Vector2f mock_p_pos_xy_update_all(AC_PosControl_Sim* ctrl, float target_x, float target_y, Vector3f curr_pos) {
    // 简化的位置控制器
    Vector2f vel_target;
    vel_target.x = (target_x - curr_pos.x) * 1.0f; // 简化的P控制器
    vel_target.y = (target_y - curr_pos.y) * 1.0f;
    return vel_target;
}

Vector2f mock_pid_vel_xy_update_all(AC_PosControl_Sim* ctrl, Vector2f vel_target, Vector2f curr_vel, Vector2f limit_vector) {
    // 简化的速度控制器
    Vector2f accel_target;
    accel_target.x = (vel_target.x - curr_vel.x) * 2.0f; // 简化的PID控制器
    accel_target.y = (vel_target.y - curr_vel.y) * 2.0f;
    return accel_target;
}

float mock_angle_to_accel(float angle_rad) {
    return tan(angle_rad) * 981.0f; // 重力加速度转换
}

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

void mock_accel_to_lean_angles(float accel_x, float accel_y, float* roll_target, float* pitch_target) {
    // 简化的加速度到倾斜角度转换
    *roll_target = atan2(accel_y, 981.0f) * 5729.578f; // 转换为厘度
    *pitch_target = atan2(-accel_x, 981.0f) * 5729.578f;
}

void mock_calculate_yaw_and_rate_yaw(AC_PosControl_Sim* ctrl) {
    // 简化的偏航计算
    ctrl->_yaw_rate_target = 0.0f;
}

// 核心的 update_xy_controller 函数实现（简化版）
void update_xy_controller(AC_PosControl_Sim* ctrl) {
    // 检查 EKF xy 位置重置
    mock_handle_ekf_xy_reset(ctrl);

    // 检查位置控制超时
    if (!mock_is_active_xy(ctrl)) {
        mock_init_xy_controller(ctrl);
    }
    ctrl->_last_update_xy_us = mock_get_micros64();

    // 获取 AHRS 控制限制（这些值已经符号化）
    float ahrsGndSpdLimit = ctrl->ahrsGndSpdLimit;
    float ahrsControlScaleXY = ctrl->ahrsControlScaleXY;

    // 位置控制器
    Vector2f vel_target = mock_p_pos_xy_update_all(ctrl, ctrl->_pos_target.x, ctrl->_pos_target.y, ctrl->curr_pos);

    // 添加速度前馈，按比例缩放以补偿光流测量引起的EKF噪声
    vel_target.x *= ahrsControlScaleXY;
    vel_target.y *= ahrsControlScaleXY;
    ctrl->_vel_target.x = vel_target.x;
    ctrl->_vel_target.y = vel_target.y;
    ctrl->_vel_target.x += ctrl->_vel_desired.x;
    ctrl->_vel_target.y += ctrl->_vel_desired.y;

    // 速度控制器
    Vector2f accel_target = mock_pid_vel_xy_update_all(ctrl, 
        (Vector2f){ctrl->_vel_target.x, ctrl->_vel_target.y}, 
        ctrl->curr_vel, 
        (Vector2f){ctrl->_limit_vector.x, ctrl->_limit_vector.y});
    
    // 加速度校正速度误差并缩放PID输出以补偿光流测量引起的EKF噪声
    accel_target.x *= ahrsControlScaleXY;
    accel_target.y *= ahrsControlScaleXY;

    // 将校正加速度传递给目标加速度输出
    ctrl->_accel_target.x = accel_target.x;
    ctrl->_accel_target.y = accel_target.y;

    // 将前馈添加到目标加速度输出中
    ctrl->_accel_target.x += ctrl->_accel_desired.x;
    ctrl->_accel_target.y += ctrl->_accel_desired.y;

    // 加速度控制器
    // 使用最大倾斜角限制加速度
    float angle_max = fminf(ctrl->angle_max_cd, ctrl->lean_angle_max_cd);
    float accel_max = mock_angle_to_accel(angle_max * 0.01f) * 100.0f;
    
    // 在约束_accel_target之前定义限制向量
    ctrl->_limit_vector.x = ctrl->_accel_target.x;
    ctrl->_limit_vector.y = ctrl->_accel_target.y;
    
    Vector2f accel_target_vec = {ctrl->_accel_target.x, ctrl->_accel_target.y};
    if (!mock_limit_accel_xy((Vector2f){ctrl->_vel_desired.x, ctrl->_vel_desired.y}, &accel_target_vec, accel_max)) {
        // _accel_target没有被限制，所以我们可以将xy限制向量清零
        ctrl->_limit_vector.x = 0.0f;
        ctrl->_limit_vector.y = 0.0f;
    }
    ctrl->_accel_target.x = accel_target_vec.x;
    ctrl->_accel_target.y = accel_target_vec.y;

    // 更新将传递给稳定控制器的角度目标
    mock_accel_to_lean_angles(ctrl->_accel_target.x, ctrl->_accel_target.y, &ctrl->_roll_target, &ctrl->_pitch_target);
    mock_calculate_yaw_and_rate_yaw(ctrl);
}

// KLEE 符号执行入口点
void symbolic_execution_begin() {
    AC_PosControl_Sim ctrl;
    
    // 符号化关键输入变量
    klee_make_symbolic(&ctrl._pos_target, sizeof(ctrl._pos_target), "pos_target");
    klee_make_symbolic(&ctrl._vel_desired, sizeof(ctrl._vel_desired), "vel_desired");
    klee_make_symbolic(&ctrl._accel_desired, sizeof(ctrl._accel_desired), "accel_desired");
    klee_make_symbolic(&ctrl.curr_pos, sizeof(ctrl.curr_pos), "curr_pos");
    klee_make_symbolic(&ctrl.curr_vel, sizeof(ctrl.curr_vel), "curr_vel");
    klee_make_symbolic(&ctrl.ahrsControlScaleXY, sizeof(ctrl.ahrsControlScaleXY), "ahrs_scale_xy");
    klee_make_symbolic(&ctrl.ahrsGndSpdLimit, sizeof(ctrl.ahrsGndSpdLimit), "ahrs_gnd_spd_limit");
    klee_make_symbolic(&ctrl.angle_max_cd, sizeof(ctrl.angle_max_cd), "angle_max_cd");
    klee_make_symbolic(&ctrl.lean_angle_max_cd, sizeof(ctrl.lean_angle_max_cd), "lean_angle_max_cd");
    
    // 设置符号化变量的约束条件
    // 位置约束 (-10000cm 到 10000cm, 即 -100m 到 100m)
    klee_assume(ctrl._pos_target.x >= -10000.0 && ctrl._pos_target.x <= 10000.0);
    klee_assume(ctrl._pos_target.y >= -10000.0 && ctrl._pos_target.y <= 10000.0);
    klee_assume(ctrl._pos_target.z >= -10000.0 && ctrl._pos_target.z <= 10000.0);
    
    // 当前位置约束
    klee_assume(ctrl.curr_pos.x >= -10000.0f && ctrl.curr_pos.x <= 10000.0f);
    klee_assume(ctrl.curr_pos.y >= -10000.0f && ctrl.curr_pos.y <= 10000.0f);
    klee_assume(ctrl.curr_pos.z >= -10000.0f && ctrl.curr_pos.z <= 10000.0f);
    
    // 速度约束 (-500cm/s 到 500cm/s)
    klee_assume(ctrl._vel_desired.x >= -500.0f && ctrl._vel_desired.x <= 500.0f);
    klee_assume(ctrl._vel_desired.y >= -500.0f && ctrl._vel_desired.y <= 500.0f);
    klee_assume(ctrl.curr_vel.x >= -500.0f && ctrl.curr_vel.x <= 500.0f);
    klee_assume(ctrl.curr_vel.y >= -500.0f && ctrl.curr_vel.y <= 500.0f);
    
    // 加速度约束 (-1000cm/s/s 到 1000cm/s/s)
    klee_assume(ctrl._accel_desired.x >= -1000.0f && ctrl._accel_desired.x <= 1000.0f);
    klee_assume(ctrl._accel_desired.y >= -1000.0f && ctrl._accel_desired.y <= 1000.0f);
    
    // AHRS 缩放因子约束 (0.1 到 2.0)
    klee_assume(ctrl.ahrsControlScaleXY >= 0.1f && ctrl.ahrsControlScaleXY <= 2.0f);
    klee_assume(ctrl.ahrsGndSpdLimit >= 0.1f && ctrl.ahrsGndSpdLimit <= 10.0f);
    
    // 角度约束 (0 到 4500 厘度，即 0 到 45 度)
    klee_assume(ctrl.angle_max_cd >= 0.0f && ctrl.angle_max_cd <= 4500.0f);
    klee_assume(ctrl.lean_angle_max_cd >= 0.0f && ctrl.lean_angle_max_cd <= 4500.0f);
    
    // 初始化其他非符号化的变量
    ctrl._dt = 0.0025f; // 400Hz 控制频率
    ctrl._vel_max_xy_cms = 500.0f;
    ctrl._accel_max_xy_cmss = 100.0f;
    ctrl._jerk_max_xy_cmsss = 500.0f;
    ctrl._angle_max_override_cd = 0.0f;
    ctrl._last_update_xy_us = 0;
    
    // 初始化输出变量
    ctrl._roll_target = 0.0f;
    ctrl._pitch_target = 0.0f;
    ctrl._yaw_target = 0.0f;
    ctrl._yaw_rate_target = 0.0f;
    
    // 初始化其他状态变量
    ctrl._vel_target.x = 0.0f;
    ctrl._vel_target.y = 0.0f;
    ctrl._vel_target.z = 0.0f;
    ctrl._accel_target.x = 0.0f;
    ctrl._accel_target.y = 0.0f;
    ctrl._accel_target.z = 0.0f;
    ctrl._limit_vector.x = 0.0f;
    ctrl._limit_vector.y = 0.0f;
    ctrl._limit_vector.z = 0.0f;
    
    // 执行 update_xy_controller 函数
    update_xy_controller(&ctrl);
    
    // 添加一些断言来检查输出的合理性
    // 检查倾斜角度是否在合理范围内 (-45度到45度，即-4500到4500厘度)
    klee_assert(ctrl._roll_target >= -4500.0f && ctrl._roll_target <= 4500.0f);
    klee_assert(ctrl._pitch_target >= -4500.0f && ctrl._pitch_target <= 4500.0f);
    
    // 检查加速度目标是否在合理范围内
    float accel_mag = sqrt(ctrl._accel_target.x * ctrl._accel_target.x + ctrl._accel_target.y * ctrl._accel_target.y);
    klee_assert(accel_mag <= 2000.0f); // 最大加速度约束
}

int main() {
    symbolic_execution_begin();
    return 0;
}
