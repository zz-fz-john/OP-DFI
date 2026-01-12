LLVM_OPT=/home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/llvm-16.0/llvm-project-16.0.0/build/bin/opt 

LLVM_DIS=/home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/llvm-16.0/llvm-project-16.0.0/build/bin/llvm-dis

LLVM_CHECKPOINT_PASS=/home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/llvm-16.0/llvm-project-16.0.0/build/lib/LLVMInsertCheckPointsOnLoop.so

echo "get indirct call target set"
cd ../pre-analysis16.0/virtualcall/build || exit 1
echo "insert metadata and get direct  call-site result"
./indCallAnalysis --guid --input \
    /home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/oat-evaluation/"$1"/build/test_combo_breakconstant.ll ||exit 1
echo "get target set  of virtual indirect call-site"
mkdir -p ../output
./indCallAnalysis  --input \
    /home/zrz0517/study/chain_attestation/rt-ateest/zrz-attest/oat-evaluation/"$1"/build/test_combo_breakconstant.ll || exit 1
echo "复制输出的文件"
cp ../output/indirectcall.txt \
    ../../../oat-evaluation/"$1"/build
cp ../output/direct_call_result.txt \
    ../../../oat-evaluation/"$1"/build
cp ../output/callsite_target_map.txt \
   ../../../oat-evaluation/"$1"/build
cd ../../../oat-evaluation || exit 1
