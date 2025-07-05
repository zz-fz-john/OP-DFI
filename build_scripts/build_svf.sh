
cd toolchain
git clone  https://github.com/SVF-tools/SVF
cd SVF
git checkout 06920202d216e003efcac1469fc78b12904cd2c6
git apply ../../SVF_patch/*
export LLVM_DIR=/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build
#修改build.sh,删除set -e
#添加：LLVM_DIR=../llvm-project/
#在tools/DDA/CMakeLists.txt中修改
#删除：target_link_libraries( dvf Svf ${llvm_libs} )
#添加：
# find_package(Threads REQUIRED)

# target_link_libraries(dvf
#   PRIVATE
#     Svf
#     ${llvm_libs}
#     Threads::Threads
# )
#在tools/SABER/CMakeLists.txt中修改
#删除：target_link_libraries( saber Svf ${llvm_libs})
#添加：
    # find_package(Threads REQUIRED)
    # target_link_libraries( saber
    #     PRIVATE
    #         Svf
    #         ${llvm_libs}
    #         Threads::Threads       
    # )
source build.sh