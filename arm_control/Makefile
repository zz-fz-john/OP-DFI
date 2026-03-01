LLC_ARM=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/llc
DYNAMIC_LLC_ARM=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/llc
LLC_ARM_ORG=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/llc
LLVM_BIN=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin
LLVM_BIN_DYNAMIC=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/
LLVM_BIN_ORG=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/
INSERT_CHECK_POINT_ON_LOOP=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/lib/LLVMInsertCheckPointsOnLoop.so
INSERT_DUMMY_CODE=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/lib/LLVMInsertCheckPointsOnLoop.so
LLVM_BIN_ORG=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/
cc=$(LLVM_BIN_ORG)/clang
ccc=/home/zrz0517/TEE/optee-v3.4/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc
CCCC=/home/zrz0517/TEE/optee-v3.4/toolchains/aarch32/bin/arm-linux-gnueabihf-g++
RESERVE_R8 = -ffixed-r8
#_backup为没有进行插桩的程序

bc-threadtest: threadtest.cpp
	/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/clang -O0 -emit-llvm -c threadtest.cpp -o ./output/threadtest.bc
data_flow_test:data_flow_test.c
	$(LLVM_BIN)/clang --target=arm-linux-gnueabihf -emit-llvm -c -O0 -flto -g -gdwarf-4 -fwhole-program-vtables  -fno-discard-value-names -fno-omit-frame-pointer  -fwhole-program-vtables -fno-exceptions  -fno-jump-tables -fno-inline -fno-inline-functions data_flow_test.c  -o ./output/data_flow_test.bc


clean:
	rm ./output/*

