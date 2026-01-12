#!/bin/bash

# 编译 update_xy_controller 符号执行脚本
# 设置环境变量
export KLEE_HOME=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee
export KLEE_BUILD=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee/build
export LLVM_HOME=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build
export PATH=$LLVM_HOME/bin:$KLEE_BUILD/bin:$PATH

# 进入工作目录
cd /home/zrz0517/study/chain_attestation/OP-DFI/copter_klee_entry

echo "编译 update_xy_controller 符号执行文件..."

# 编译为 LLVM IR
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone \
    -I$KLEE_HOME/include \
    update_xy_controller_symbolic.c \
    -o update_xy_controller_symbolic.bc

if [ $? -eq 0 ]; then
    echo "LLVM IR 编译成功: update_xy_controller_symbolic.bc"
    
    echo "开始 KLEE 符号执行..."
    export LD_LIBRARY_PATH=~/study/chain_attestation/OP-DFI/toolchain/stp/deps/cadical/build:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=~/study/chain_attestation/OP-DFI/toolchain/stp/deps/cadiback:$LD_LIBRARY_PATH
    # 运行 KLEE 符号执行
    /home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee/build/bin/klee \
        --output-dir=klee-out-xy-controller \
        --write-smt2s \
        --write-cvcs \
        --write-cov \
        --optimize \
        --max-time=60 \
        --max-memory=1000 \
        --search=dfs \
        --solver-backend=stp \
        update_xy_controller_symbolic.bc
    
    if [ $? -eq 0 ]; then
        echo "KLEE 符号执行完成！"
        echo "结果保存在: klee-out-xy-controller/"
        echo ""
        echo "执行统计:"
        ls -la klee-out-xy-controller/
        echo ""
        echo "测试案例数量:"
        ls klee-out-xy-controller/*.ktest 2>/dev/null | wc -l
        echo ""
        echo "错误信息:"
        cat klee-out-xy-controller/warnings.txt 2>/dev/null || echo "无警告"
    else
        echo "KLEE 符号执行失败！"
        exit 1
    fi
else
    echo "LLVM IR 编译失败！"
    exit 1
fi
