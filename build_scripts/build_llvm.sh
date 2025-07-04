cd toolchain
git clone  https://github.com/llvm/llvm-project
cd llvm-project
git checkout 75e33f71c2dae584b13a7d1186ae0a038ba98838
git apply ../../LLVM_patch/*
#修改/llvm/lib/Transforms/code_switch_llvmpasses/helper_information_log/CMakeLists.txt
# include_directories(/home/opdfi/toolchain/json/include)
# 改为：include_directories(/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/external/nlohmann/)
#use gcc-7
mkdir build
cd build
cmake -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="lld;llvm;clang" -DLLVM_TARGETS_TO_BUILD=ARM  -DLLVM_ENABLE_LTO=ON ../llvm
make -j2