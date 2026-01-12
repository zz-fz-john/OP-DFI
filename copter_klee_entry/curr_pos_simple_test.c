#include <klee/klee.h>
#include <math.h>
#include <stdio.h>

// 简化的Vector3f结构
typedef struct {
    float x, y, z;
} Vector3f;

typedef struct {
    float x, y;
} Vector2f;

// 核心测试：curr_pos在位置控制中的直接影响
void test_curr_pos_position_control() {
    // 符号化curr_pos
    Vector3f curr_pos;
    klee_make_symbolic(&curr_pos, sizeof(curr_pos), "curr_pos");
    
    // 设置目标位置 (固定值，便于分析)
    float target_x = 1000.0f;  // 目标：北方10米
    float target_y = 500.0f;   // 目标：东方5米
    
    // 设置curr_pos约束
    klee_assume(curr_pos.x >= -10000.0f && curr_pos.x <= 10000.0f); // ±100米
    klee_assume(curr_pos.y >= -10000.0f && curr_pos.y <= 10000.0f); // ±100米
    klee_assume(curr_pos.z >= -1000.0f && curr_pos.z <= 5000.0f);   // -10米到50米
    
    // 避免无效值
    klee_assume(!isnan(curr_pos.x) && !isinf(curr_pos.x));
    klee_assume(!isnan(curr_pos.y) && !isinf(curr_pos.y));
    klee_assume(!isnan(curr_pos.z) && !isinf(curr_pos.z));
    
    // 计算位置误差 (这是curr_pos最直接的影响)
    float error_x = target_x - curr_pos.x;
    float error_y = target_y - curr_pos.y;
    float error_magnitude = sqrt(error_x * error_x + error_y * error_y);
    
    // 模拟P控制器响应
    float kP = 1.0f; // P增益
    Vector2f vel_command;
    vel_command.x = error_x * kP;
    vel_command.y = error_y * kP;
    
    // 计算速度命令大小
    float vel_magnitude = sqrt(vel_command.x * vel_command.x + vel_command.y * vel_command.y);
    
    // 验证控制器响应的合理性
    klee_assert(vel_magnitude >= 0.0f);
    klee_assert(vel_magnitude <= 20000.0f); // 最大速度200m/s (很保守的上限)
    
    // 测试边界情况
    if (error_magnitude < 1.0f) {
        // 当非常接近目标时，速度命令应该很小
        klee_assert(vel_magnitude < 2.0f);
    }
    
    if (error_magnitude > 5000.0f) {
        // 当距离目标很远时，应该有显著的速度命令
        klee_assert(vel_magnitude > 1000.0f);
    }
    
    // 方向性检查
    if (error_x > 100.0f) {
        // 如果需要向北移动，x方向速度应为正
        klee_assert(vel_command.x > 50.0f);
    }
    
    if (error_x < -100.0f) {
        // 如果需要向南移动，x方向速度应为负
        klee_assert(vel_command.x < -50.0f);
    }
    
    if (error_y > 100.0f) {
        // 如果需要向东移动，y方向速度应为正
        klee_assert(vel_command.y > 50.0f);
    }
    
    if (error_y < -100.0f) {
        // 如果需要向西移动，y方向速度应为负
        klee_assert(vel_command.y < -50.0f);
    }
}

// 测试curr_pos在不同象限的行为
void test_curr_pos_quadrants() {
    Vector3f curr_pos;
    klee_make_symbolic(&curr_pos, sizeof(curr_pos), "curr_pos_quad");
    
    // 约束到4个象限进行测试
    klee_assume(curr_pos.x >= -5000.0f && curr_pos.x <= 5000.0f);
    klee_assume(curr_pos.y >= -5000.0f && curr_pos.y <= 5000.0f);
    klee_assume(curr_pos.z >= 0.0f && curr_pos.z <= 1000.0f);
    
    klee_assume(!isnan(curr_pos.x) && !isinf(curr_pos.x));
    klee_assume(!isnan(curr_pos.y) && !isinf(curr_pos.y));
    klee_assume(!isnan(curr_pos.z) && !isinf(curr_pos.z));
    
    // 目标始终在原点
    float target_x = 0.0f;
    float target_y = 0.0f;
    
    float error_x = target_x - curr_pos.x;
    float error_y = target_y - curr_pos.y;
    
    // 验证每个象限的控制方向正确性
    if (curr_pos.x > 0.0f && curr_pos.y > 0.0f) {
        // 第一象限：应该向西南移动
        klee_assert(error_x < 0.0f); // 向南
        klee_assert(error_y < 0.0f); // 向西
    }
    
    if (curr_pos.x < 0.0f && curr_pos.y > 0.0f) {
        // 第二象限：应该向东南移动
        klee_assert(error_x > 0.0f); // 向北
        klee_assert(error_y < 0.0f); // 向西
    }
    
    if (curr_pos.x < 0.0f && curr_pos.y < 0.0f) {
        // 第三象限：应该向东北移动
        klee_assert(error_x > 0.0f); // 向北
        klee_assert(error_y > 0.0f); // 向东
    }
    
    if (curr_pos.x > 0.0f && curr_pos.y < 0.0f) {
        // 第四象限：应该向西北移动
        klee_assert(error_x < 0.0f); // 向南
        klee_assert(error_y > 0.0f); // 向东
    }
}

// 测试curr_pos的数值稳定性
void test_curr_pos_numerical_stability() {
    Vector3f curr_pos;
    klee_make_symbolic(&curr_pos, sizeof(curr_pos), "curr_pos_stable");
    
    // 测试接近零的情况
    klee_assume(curr_pos.x >= -10.0f && curr_pos.x <= 10.0f);
    klee_assume(curr_pos.y >= -10.0f && curr_pos.y <= 10.0f);
    klee_assume(curr_pos.z >= -10.0f && curr_pos.z <= 10.0f);
    
    klee_assume(!isnan(curr_pos.x) && !isinf(curr_pos.x));
    klee_assume(!isnan(curr_pos.y) && !isinf(curr_pos.y));
    klee_assume(!isnan(curr_pos.z) && !isinf(curr_pos.z));
    
    // 计算与原点的距离
    float distance = sqrt(curr_pos.x * curr_pos.x + curr_pos.y * curr_pos.y + curr_pos.z * curr_pos.z);
    
    // 验证数值计算的稳定性
    klee_assert(!isnan(distance));
    klee_assert(!isinf(distance));
    klee_assert(distance >= 0.0f);
    klee_assert(distance <= 20.0f); // 在约束范围内
}

int main() {
    printf("开始curr_pos符号化测试...\n");
    
    // 运行所有测试
    test_curr_pos_position_control();
    test_curr_pos_quadrants();
    test_curr_pos_numerical_stability();
    
    printf("curr_pos符号化测试完成\n");
    return 0;
}
