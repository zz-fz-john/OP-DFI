
# please first build llvm, and upgrade cmake to 3.28, then
cd toolchain
git clone https://github.com/klee/klee
cd klee
git checkout fc83f06b17221bf5ef20e30d9da1ccff927beb17
git apply ../../KLEE_patch/*

#build uClibc
cd toolchain
git clone https://github.com/klee/klee-uclibc.git
cd klee-uclibc
./configure --make-llvm-lib
make -j2


#follow https://github.com/stp/stp to build STP.
cd toolchain
git clone https://github.com/stp/stp
cd stp
git submodule init && git submodule update
./scripts/deps/setup-gtest.sh
./scripts/deps/setup-outputcheck.sh
#use gcc-10
./scripts/deps/setup-cms.sh
./scripts/deps/setup-minisat.sh
mkdir build
cd build
# use python3
## add comment in stp/tools/stp_simple/CMakeLists.txt
#修改 target_link_libraries(stp_simple-bin  stp)为 target_link_libraries(stp_simple-bin PUBLIC stp)
## 并在该行后添加
    # find_library(DL_LIBRARY dl)
    # if(DL_LIBRARY)
    #     target_link_libraries(stp_simple-bin PUBLIC ${DL_LIBRARY})
    # endif()
#修改 stp/tools/stp/CMakeLists.txt
#修改 target_link_libraries(stp-bin  stp Boost::program_options)为 target_link_libraries(stp-bin PUBLIC stp Boost::program_options)
#并在该行后添加
    # find_library(DL_LIBRARY dl)
    # if(DL_LIBRARY)
    #     target_link_libraries(stp-bin PUBLIC ${DL_LIBRARY})
    # endif()
cmake ..
cmake --build .
export STP_DIR=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/stp/build
export LD_LIBRARY_PATH="$STP_DIR/lib:$LD_LIBRARY_PATH"


#build libc++ ， do :pip3 install wllvm
cd toolchain
LLVM_VERSION=13 BASE=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/LIBCXX_DIR ENABLE_OPTIMIZED=1 DISABLE_ASSERTIONS=1 ENABLE_DEBUG=0 REQUIRES_RTTI=1 klee/scripts/build/build.sh libcxx

#finally, build klee
#在klee/CMakeLists.txt中修改
#在if (${HAVE_GPERFTOOLS_MALLOC_EXTENSION_H})前添加
  # if (EXISTS "${TCMALLOC_INCLUDE_DIR}/gperftools/malloc_extension.h")
  #   set(HAVE_GPERFTOOLS_MALLOC_EXTENSION_H TRUE)
  # else()
  #   set(HAVE_GPERFTOOLS_MALLOC_EXTENSION_H FALSE)
  # endif()
#sudo apt install libsqlite3-dev
#pip3 install lit
cd klee
mkdir build && cd build
cmake -DENABLE_SOLVER_STP=ON -DENABLE_POSIX_RUNTIME=ON -DKLEE_UCLIBC_PATH=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee-uclibc \
 -DENABLE_UNIT_TESTS=OFF  -DENABLE_KLEE_LIBCXX=ON \
  -DKLEE_LIBCXX_DIR=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/LIBCXX_DIR/libc++-install-130 \
 -DKLEE_LIBCXX_INCLUDE_DIR=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/LIBCXX_DIR/libc++-install-130/include/c++/v1 \
 -DENABLE_KLEE_EH_CXX=ON -DKLEE_LIBCXXABI_SRC_DIR=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/LIBCXX_DIR/llvm-130/libcxxabi \
 -DLLVM_DIR=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build \
  .. 

make -j2
#test
export LD_LIBRARY_PATH=~/study/chain_attestation/OP-DFI/toolchain/stp/deps/cadical/build:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=~/study/chain_attestation/OP-DFI/toolchain/stp/deps/cadiback:$LD_LIBRARY_PATH
klee --version