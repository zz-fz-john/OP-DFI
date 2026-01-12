#!/bin/bash
CURRENT_DIR=$(pwd)
ROOT_DIR="${CURRENT_DIR}/.."
echo "当前目录是: $CURRENT_DIR"
TOOLCHAIN_DIR="${ROOT_DIR}/toolchains/aarch32"
echo "生成离线证据"
cd ../pre-analysis16.0/util/generate_final_hash/ || { echo "Failed to enter generate_final_hash directory"; exit 1; }
echo "生成配置文件"
rm -f ../output/hash_database_single_on_server_"$1".txt
python3 gen_config.py ../output/"$1"_output.S --binary-file ../output/"$1"_output --program-header "$1".ph -o ../output/replay_single.cfg
echo "重执行生成数据库"
echo "-o:目标文件"
echo "-c: gen_config.py生成的配置文件"
echo "-bf:最终需要分析的二进制文件"
python3 generate_offline_database_no_threshold.py  -c ../output/replay_single.cfg -l -o ../output/hash_database_single_on_server_"$1".txt -bf ../output/"$1"_output -dis ../output/"$1"_output.S ../output/"$1"_output  -v -v -v
echo "过滤掉重复的哈希值"
python3 ReWriteDataBase.py -i ../output/hash_database_single_on_server_"$1".txt -o ../output/final_hash_database_single_on_server_"$1".txt