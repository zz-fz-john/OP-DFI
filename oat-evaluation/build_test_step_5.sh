#!/bin/bash
CURRENT_DIR=$(pwd)
ROOT_DIR="${CURRENT_DIR}/.."
echo "当前目录是: $CURRENT_DIR"
TOOLCHAIN_DIR="${ROOT_DIR}/toolchains/aarch32"
echo "编译 measurement 文件"
echo "Compiling measurement-engine..."
cd ${ROOT_DIR}/measurement-engine/first-measure-in-secure-world/runtime-measure/ || { echo "Failed to enter measurement directory"; exit 1; }
make first_measure|| { echo "Make failed"; exit 1; }

echo " 编译飞控"
echo "Compiling "$1" "
cd ../../../oat-evaluation
cp sec_mask_result.txt "$1"/build
cd "$1"/build || { echo "Failed to enter  "$1" "; exit 1; }

echo "使用 llc 进行编译"
LLVM_LLC="${ROOT_DIR}/llvm-16.0/llvm-project-16.0.0/build/bin/llc"
LLVM_LIB="${ROOT_DIR}/llvm-16.0/llvm-project-16.0.0/build/lib"
echo "Running llc to compile after_insert_dummy.ll..."
#$LLVM_LLC -O0 -march=arm -mtriple=arm-linux-gnueabihf after_insert_dummy.ll -o debug.s || { echo "llc to .s failed"; exit 1; }
#无法使用-O0级别编译，因为寄存器分配会出问题

$LLVM_LLC -O0 -filetype=obj  -march=arm after_insert_dummy.ll -o after_insert_checkpoint.o 2>&1 || { echo "llc failed"; exit 1; }
# if ! output=$($LLVM_LLC -O0 -filetype=obj after_insert_dummy.ll -o after_insert_checkpoint.o 2>&1); then
#     echo "llc failed"
#     echo "$output"
#     exit 1
# fi
rm -f after_insert_checkpoint.S
$TOOLCHAIN_DIR/bin/arm-linux-gnueabihf-objdump -d  after_insert_checkpoint.o > after_insert_checkpoint.S || { echo "objdump failed"; exit 1; }
#/home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/llvm-16.0/llvm-project-16.0.0/build/bin/llc -O0 -filetype=obj after_insert_dummy.ll -o after_insert_checkpoint.o
echo "完成llc编译,进行链接"

/home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/toolchains/aarch32/arm-linux-gnueabihf/bin/ld -T arm_link_script_syringe_intermidea.txt  -EL -z relro -X --hash-style=gnu --eh-frame-hdr -m armelf_linux_eabi -dynamic-linker /lib/ld-linux-armhf.so.3 -o "$1" $TOOLCHAIN_DIR/arm-linux-gnueabihf/libc/usr/lib/Scrt1.o $TOOLCHAIN_DIR/arm-linux-gnueabihf/libc/usr/lib/crti.o $TOOLCHAIN_DIR/lib/gcc/arm-linux-gnueabihf/8.2.1/crtbeginS.o -L/usr/lib/gcc-cross/arm-linux-gnueabihf/9 -L/usr/lib/gcc-cross/arm-linux-gnueabihf/9/../../../../arm-linux-gnueabihf/lib/../lib -L/usr/lib/gcc-cross/arm-linux-gnueabihf/9/../../../../lib -L/lib/arm-linux-gnueabihf -L/lib/../lib -L/usr/lib/arm-linux-gnueabihf -L/usr/lib/../lib -L/usr/lib/gcc-cross/arm-linux-gnueabihf/9/../../../../arm-linux-gnueabihf/lib -L/lib -L/usr/lib -plugin $LLVM_LIB/LLVMgold.so -plugin-opt=mcpu=arm1176jzf-s --gc-sections -Bstatic  after_insert_checkpoint.o  ../../../measurement-engine/first-measure-in-secure-world/output/trampoline.o ../../../measurement-engine/first-measure-in-secure-world/output/CFeventSingleThread.o ../../../measurement-engine/first-measure-in-secure-world/output/data_flow.o ../../../measurement-engine/first-measure-in-secure-world/output/heap_section.o ../../../measurement-engine/first-measure-in-secure-world/output/blake2s.o ../../../measurement-engine/first-measure-in-secure-world/output/xxhash64.o ../../../measurement-engine/first-measure-in-secure-world/output/xxhash.o ../../../measurement-engine/first-measure-in-secure-world/output/dummycode.o -Bdynamic $TOOLCHAIN_DIR/arm-linux-gnueabihf/libc/lib/libm.so.6 $TOOLCHAIN_DIR/arm-linux-gnueabihf/libc/lib/libdl.so.2 $TOOLCHAIN_DIR/arm-linux-gnueabihf/lib/libstdc++.so.6 $TOOLCHAIN_DIR/arm-linux-gnueabihf/libc/lib/libm.so.6 $TOOLCHAIN_DIR/arm-linux-gnueabihf/lib/libgcc_s.so.1  $TOOLCHAIN_DIR/lib/gcc/arm-linux-gnueabihf/8.2.1/libgcc.a -lresolv -lpthread -lc $TOOLCHAIN_DIR/arm-linux-gnueabihf/lib/libgcc_s.so.1 $TOOLCHAIN_DIR/lib/gcc/arm-linux-gnueabihf/8.2.1/libgcc.a /usr/lib/gcc-cross/arm-linux-gnueabihf/9/crtendS.o $TOOLCHAIN_DIR/arm-linux-gnueabihf/libc/usr/lib/crtn.o /home/zrz0517/study/TEE/verifier_TEE/optee_client/out/export/lib/libteec.a  || exit 1

rm -f ./"$1".S
$TOOLCHAIN_DIR/bin/arm-linux-gnueabihf-objdump -d  ./"$1" > ./"$1".S || exit 1
#$TOOLCHAIN_DIR/bin/arm-linux-gnueabihf-objdump -h ./arducopter  | grep custom_ro_data
echo "用绝对地址替换只被调用一次的函数的返回指令"
cd ../../../pre-analysis16.0/util/binary_rewrite/ || { echo "Failed to enter binary rewrite directory"; exit 1; }
rm -f ../output/"$1"_output
python3 binary_rewrite.py --binary_path /home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/oat-evaluation/"$1"/build/"$1" --disassembly_file_name /home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/oat-evaluation/"$1"/build/"$1".S --only_called_once_func_file ../output/only_called_once_func.txt --ToInsertFuncFile ../output/ToInsertFunc.txt --output_binary_path ../output/"$1"_output || { echo "Binary rewrite failed"; exit 1; }
$TOOLCHAIN_DIR/bin/arm-linux-gnueabihf-objdump -d  ../output/"$1"_output > ../output/"$1"_output.S || exit 1
echo "Script execution completed successfully."
