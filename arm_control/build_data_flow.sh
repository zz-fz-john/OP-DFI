#!/bin/bash
rm -rf ./output
mkdir ./output
make data_flow_test
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/llvm-dis ./output/data_flow_test.bc -o ./output/data_flow_test.ll

/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/opt --march=arm-linux-gnueabihf -f -enable-new-pm=0 -load /home/zrz0517/study/chain_attestation/OP-DFI/toolchain/SVF/Release-build/tools/OPDFI/libdfAnalysis.so -df_analysis -version_id=1 -info_file=/tmp/processed_formula/code_version_id_coverage  ./output/data_flow_test.bc  -o ./output/data_flow_test_after_dfi.bc

/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/llvm-dis ./output/data_flow_test_after_dfi.bc -o ./output/data_flow_test_after_dfi.ll

/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/clang  --target=arm-linux-gnueabihf -O0 /home/zrz0517/study/chain_attestation/OP-DFI/toolchain/SVF/tools/OPDFI/dependency_analysis/dfi_lib/dfi_lib.bc  ./output/data_flow_test_after_dfi.bc -lm -lresolv  -lpthread -static -o ./output/data_flow_test_opdfi

/home/zrz0517/study/chain_attestation/toolchains/aarch32/bin/arm-linux-gnueabihf-objdump -D ./output/data_flow_test_opdfi  > ./output/data_flow_test-opdfi.s

scp -P 1717 ./dfi_log.txt ./output/data_flow_test_opdfi pi@10.204.20.129:/home/pi 
