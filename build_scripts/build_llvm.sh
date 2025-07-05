#安装依赖
sudo apt-get install libgmp-dev libmpfr-dev texinfo bison flex
cd  ~
mkdir gold
cd gold
#下载仓库
git clone --depth 1 https://sourceware.org/git/binutils-gdb.git binutils
#进行编译,建议将gcc和g++版本都改为7.5
cd binutils && mkdir build && cd build
../configure --enable-gold --enable-plugins --disable-werror
make all  
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
cmake -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="lld;llvm;clang" -DLLVM_TARGETS_TO_BUILD="all"   -DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON -DLLVM_BINUTILS_INCDIR=/home/zrz0517/gold/binutils/include  -DLLVM_ENABLE_LTO=ON ../llvm
make -j2