#!/bin/bash
#use to get bc file
echo "Running build_test_step_0.sh script..."
LLVM_OPT=/home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/llvm-16.0/llvm-project-16.0.0/build/bin/opt 

LLVM_DIS=/home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/llvm-16.0/llvm-project-16.0.0/build/bin/llvm-dis

LLVM_CHECKPOINT_PASS=/home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/llvm-16.0/llvm-project-16.0.0/build/lib/LLVMInsertCheckPointsOnLoop.so
cd "$1" || exit 1
make clean
mkdir -p build
make test-combo
cd build
/home/zrz0517/llvm-arm-cross/llvm-project-16.0.0/build/bin/llvm-dis test_combo.bc -o test_combo.ll || exit 1
/home/zrz0517/llvm-arm-cross/llvm-project-16.0.0/build/bin/clang test_combo.ll -O3 -target arm-linux-gnueabihf  -lm -lresolv  -lpthread -o "$1"_test_combo ||exit 1

$LLVM_OPT -S -passes=wholeprogramdevirt -whole-program-visibility -wholeprogramdevirt-summary-action=export -opaque-pointers=0 test_combo.bc -o after_devirt.ll ||exit 1


$LLVM_OPT -S  -passes="mergereturn" -opaque-pointers=0 after_devirt.ll -o after_merge.ll || exit 1
$LLVM_OPT -load $LLVM_CHECKPOINT_PASS --Break-Constant-GEPs -enable-new-pm=0 -opaque-pointers=0 after_merge.ll -o test_combo_breakconstant.bc ||exit 1

$LLVM_DIS -opaque-pointers=0 test_combo_breakconstant.bc -o test_combo_breakconstant.ll ||exit 1


$LLVM_OPT -load $LLVM_CHECKPOINT_PASS  --generate-process-function -enable-new-pm=0 -opaque-pointers=0 test_combo_breakconstant.ll ||exit 1

echo "完成了对IR的预处理"
cd ../..

