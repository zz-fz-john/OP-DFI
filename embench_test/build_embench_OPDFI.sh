#!/bin/bash
#./build_embench_0.sh
cd bd/
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/llvm-link \
    src/"$1"/*.o \
    support/*.o \
    config/arm/boards/generic/boardsupport.o \
    config/arm/chips/generic/chipsupport.o \
    -o src/"$1"/"$1".bc
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/opt --march=arm-linux-gnueabihf -f -enable-new-pm=0 -load /home/zrz0517/study/chain_attestation/OP-DFI/toolchain/SVF/Release-build/tools/OPDFI/libdfAnalysis.so -df_analysis -version_id=1 -info_file=/tmp/processed_formula/code_version_id_coverage  src/"$1"/"$1".bc  -o src/"$1"/test_combo_after_dfi.bc

/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/clang  --target=arm-linux-gnueabihf -O0 /home/zrz0517/study/chain_attestation/OP-DFI/toolchain/SVF/tools/OPDFI/dependency_analysis/dfi_lib/dfi_lib.bc  src/"$1"/test_combo_after_dfi.bc -lm -lresolv  -lpthread -static -o src/"$1"/"$1"_opdfi 

/home/zrz0517/study/chain_attestation/toolchains/aarch32/bin/arm-linux-gnueabihf-objdump -D src/"$1"/"$1"_opdfi  > src/"$1"/"$1"-opdfi.s

# scp -P 1050 ./dfi_log.txt src/"$1"/"$1"_opdfi  pi@10.204.99.87:/home/pi
scp -P 1717 ./dfi_log.txt src/"$1"/"$1"_opdfi pi@10.204.123.190:/home/pi 
cd ../