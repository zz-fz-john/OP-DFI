#!/bin/bash
cd "$1"
rm -rf build
mkdir build
make test-combo

/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/opt --march=arm-linux-gnueabihf -f -enable-new-pm=0 -load /home/zrz0517/study/chain_attestation/OP-DFI/toolchain/SVF/Release-build/tools/OPDFI/libdfAnalysis.so -df_analysis -version_id=1 -info_file=/tmp/processed_formula/code_version_id_coverage  ./build/test_combo.bc  -o ./build/test_combo_after_dfi.bc

/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/clang  --target=arm-linux-gnueabihf -O0 /home/zrz0517/study/chain_attestation/OP-DFI/toolchain/SVF/tools/OPDFI/dependency_analysis/dfi_lib/dfi_lib.bc  ./build/test_combo_after_dfi.bc -lm -lresolv  -lpthread -o ./build/"$1"_opdfi -v 

/home/zrz0517/study/chain_attestation/toolchains/aarch32/bin/arm-linux-gnueabihf-objdump -D ./build/"$1"_opdfi > ./build/"$1"-opdfi.s

scp -P 1717 ./dfi_log.txt ./build/"$1"_opdfi  pi@10.204.123.190:/home/pi

cd ../