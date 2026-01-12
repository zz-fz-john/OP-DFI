#!/bin/bash
scp -r ../pre-analysis16.0/util/generate_final_hash/ zrz0517@10.195.199.0:/home/zrz0517/study/chain_attestation/zrz-ateest/util
scp -r ../pre-analysis16.0/util/tools zrz0517@10.195.199.0:/home/zrz0517/study/chain_attestation/zrz-ateest/util
scp -r   ../pre-analysis16.0/util/output/rc-cb_output \
         ../pre-analysis16.0/util/output/rc-cb_output.S \
         ../pre-analysis16.0/util/output/after_insert_dummy.ll \
         ../pre-analysis16.0/util/output/only_called_once_func_backup.txt \
          ../pre-analysis16.0/util/output/ToInsertFunc.txt \
        zrz0517@10.195.199.0:/home/zrz0517/study/chain_attestation/zrz-ateest/util/output
scp -r ../pre-analysis16.0/virtualcall/output/indirectcall.txt  zrz0517@10.195.199.0:/home/zrz0517/study/chain_attestation/zrz-ateest/virtualcall/output
scp  ../pre-analysis16.0/util/output/rc-cb_output.S ../pre-analysis16.0/util/output/rc-cb_output zrz0517@10.195.199.0:/home/zrz0517/study/chain_attestation/zrz-ateest/util/output

cd /home/zrz0517/study/chain_attestation/zrz-ateest/util/generate_final_hash
rm  ../output/hash_database_single_on_server_rc-cb.txt
python3 gen_config.py ../output/rc-cb_output.S --binary-file ../output/rc-cb_output --program-header rc-cb.ph -o ../output/replay_single.cfg ||exit 1
echo "重执行生成数据库"
echo "-o:目标文件"
echo "-c: gen_config.py生成的配置文件"
echo "-bf:最终需要分析的二进制文件"
python3 generate_offline_database_no_threshold.py  -c ../output/replay_single.cfg -l -o ../output/hash_database_single_on_server_rc-cb.txt -bf ../output/rc-cb_output -dis ../output/rc-cb_output.S ../output/rc-cb_output  -v -v -v ||exit 1
echo "过滤掉重复的哈希值"
python3 ReWriteDataBase.py -i ../output/hash_database_single_on_server_rc-cb.txt -o ../output/final_hash_database_single_on_server_rc-cb.txt ||exit 1