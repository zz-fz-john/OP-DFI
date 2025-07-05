if [ -d "./test" ]; then
  rm -rf "./test"
fi
mkdir ./test    
cp ./src_test/* ./test/
# source ../src_test/run.sh
source ./test/start_test.sh

