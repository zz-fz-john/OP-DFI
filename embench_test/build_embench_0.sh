

./build_all.py \
     --arch=arm \
     --chip=generic \
     --board=generic \
     --cc="/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/clang" \
     --ld="/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/clang" \
     --cflags="-O0 -flto  -g -gdwarf-4 -flto -fno-discard-value-names -fembed-bitcode -fno-exceptions -fno-jump-tables -fno-inline -emit-llvm -c --target=arm-linux-gnueabihf -mcpu=cortex-a53 -I/usr/arm-linux-gnueabihf/include -mfloat-abi=hard -g0 -gdwarf-4 -v"

