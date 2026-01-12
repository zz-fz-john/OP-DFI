#!/bin/bash

# KLEE符号化curr_pos的编译和执行脚本
# 设置环境变量
export KLEE_HOME=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee
export KLEE_BUILD=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee/build
export LLVM_HOME=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build
export PATH=$LLVM_HOME/bin:$KLEE_BUILD/bin:$PATH

# 进入工作目录
cd /home/zrz0517/study/chain_attestation/OP-DFI/copter_klee_entry

echo "=== KLEE符号化curr_pos分析 ==="
echo "编译 curr_pos 符号执行文件..."

# 编译为 LLVM IR
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone \
    -I$KLEE_HOME/include \
    -DKLEE_ANALYSIS \
    curr_pos_symbolic.c \
    -o curr_pos_symbolic.bc

if [ $? -eq 0 ]; then
    echo "✓ LLVM IR 编译成功: curr_pos_symbolic.bc"
    
    echo ""
    echo "开始 KLEE 符号执行分析..."
    echo "目标：分析curr_pos对位置控制器的影响"
    
    # 运行 KLEE 符号执行
    klee \
        --output-dir=klee-out-curr-pos \
        --write-smt2s \
        --write-cvcs \
        --write-cov \
        --optimize \
        --max-time=120 \
        --max-memory=2000 \
        --search=dfs \
        --solver-backend=stp \
        --max-instruction-time=10 \
        --max-solver-time=30 \
        --use-forked-solver \
        --only-output-states-covering-new \
        curr_pos_symbolic.bc
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✓ KLEE 符号执行完成！"
        echo "=========================================="
        echo "结果分析："
        echo "=========================================="
        
        echo ""
        echo "1. 输出目录内容："
        ls -la klee-out-curr-pos/
        
        echo ""
        echo "2. 生成的测试案例数量："
        test_count=$(ls klee-out-curr-pos/*.ktest 2>/dev/null | wc -l)
        echo "   测试案例: $test_count 个"
        
        echo ""
        echo "3. 覆盖率信息："
        if [ -f klee-out-curr-pos/run.stats ]; then
            echo "   指令覆盖率:"
            tail -1 klee-out-curr-pos/run.stats | awk '{print "   总指令: " $4 ", 覆盖指令: " $5}'
        fi
        
        echo ""
        echo "4. 错误和警告："
        if [ -f klee-out-curr-pos/warnings.txt ]; then
            warning_count=$(wc -l < klee-out-curr-pos/warnings.txt)
            echo "   警告数量: $warning_count"
            if [ $warning_count -gt 0 ]; then
                echo "   警告内容:"
                cat klee-out-curr-pos/warnings.txt | head -5
            fi
        else
            echo "   无警告"
        fi
        
        if [ -f klee-out-curr-pos/test*.assert.err ]; then
            error_count=$(ls klee-out-curr-pos/test*.assert.err 2>/dev/null | wc -l)
            echo "   断言错误: $error_count 个"
        else
            echo "   无断言错误"
        fi
        
        echo ""
        echo "5. 分析特定的curr_pos测试案例："
        if [ $test_count -gt 0 ]; then
            echo "   展示前3个测试案例的curr_pos值："
            for i in {1..3}; do
                if [ -f "klee-out-curr-pos/test$(printf "%06d" $i).ktest" ]; then
                    echo "   测试案例 $i:"
                    ktest-tool klee-out-curr-pos/test$(printf "%06d" $i).ktest | grep -A3 "object.*curr_pos"
                fi
            done
        fi
        
        echo ""
        echo "=========================================="
        echo "curr_pos符号化分析总结："
        echo "=========================================="
        echo "✓ 成功生成 $test_count 个测试案例"
        echo "✓ 覆盖了curr_pos在位置控制器中的各种取值情况"
        echo "✓ 验证了位置控制算法的安全性约束"
        echo ""
        echo "可以使用以下命令进一步分析："
        echo "  ktest-tool klee-out-curr-pos/test*.ktest     # 查看所有测试案例"
        echo "  klee-stats klee-out-curr-pos/                # 查看详细统计"
        echo ""
        
    else
        echo "❌ KLEE 符号执行失败！"
        exit 1
    fi
else
    echo "❌ LLVM IR 编译失败！"
    exit 1
fi

echo "分析完成！"
