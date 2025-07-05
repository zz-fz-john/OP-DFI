

###TEST
is_klee=1

###add klee/include to C_INCLUDE_PATH and CPLUS_INCLUDE_PATH
#TARGET_TRIPLE=aarch64-linux-gnu
TARGET_TRIPLE=x86_64-linux-gnu
#TARGET_TRIPLE=arm-linux-gnueabihf
current_path=$(pwd)
TEST_DIR=./test
opdfi=$current_path/
LLVM_DIR=$opdfi/toolchain/llvm-project/build
KLEE_DIR=$opdfi/toolchain/klee/build
SVF_DIR=$opdfi/toolchain/SVF
KLEE_INC=$KLEE_DIR/../include
export PATH="$LLVM_DIR/bin:$KLEE_DIR/bin:$PATH"
source ~/.bashrc
cd $TEST_DIR
NUM_OF_CODE_SWITCHES=40
NUM_OF_SYMBOLIC_INPUT=2
NUM_OF_CONSTRAINTS=16
# NUM_OF_CONSTRAINTS=160000
echo $NUM_OF_SYMBOLIC_INPUT > /tmp/num_symbolic_input
NUM_OF_CODE_VERSION=6
NUM_OF_PATH=30
rm -f /tmp/error_output
rm -f /tmp/normal_output
if [ -d "./tmp" ]; then
  rm -rf "./tmp"
fi
mkdir ./tmp

if [ -d "./compile_results" ]; then
  rm -rf "./compile_results"
fi
mkdir ./compile_results

if [ -d "./compile_results/code_versions" ]; then
  rm -rf "./compile_results/code_versions"
fi
mkdir ./compile_results/code_versions

if [ -d "./compile_results/slack_constraints" ]; then
  rm -rf "./compile_results/slack_constraints"
fi
mkdir ./compile_results/slack_constraints

if [ -d "./runtime_results" ]; then
  rm -rf "./runtime_results"
fi
mkdir ./runtime_results

###START prepare symbolic execution
echo "Preparing symbolic execution"
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/clang++ --target=$TARGET_TRIPLE -O0 -Xclang -disable-O0-optnone   -g -c -emit-llvm crsf.cpp -o ./tmp/test.bc 
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/clang --target=$TARGET_TRIPLE -I/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee/include -O0 -Xclang -disable-O0-optnone   -g -c -emit-llvm symbolic_entry.c -o ./tmp/symbolic_entry.bc 
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/clang --target=$TARGET_TRIPLE -O0 -Xclang -disable-O0-optnone   -g -c -emit-llvm driver.c -o ./tmp/driver.bc 
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/llvm-link ./tmp/test.bc ./tmp/symbolic_entry.bc -o ./tmp/symbolic_execute.bc
echo "Collecting symbolic formula"
if [ $is_klee -eq 1 ]; then
    export LD_LIBRARY_PATH=~/study/chain_attestation/OP-DFI/toolchain/stp/deps/cadical/build:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=~/study/chain_attestation/OP-DFI/toolchain/stp/deps/cadiback:$LD_LIBRARY_PATH
    /home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee/build/bin/klee  ./tmp/symbolic_execute.bc --debug-dump-stp-queries  --log-partial-queries-early --write-paths  --write-kqueries --write-smt2s  --write-sym-paths    --write-test-info   
else
  echo "Skip symbolic execution"
fi
# klee  symbolic_execute.bc --debug-dump-stp-queries  --log-partial-queries-early --write-paths  --write-kqueries --write-smt2s  --write-sym-paths    --write-test-info 1>>/tmp/normal_output 2>>/tmp/error_output
###END symbolic execution


#logging information for code version generation

#end
###START preparing slack estimation
echo "preparing slack estimation"
# cd $current_path
echo "preparing runtime formula"
python3 $opdfi/slack_estimation/prepare_formula.py  $opdfi/test/tmp/klee-last /tmp/processed_formula $NUM_OF_PATH $NUM_OF_CONSTRAINTS $NUM_OF_CODE_VERSION  


### START generate different code version according to different security policy
echo "Generating different code version according to different security policy"
code_ver_lists=()
# NUM_OF_CODE_VERSION=5
for i in $(seq 1 $NUM_OF_CODE_VERSION); do
    /home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/opt -f -enable-new-pm=0 -load $LLVM_DIR/lib/LLVMCode_version_generation.so -code_duplicate -myarg=$i ./tmp/test.bc -o ./tmp/code_ver.bc.v$i 

    # if [ $i -eq $NUM_OF_CODE_VERSION ]; then #DFI instrumentation
      echo "Generating DFI instrumentation for code version $i, and applying sandboxes"
        /home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/opt -f -enable-new-pm=0 -load $SVF_DIR/Release-build/tools/OPDFI/libdfAnalysis.so -df_analysis -version_id=$i -info_file=/tmp/processed_formula/code_version_id_coverage  ./tmp/code_ver.bc.v$i -o ./compile_results/code_versions/code_ver.bc.v$i.dfi 
        code_ver_lists+=("./compile_results/code_versions/code_ver.bc.v$i.dfi")
    # else
      #  code_ver_lists+=("./code_versions/code_ver.bc.v$i")
    # fi
    
done

code_ver_lists=$(echo "${code_ver_lists[@]}" | tr ' ' '\n' | paste -sd ' ')
echo "code_ver_lists: $code_ver_lists"


###START preparing code switching
echo "preparing code switching"
# python3 $opdfi/code_switch/helper.py $NUM_OF_CODE_VERSION /tmp/code_version_header.h
source $opdfi/code_switch/compile_codeswitch.sh $NUM_OF_CODE_VERSION
###END preparing code switching

#Post_process for code switch
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/llvm-link $code_ver_lists ./tmp/test.bc -o ./tmp/combined_code_ver.bc 
# opt -f -enable-new-pm=0 -load $LLVM_DIR/lib/LLVMCode_inform_log.so -code_info_log  -myarg=$NUM_OF_CODE_SWITCHES combined_code_ver.bc -o /tmp/trash.bc #code_ver.bc
# cp combined_code_ver.bc code_ver.bc
# NUM_OF_CODE_VERSION=5
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/opt -f -enable-new-pm=0 -load $LLVM_DIR/lib/LLVMCode_inform_log.so -code_info_log  -switch_num=$NUM_OF_CODE_SWITCHES -num_version=$NUM_OF_CODE_VERSION ./tmp/combined_code_ver.bc -o ./tmp/code_ver.bc 
###Link different generated code version into one bitcode
echo "Linking different code version into program"
# llvm-link combined_code_ver.bc symbolic_execute.bc -o code_ver.bc
# llvm-link combined_code_ver.bc symbolic_execute.bc -o code_ver.bc
# NUM_OF_CODE_VERSION=10
###compile online_estimator
echo "compiling slack estimator"
source $opdfi/slack_estimation/compile_estimator.sh 

###compile DFI library
source $SVF_DIR/tools/OPDFI/dependency_analysis/dfi_lib/compile_lib.sh 

###Insert codeswitch checkpoint

# opt -f -enable-new-pm=0 -load $LLVM_DIR/lib/LLVMCodeswitch_checkpoint.so -cp_insert  driver_code_version.bc -o driver_code_version.bc.insert

# opt -f -enable-new-pm=0 -load $LLVM_DIR/lib/LLVMCodeswitch_checkpoint.so -cp_insert  driver.bc -o driver.bc.insert
# llvm-link driver.bc.insert code_ver.bc -o driver_code_version.bc.insert
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/llvm-link ./tmp/driver.bc ./tmp/code_ver.bc -o ./tmp/driver_code_version.bc.insert 

###preparing testing program
echo "preparing testing program"
/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/llvm-project/build/bin/clang++ --target=$TARGET_TRIPLE -O0 -flto ./tmp/driver_code_version.bc.insert \
 $opdfi/slack_estimation/online_estimator.bc \
 $opdfi/code_switch/code_switch.bc \
 $SVF_DIR/tools/OPDFI/dependency_analysis/dfi_lib/dfi_lib.bc \
  -o ./compile_results/execute_me  

# ###START preparing slack estimation
# echo "preparing slack estimation"
# cd $current_path
# echo "preparing runtime formula"
# python3 $opdfi/slack_estimation/prepare_formula.py  $opdfi/test/tmp/klee-last /tmp/processed_formula $NUM_OF_CODE_VERSION $NUM_OF_CONSTRAINTS

echo "Compilation done, please run the qemu 'qemu-aarch64 -L /usr/aarch64-linux-gnu/ ./compile_results/execute_me' to test the program"
###END preparing slack estimation

