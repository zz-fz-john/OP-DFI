cd ../pre-analysis16.0/util/static_analysis ||exit 1
mkdir -p ../output
echo "合并svf间接调用、llvm-cfi以及deep-type结果"#有问题，不执行,svf分析已经集成到了前面的间接调用分析中
#python3 merge_static_analysis_result.py
echo "获得调用子图以及相关函数"
python3 find_func_in_path.py --avoid_handle_function ../../../oat-evaluation/"$1"/build/avoid_handle_function.txt \
    --mainjob_file_path ../../../oat-evaluation/"$1"/build/critical_function.txt \
    --recursive_func_file ../output/recursive_header_func.txt \
    --indirect_file ../../virtualcall/output/indirectcall.txt \
    --direct_file ../../virtualcall/output/direct_call_result.txt \
    --ToInsertFuncFile ../output/ToInsertFunc.txt ||exit 1
cp ../output/ToInsertFunc.txt ../../../oat-evaluation/"$1"/build/ToInsertFunc.txt
cp ../output/recursive_header_func.txt ../../../oat-evaluation/"$1"/build/recursive_function.txt
cp ../output/only_called_once_func.txt ../../../oat-evaluation/"$1"/build/only_called_once_func.txt
cp ../output/leaf_func.txt  ../../../oat-evaluation/"$1"/build/leaf_func.txt
