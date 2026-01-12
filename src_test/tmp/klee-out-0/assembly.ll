; ModuleID = './tmp/symbolic_execute.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%struct.crsf_frame_t = type { %struct.crsf_frame_header_t, i8, [27 x i8] }
%struct.crsf_frame_header_t = type { i8, i8 }

@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_crsf.cpp, i8* null }]
@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@_ZL10crsf_frame = internal global %struct.crsf_frame_t zeroinitializer, align 1, !dbg !7
@_ZL22current_frame_position = internal global i32 0, align 4, !dbg !52
@_ZL12parser_state = internal global i8 0, align 1, !dbg !54
@.str = private unnamed_addr constant [3 x i8] c"s0\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"s1\00", align 1
@__dso_handle = hidden global i8* null, align 8, !dbg !897

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_crsf.cpp() #0 section ".text.startup" !dbg !917 {
entry:
  call void @__cxx_global_var_init(), !dbg !919
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !920 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1) @_ZStL8__ioinit), !dbg !921
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* bitcast (i8** @__dso_handle to i8*)) #3, !dbg !923
  ret void, !dbg !921
}

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local zeroext i8 @_Z11crc8_dvb_s2hh(i8 zeroext %crc, i8 zeroext %a) #4 !dbg !924 {
entry:
  %crc.addr = alloca i8, align 1
  %a.addr = alloca i8, align 1
  %i = alloca i32, align 4
  store i8 %crc, i8* %crc.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %crc.addr, metadata !928, metadata !DIExpression()), !dbg !929
  store i8 %a, i8* %a.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %a.addr, metadata !930, metadata !DIExpression()), !dbg !931
  %0 = load i8, i8* %a.addr, align 1, !dbg !932
  %conv = zext i8 %0 to i32, !dbg !932
  %1 = load i8, i8* %crc.addr, align 1, !dbg !933
  %conv1 = zext i8 %1 to i32, !dbg !933
  %xor = xor i32 %conv1, %conv, !dbg !933
  %conv2 = trunc i32 %xor to i8, !dbg !933
  store i8 %conv2, i8* %crc.addr, align 1, !dbg !933
  call void @llvm.dbg.declare(metadata i32* %i, metadata !934, metadata !DIExpression()), !dbg !936
  store i32 0, i32* %i, align 4, !dbg !936
  br label %for.cond, !dbg !937

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !938
  %cmp = icmp slt i32 %2, 8, !dbg !940
  br i1 %cmp, label %for.body, label %for.end, !dbg !941

for.body:                                         ; preds = %for.cond
  %3 = load i8, i8* %crc.addr, align 1, !dbg !942
  %conv3 = zext i8 %3 to i32, !dbg !942
  %and = and i32 %conv3, 128, !dbg !945
  %tobool = icmp ne i32 %and, 0, !dbg !942
  br i1 %tobool, label %if.then, label %if.else, !dbg !946

if.then:                                          ; preds = %for.body
  %4 = load i8, i8* %crc.addr, align 1, !dbg !947
  %conv4 = zext i8 %4 to i32, !dbg !947
  %shl = shl i32 %conv4, 1, !dbg !949
  %xor5 = xor i32 %shl, 213, !dbg !950
  %conv6 = trunc i32 %xor5 to i8, !dbg !951
  store i8 %conv6, i8* %crc.addr, align 1, !dbg !952
  br label %for.inc, !dbg !953

if.else:                                          ; preds = %for.body
  %5 = load i8, i8* %crc.addr, align 1, !dbg !954
  %conv7 = zext i8 %5 to i32, !dbg !954
  %shl8 = shl i32 %conv7, 1, !dbg !954
  %conv9 = trunc i32 %shl8 to i8, !dbg !954
  store i8 %conv9, i8* %crc.addr, align 1, !dbg !954
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %6 = load i32, i32* %i, align 4, !dbg !956
  %inc = add nsw i32 %6, 1, !dbg !956
  store i32 %inc, i32* %i, align 4, !dbg !956
  br label %for.cond, !dbg !957, !llvm.loop !958

for.end:                                          ; preds = %for.cond
  %7 = load i8, i8* %crc.addr, align 1, !dbg !961
  ret i8 %7, !dbg !962
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local zeroext i8 @_Z15crc8_dvb_s2_bufPhi(i8* %buf, i32 %len) #4 !dbg !963 {
entry:
  %buf.addr = alloca i8*, align 8
  %len.addr = alloca i32, align 4
  %crc = alloca i8, align 1
  %i = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !966, metadata !DIExpression()), !dbg !967
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !968, metadata !DIExpression()), !dbg !969
  call void @llvm.dbg.declare(metadata i8* %crc, metadata !970, metadata !DIExpression()), !dbg !971
  store i8 0, i8* %crc, align 1, !dbg !971
  call void @llvm.dbg.declare(metadata i32* %i, metadata !972, metadata !DIExpression()), !dbg !974
  store i32 0, i32* %i, align 4, !dbg !974
  br label %for.cond, !dbg !975

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32, i32* %i, align 4, !dbg !976
  %1 = load i32, i32* %len.addr, align 4, !dbg !978
  %cmp = icmp slt i32 %0, %1, !dbg !979
  br i1 %cmp, label %for.body, label %for.end, !dbg !980

for.body:                                         ; preds = %for.cond
  %2 = load i8, i8* %crc, align 1, !dbg !981
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !983
  %4 = load i32, i32* %i, align 4, !dbg !984
  %idxprom = sext i32 %4 to i64, !dbg !983
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom, !dbg !983
  %5 = load i8, i8* %arrayidx, align 1, !dbg !983
  %call = call zeroext i8 @_Z11crc8_dvb_s2hh(i8 zeroext %2, i8 zeroext %5), !dbg !985
  store i8 %call, i8* %crc, align 1, !dbg !986
  %6 = load i32, i32* %i, align 4, !dbg !987
  %inc = add nsw i32 %6, 1, !dbg !987
  store i32 %inc, i32* %i, align 4, !dbg !987
  br label %for.cond, !dbg !988, !llvm.loop !989

for.end:                                          ; preds = %for.cond
  %7 = load i8, i8* %crc, align 1, !dbg !991
  ret i8 %7, !dbg !992
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local i32 @_Z11crsf_configi(i32 %uart_fd) #4 !dbg !993 {
entry:
  %uart_fd.addr = alloca i32, align 4
  store i32 %uart_fd, i32* %uart_fd.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %uart_fd.addr, metadata !994, metadata !DIExpression()), !dbg !995
  ret i32 1, !dbg !996
}

; Function Attrs: mustprogress noinline uwtable
define dso_local void @invoke_by_external(i32 %now, i32 %len) #6 !dbg !997 {
entry:
  %now.addr = alloca i32, align 4
  %len.addr = alloca i32, align 4
  %frame = alloca [512 x i8], align 16
  %values = alloca [512 x i16], align 16
  %num_values = alloca i32, align 4
  %max_channels = alloca i32, align 4
  store i32 %now, i32* %now.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %now.addr, metadata !1000, metadata !DIExpression()), !dbg !1001
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !1002, metadata !DIExpression()), !dbg !1003
  call void @llvm.dbg.declare(metadata [512 x i8]* %frame, metadata !1004, metadata !DIExpression()), !dbg !1009
  %0 = bitcast [512 x i8]* %frame to i8*, !dbg !1009
  %1 = call i8* @memset(i8* %0, i32 0, i64 512), !dbg !1009
  call void @llvm.dbg.declare(metadata [512 x i16]* %values, metadata !1010, metadata !DIExpression()), !dbg !1012
  %2 = bitcast [512 x i16]* %values to i8*, !dbg !1012
  %3 = call i8* @memset(i8* %2, i32 0, i64 1024), !dbg !1012
  call void @llvm.dbg.declare(metadata i32* %num_values, metadata !1013, metadata !DIExpression()), !dbg !1014
  store i32 100, i32* %num_values, align 4, !dbg !1014
  call void @llvm.dbg.declare(metadata i32* %max_channels, metadata !1015, metadata !DIExpression()), !dbg !1016
  store i32 10, i32* %max_channels, align 4, !dbg !1016
  %4 = load i32, i32* %now.addr, align 4, !dbg !1017
  %conv = sext i32 %4 to i64, !dbg !1017
  %arraydecay = getelementptr inbounds [512 x i8], [512 x i8]* %frame, i64 0, i64 0, !dbg !1018
  %5 = load i32, i32* %len.addr, align 4, !dbg !1019
  %6 = load i32, i32* %now.addr, align 4, !dbg !1020
  %add = add nsw i32 %5, %6, !dbg !1021
  %arraydecay1 = getelementptr inbounds [512 x i16], [512 x i16]* %values, i64 0, i64 0, !dbg !1022
  %7 = bitcast i32* %num_values to i16*, !dbg !1023
  %8 = load i32, i32* %max_channels, align 4, !dbg !1024
  %conv2 = trunc i32 %8 to i16, !dbg !1024
  %call = call zeroext i1 @_Z10crsf_parsemPKhiPtS1_t(i64 %conv, i8* %arraydecay, i32 %add, i16* %arraydecay1, i16* %7, i16 zeroext %conv2), !dbg !1025
  ret void, !dbg !1026
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #7

; Function Attrs: mustprogress noinline uwtable
define dso_local zeroext i1 @_Z10crsf_parsemPKhiPtS1_t(i64 %now, i8* %frame, i32 %len, i16* %values, i16* %num_values, i16 zeroext %max_channels) #6 !dbg !1027 {
entry:
  %retval = alloca i1, align 1
  %now.addr = alloca i64, align 8
  %frame.addr = alloca i8*, align 8
  %len.addr = alloca i32, align 4
  %values.addr = alloca i16*, align 8
  %num_values.addr = alloca i16*, align 8
  %max_channels.addr = alloca i16, align 2
  %ret = alloca i8, align 1
  %crsf_frame_ptr = alloca i8*, align 8
  %len_checked = alloca i8, align 1
  %current_len = alloca i32, align 4
  %i = alloca i32, align 4
  store i64 %now, i64* %now.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %now.addr, metadata !1033, metadata !DIExpression()), !dbg !1034
  store i8* %frame, i8** %frame.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %frame.addr, metadata !1035, metadata !DIExpression()), !dbg !1036
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !1037, metadata !DIExpression()), !dbg !1038
  store i16* %values, i16** %values.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %values.addr, metadata !1039, metadata !DIExpression()), !dbg !1040
  store i16* %num_values, i16** %num_values.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %num_values.addr, metadata !1041, metadata !DIExpression()), !dbg !1042
  store i16 %max_channels, i16* %max_channels.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %max_channels.addr, metadata !1043, metadata !DIExpression()), !dbg !1044
  call void @llvm.dbg.declare(metadata i8* %ret, metadata !1045, metadata !DIExpression()), !dbg !1046
  store i8 0, i8* %ret, align 1, !dbg !1046
  call void @llvm.dbg.declare(metadata i8** %crsf_frame_ptr, metadata !1047, metadata !DIExpression()), !dbg !1048
  store i8* getelementptr inbounds (%struct.crsf_frame_t, %struct.crsf_frame_t* @_ZL10crsf_frame, i32 0, i32 0, i32 0), i8** %crsf_frame_ptr, align 8, !dbg !1048
  call void @llvm.dbg.declare(metadata i8* %len_checked, metadata !1049, metadata !DIExpression()), !dbg !1050
  store i8 0, i8* %len_checked, align 1, !dbg !1050
  br label %while.cond, !dbg !1051

while.cond:                                       ; preds = %if.end14, %entry
  %0 = load i32, i32* %len.addr, align 4, !dbg !1052
  %cmp = icmp sgt i32 %0, 0, !dbg !1053
  br i1 %cmp, label %while.body, label %while.end, !dbg !1051

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i32* %current_len, metadata !1054, metadata !DIExpression()), !dbg !1057
  %1 = load i32, i32* %len.addr, align 4, !dbg !1058
  %conv = sext i32 %1 to i64, !dbg !1058
  %2 = load i32, i32* @_ZL22current_frame_position, align 4, !dbg !1058
  %conv1 = sext i32 %2 to i64, !dbg !1058
  %sub = sub i64 30, %conv1, !dbg !1058
  %cmp2 = icmp ult i64 %conv, %sub, !dbg !1058
  br i1 %cmp2, label %cond.true, label %cond.false, !dbg !1058

cond.true:                                        ; preds = %while.body
  %3 = load i32, i32* %len.addr, align 4, !dbg !1058
  %conv3 = sext i32 %3 to i64, !dbg !1058
  br label %cond.end, !dbg !1058

cond.false:                                       ; preds = %while.body
  %4 = load i32, i32* @_ZL22current_frame_position, align 4, !dbg !1058
  %conv4 = sext i32 %4 to i64, !dbg !1058
  %sub5 = sub i64 30, %conv4, !dbg !1058
  br label %cond.end, !dbg !1058

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %conv3, %cond.true ], [ %sub5, %cond.false ], !dbg !1058
  %conv6 = trunc i64 %cond to i32, !dbg !1058
  store i32 %conv6, i32* %current_len, align 4, !dbg !1057
  %5 = load i32, i32* %current_len, align 4, !dbg !1059
  %6 = load i32, i32* @_ZL22current_frame_position, align 4, !dbg !1060
  %add = add nsw i32 %6, %5, !dbg !1060
  store i32 %add, i32* @_ZL22current_frame_position, align 4, !dbg !1060
  %7 = load i32, i32* %len.addr, align 4, !dbg !1061
  %cmp7 = icmp sgt i32 %7, 96, !dbg !1063
  br i1 %cmp7, label %if.then, label %if.end, !dbg !1064

if.then:                                          ; preds = %cond.end
  store i32 96, i32* %len.addr, align 4, !dbg !1065
  call void @_Z18handle_error_inputv(), !dbg !1067
  br label %if.end, !dbg !1068

if.end:                                           ; preds = %if.then, %cond.end
  %8 = load i32, i32* %current_len, align 4, !dbg !1069
  %cmp8 = icmp eq i32 %8, 0, !dbg !1071
  br i1 %cmp8, label %if.then9, label %if.end11, !dbg !1072

if.then9:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1073, metadata !DIExpression()), !dbg !1076
  store i32 0, i32* %i, align 4, !dbg !1076
  br label %for.cond, !dbg !1077

for.cond:                                         ; preds = %for.inc, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !1078
  %10 = load i32, i32* @_ZL22current_frame_position, align 4, !dbg !1080
  %cmp10 = icmp slt i32 %9, %10, !dbg !1081
  br i1 %cmp10, label %for.inc, label %for.end, !dbg !1082

for.inc:                                          ; preds = %for.cond
  %11 = load i32, i32* %i, align 4, !dbg !1083
  %inc = add nsw i32 %11, 1, !dbg !1083
  store i32 %inc, i32* %i, align 4, !dbg !1083
  br label %for.cond, !dbg !1084, !llvm.loop !1085

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @_ZL22current_frame_position, align 4, !dbg !1087
  store i8 0, i8* @_ZL12parser_state, align 1, !dbg !1088
  store i1 false, i1* %retval, align 1, !dbg !1089
  br label %return, !dbg !1089

if.end11:                                         ; preds = %if.end
  %12 = load i32, i32* %len.addr, align 4, !dbg !1090
  %sub12 = sub nsw i32 %12, 4, !dbg !1090
  store i32 %sub12, i32* %len.addr, align 4, !dbg !1090
  %13 = load i32, i32* %current_len, align 4, !dbg !1091
  %14 = load i8*, i8** %frame.addr, align 8, !dbg !1092
  %idx.ext = sext i32 %13 to i64, !dbg !1092
  %add.ptr = getelementptr inbounds i8, i8* %14, i64 %idx.ext, !dbg !1092
  store i8* %add.ptr, i8** %frame.addr, align 8, !dbg !1092
  %15 = load i16*, i16** %values.addr, align 8, !dbg !1093
  %16 = load i16*, i16** %num_values.addr, align 8, !dbg !1095
  %17 = load i16, i16* %max_channels.addr, align 2, !dbg !1096
  %call = call zeroext i1 @_ZL17crsf_parse_bufferPtS_t(i16* %15, i16* %16, i16 zeroext %17), !dbg !1097
  br i1 %call, label %if.then13, label %if.end14, !dbg !1098

if.then13:                                        ; preds = %if.end11
  store i8 1, i8* %ret, align 1, !dbg !1099
  br label %if.end14, !dbg !1101

if.end14:                                         ; preds = %if.then13, %if.end11
  br label %while.cond, !dbg !1051, !llvm.loop !1102

while.end:                                        ; preds = %while.cond
  %18 = load i8, i8* %ret, align 1, !dbg !1104
  %tobool = trunc i8 %18 to i1, !dbg !1104
  store i1 %tobool, i1* %retval, align 1, !dbg !1105
  br label %return, !dbg !1105

return:                                           ; preds = %while.end, %for.end
  %19 = load i1, i1* %retval, align 1, !dbg !1106
  ret i1 %19, !dbg !1106
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z18handle_error_inputv() #4 !dbg !1107 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1108, metadata !DIExpression()), !dbg !1110
  store i32 0, i32* %i, align 4, !dbg !1110
  br label %for.cond, !dbg !1111

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1112
  %cmp = icmp slt i32 %0, 10000, !dbg !1114
  br i1 %cmp, label %for.inc, label %for.end, !dbg !1115

for.inc:                                          ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !1116
  %inc = add nsw i32 %1, 1, !dbg !1116
  store i32 %inc, i32* %i, align 4, !dbg !1116
  br label %for.cond, !dbg !1117, !llvm.loop !1118

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1120
}

; Function Attrs: mustprogress noinline nounwind uwtable
define internal zeroext i1 @_ZL17crsf_parse_bufferPtS_t(i16* %values, i16* %num_values, i16 zeroext %max_channels) #4 !dbg !1121 {
entry:
  %values.addr = alloca i16*, align 8
  %num_values.addr = alloca i16*, align 8
  %max_channels.addr = alloca i16, align 2
  %crsf_frame_ptr = alloca i8*, align 8
  %current_frame_length = alloca i32, align 4
  %ret = alloca i8, align 1
  store i16* %values, i16** %values.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %values.addr, metadata !1124, metadata !DIExpression()), !dbg !1125
  store i16* %num_values, i16** %num_values.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %num_values.addr, metadata !1126, metadata !DIExpression()), !dbg !1127
  store i16 %max_channels, i16* %max_channels.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %max_channels.addr, metadata !1128, metadata !DIExpression()), !dbg !1129
  ret i1 true, !dbg !1130
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local zeroext i8 @_Z14crsf_frame_CRCRK12crsf_frame_t(%struct.crsf_frame_t* nonnull align 1 dereferenceable(30) %frame) #4 !dbg !1131 {
entry:
  %frame.addr = alloca %struct.crsf_frame_t*, align 8
  %crc = alloca i8, align 1
  %i = alloca i32, align 4
  store %struct.crsf_frame_t* %frame, %struct.crsf_frame_t** %frame.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.crsf_frame_t** %frame.addr, metadata !1136, metadata !DIExpression()), !dbg !1137
  call void @llvm.dbg.declare(metadata i8* %crc, metadata !1138, metadata !DIExpression()), !dbg !1139
  %0 = load %struct.crsf_frame_t*, %struct.crsf_frame_t** %frame.addr, align 8, !dbg !1140
  %type = getelementptr inbounds %struct.crsf_frame_t, %struct.crsf_frame_t* %0, i32 0, i32 1, !dbg !1141
  %1 = load i8, i8* %type, align 1, !dbg !1141
  %call = call zeroext i8 @_Z11crc8_dvb_s2hh(i8 zeroext 0, i8 zeroext %1), !dbg !1142
  store i8 %call, i8* %crc, align 1, !dbg !1139
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1143, metadata !DIExpression()), !dbg !1145
  store i32 0, i32* %i, align 4, !dbg !1145
  br label %for.cond, !dbg !1146

for.cond:                                         ; preds = %for.body, %entry
  %2 = load i32, i32* %i, align 4, !dbg !1147
  %3 = load %struct.crsf_frame_t*, %struct.crsf_frame_t** %frame.addr, align 8, !dbg !1149
  %header = getelementptr inbounds %struct.crsf_frame_t, %struct.crsf_frame_t* %3, i32 0, i32 0, !dbg !1150
  %length = getelementptr inbounds %struct.crsf_frame_header_t, %struct.crsf_frame_header_t* %header, i32 0, i32 1, !dbg !1151
  %4 = load i8, i8* %length, align 1, !dbg !1151
  %conv = zext i8 %4 to i32, !dbg !1149
  %sub = sub nsw i32 %conv, 2, !dbg !1152
  %cmp = icmp slt i32 %2, %sub, !dbg !1153
  br i1 %cmp, label %for.body, label %for.end, !dbg !1154

for.body:                                         ; preds = %for.cond
  %5 = load i8, i8* %crc, align 1, !dbg !1155
  %6 = load %struct.crsf_frame_t*, %struct.crsf_frame_t** %frame.addr, align 8, !dbg !1157
  %payload = getelementptr inbounds %struct.crsf_frame_t, %struct.crsf_frame_t* %6, i32 0, i32 2, !dbg !1158
  %7 = load i32, i32* %i, align 4, !dbg !1159
  %idxprom = sext i32 %7 to i64, !dbg !1157
  %arrayidx = getelementptr inbounds [27 x i8], [27 x i8]* %payload, i64 0, i64 %idxprom, !dbg !1157
  %8 = load i8, i8* %arrayidx, align 1, !dbg !1157
  %call1 = call zeroext i8 @_Z11crc8_dvb_s2hh(i8 zeroext %5, i8 zeroext %8), !dbg !1160
  store i8 %call1, i8* %crc, align 1, !dbg !1161
  %9 = load i32, i32* %i, align 4, !dbg !1162
  %inc = add nsw i32 %9, 1, !dbg !1162
  store i32 %inc, i32* %i, align 4, !dbg !1162
  br label %for.cond, !dbg !1163, !llvm.loop !1164

for.end:                                          ; preds = %for.cond
  %10 = load i8, i8* %crc, align 1, !dbg !1166
  ret i8 %10, !dbg !1167
}

; Function Attrs: mustprogress noinline uwtable
define dso_local zeroext i1 @_Z27crsf_send_telemetry_batteryittih(i32 %uart_fd, i16 zeroext %voltage, i16 zeroext %current, i32 %fuel, i8 zeroext %remaining) #6 !dbg !1168 {
entry:
  %uart_fd.addr = alloca i32, align 4
  %voltage.addr = alloca i16, align 2
  %current.addr = alloca i16, align 2
  %fuel.addr = alloca i32, align 4
  %remaining.addr = alloca i8, align 1
  %buf = alloca [12 x i8], align 1
  %offset = alloca i32, align 4
  store i32 %uart_fd, i32* %uart_fd.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %uart_fd.addr, metadata !1171, metadata !DIExpression()), !dbg !1172
  store i16 %voltage, i16* %voltage.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %voltage.addr, metadata !1173, metadata !DIExpression()), !dbg !1174
  store i16 %current, i16* %current.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %current.addr, metadata !1175, metadata !DIExpression()), !dbg !1176
  store i32 %fuel, i32* %fuel.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %fuel.addr, metadata !1177, metadata !DIExpression()), !dbg !1178
  store i8 %remaining, i8* %remaining.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %remaining.addr, metadata !1179, metadata !DIExpression()), !dbg !1180
  call void @llvm.dbg.declare(metadata [12 x i8]* %buf, metadata !1181, metadata !DIExpression()), !dbg !1185
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !1186, metadata !DIExpression()), !dbg !1187
  store i32 0, i32* %offset, align 4, !dbg !1187
  %arraydecay = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 0, !dbg !1188
  call void @_ZL18write_frame_headerPhRi17crsf_frame_type_th(i8* %arraydecay, i32* nonnull align 4 dereferenceable(4) %offset, i8 zeroext 8, i8 zeroext 8), !dbg !1189
  %arraydecay1 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 0, !dbg !1190
  %0 = load i16, i16* %voltage.addr, align 2, !dbg !1191
  call void @_ZL14write_uint16_tPhRit(i8* %arraydecay1, i32* nonnull align 4 dereferenceable(4) %offset, i16 zeroext %0), !dbg !1192
  %arraydecay2 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 0, !dbg !1193
  %1 = load i16, i16* %current.addr, align 2, !dbg !1194
  call void @_ZL14write_uint16_tPhRit(i8* %arraydecay2, i32* nonnull align 4 dereferenceable(4) %offset, i16 zeroext %1), !dbg !1195
  %arraydecay3 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 0, !dbg !1196
  %2 = load i32, i32* %fuel.addr, align 4, !dbg !1197
  call void @_ZL14write_uint24_tPhRii(i8* %arraydecay3, i32* nonnull align 4 dereferenceable(4) %offset, i32 %2), !dbg !1198
  %arraydecay4 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 0, !dbg !1199
  %3 = load i8, i8* %remaining.addr, align 1, !dbg !1200
  call void @_ZL13write_uint8_tPhRih(i8* %arraydecay4, i32* nonnull align 4 dereferenceable(4) %offset, i8 zeroext %3), !dbg !1201
  %arraydecay5 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 0, !dbg !1202
  call void @_ZL15write_frame_crcPhRii(i8* %arraydecay5, i32* nonnull align 4 dereferenceable(4) %offset, i32 12), !dbg !1203
  %4 = load i32, i32* %uart_fd.addr, align 4, !dbg !1204
  %arraydecay6 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 0, !dbg !1205
  %5 = load i32, i32* %offset, align 4, !dbg !1206
  %conv = sext i32 %5 to i64, !dbg !1206
  %call = call i64 @write(i32 %4, i8* %arraydecay6, i64 %conv), !dbg !1207
  %6 = load i32, i32* %offset, align 4, !dbg !1208
  %conv7 = sext i32 %6 to i64, !dbg !1208
  %cmp = icmp eq i64 %call, %conv7, !dbg !1209
  ret i1 %cmp, !dbg !1210
}

; Function Attrs: mustprogress noinline uwtable
define internal void @_ZL18write_frame_headerPhRi17crsf_frame_type_th(i8* %buf, i32* nonnull align 4 dereferenceable(4) %offset, i8 zeroext %type, i8 zeroext %payload_size) #6 !dbg !1211 {
entry:
  %buf.addr = alloca i8*, align 8
  %offset.addr = alloca i32*, align 8
  %type.addr = alloca i8, align 1
  %payload_size.addr = alloca i8, align 1
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !1215, metadata !DIExpression()), !dbg !1216
  store i32* %offset, i32** %offset.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %offset.addr, metadata !1217, metadata !DIExpression()), !dbg !1218
  store i8 %type, i8* %type.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %type.addr, metadata !1219, metadata !DIExpression()), !dbg !1220
  store i8 %payload_size, i8* %payload_size.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %payload_size.addr, metadata !1221, metadata !DIExpression()), !dbg !1222
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !1223
  %1 = load i32*, i32** %offset.addr, align 8, !dbg !1224
  call void @_ZL13write_uint8_tPhRih(i8* %0, i32* nonnull align 4 dereferenceable(4) %1, i8 zeroext -56), !dbg !1225
  %2 = load i8*, i8** %buf.addr, align 8, !dbg !1226
  %3 = load i32*, i32** %offset.addr, align 8, !dbg !1227
  %4 = load i8, i8* %payload_size.addr, align 1, !dbg !1228
  %conv = zext i8 %4 to i32, !dbg !1228
  %add = add nsw i32 %conv, 2, !dbg !1229
  %conv1 = trunc i32 %add to i8, !dbg !1228
  call void @_ZL13write_uint8_tPhRih(i8* %2, i32* nonnull align 4 dereferenceable(4) %3, i8 zeroext %conv1), !dbg !1230
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !1231
  %6 = load i32*, i32** %offset.addr, align 8, !dbg !1232
  %7 = load i8, i8* %type.addr, align 1, !dbg !1233
  call void @_ZL13write_uint8_tPhRih(i8* %5, i32* nonnull align 4 dereferenceable(4) %6, i8 zeroext %7), !dbg !1234
  ret void, !dbg !1235
}

; Function Attrs: mustprogress noinline nounwind uwtable
define internal void @_ZL14write_uint16_tPhRit(i8* %buf, i32* nonnull align 4 dereferenceable(4) %offset, i16 zeroext %value) #4 !dbg !1236 {
entry:
  %buf.addr = alloca i8*, align 8
  %offset.addr = alloca i32*, align 8
  %value.addr = alloca i16, align 2
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !1239, metadata !DIExpression()), !dbg !1240
  store i32* %offset, i32** %offset.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %offset.addr, metadata !1241, metadata !DIExpression()), !dbg !1242
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1243, metadata !DIExpression()), !dbg !1244
  %0 = load i16, i16* %value.addr, align 2, !dbg !1245
  %conv = zext i16 %0 to i32, !dbg !1245
  %shr = ashr i32 %conv, 8, !dbg !1246
  %conv1 = trunc i32 %shr to i8, !dbg !1245
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !1247
  %2 = load i32*, i32** %offset.addr, align 8, !dbg !1248
  %3 = load i32, i32* %2, align 4, !dbg !1248
  %idxprom = sext i32 %3 to i64, !dbg !1247
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !1247
  store i8 %conv1, i8* %arrayidx, align 1, !dbg !1249
  %4 = load i16, i16* %value.addr, align 2, !dbg !1250
  %conv2 = zext i16 %4 to i32, !dbg !1250
  %and = and i32 %conv2, 255, !dbg !1251
  %conv3 = trunc i32 %and to i8, !dbg !1250
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !1252
  %6 = load i32*, i32** %offset.addr, align 8, !dbg !1253
  %7 = load i32, i32* %6, align 4, !dbg !1253
  %add = add nsw i32 %7, 1, !dbg !1254
  %idxprom4 = sext i32 %add to i64, !dbg !1252
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i64 %idxprom4, !dbg !1252
  store i8 %conv3, i8* %arrayidx5, align 1, !dbg !1255
  %8 = load i32*, i32** %offset.addr, align 8, !dbg !1256
  %9 = load i32, i32* %8, align 4, !dbg !1257
  %add6 = add nsw i32 %9, 2, !dbg !1257
  store i32 %add6, i32* %8, align 4, !dbg !1257
  ret void, !dbg !1258
}

; Function Attrs: mustprogress noinline nounwind uwtable
define internal void @_ZL14write_uint24_tPhRii(i8* %buf, i32* nonnull align 4 dereferenceable(4) %offset, i32 %value) #4 !dbg !1259 {
entry:
  %buf.addr = alloca i8*, align 8
  %offset.addr = alloca i32*, align 8
  %value.addr = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !1262, metadata !DIExpression()), !dbg !1263
  store i32* %offset, i32** %offset.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %offset.addr, metadata !1264, metadata !DIExpression()), !dbg !1265
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1266, metadata !DIExpression()), !dbg !1267
  %0 = load i32, i32* %value.addr, align 4, !dbg !1268
  %shr = ashr i32 %0, 16, !dbg !1269
  %conv = trunc i32 %shr to i8, !dbg !1268
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !1270
  %2 = load i32*, i32** %offset.addr, align 8, !dbg !1271
  %3 = load i32, i32* %2, align 4, !dbg !1271
  %idxprom = sext i32 %3 to i64, !dbg !1270
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !1270
  store i8 %conv, i8* %arrayidx, align 1, !dbg !1272
  %4 = load i32, i32* %value.addr, align 4, !dbg !1273
  %shr1 = ashr i32 %4, 8, !dbg !1274
  %and = and i32 %shr1, 255, !dbg !1275
  %conv2 = trunc i32 %and to i8, !dbg !1276
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !1277
  %6 = load i32*, i32** %offset.addr, align 8, !dbg !1278
  %7 = load i32, i32* %6, align 4, !dbg !1278
  %add = add nsw i32 %7, 1, !dbg !1279
  %idxprom3 = sext i32 %add to i64, !dbg !1277
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %idxprom3, !dbg !1277
  store i8 %conv2, i8* %arrayidx4, align 1, !dbg !1280
  %8 = load i32, i32* %value.addr, align 4, !dbg !1281
  %and5 = and i32 %8, 255, !dbg !1282
  %conv6 = trunc i32 %and5 to i8, !dbg !1281
  %9 = load i8*, i8** %buf.addr, align 8, !dbg !1283
  %10 = load i32*, i32** %offset.addr, align 8, !dbg !1284
  %11 = load i32, i32* %10, align 4, !dbg !1284
  %add7 = add nsw i32 %11, 2, !dbg !1285
  %idxprom8 = sext i32 %add7 to i64, !dbg !1283
  %arrayidx9 = getelementptr inbounds i8, i8* %9, i64 %idxprom8, !dbg !1283
  store i8 %conv6, i8* %arrayidx9, align 1, !dbg !1286
  %12 = load i32*, i32** %offset.addr, align 8, !dbg !1287
  %13 = load i32, i32* %12, align 4, !dbg !1288
  %add10 = add nsw i32 %13, 3, !dbg !1288
  store i32 %add10, i32* %12, align 4, !dbg !1288
  ret void, !dbg !1289
}

; Function Attrs: mustprogress noinline nounwind uwtable
define internal void @_ZL13write_uint8_tPhRih(i8* %buf, i32* nonnull align 4 dereferenceable(4) %offset, i8 zeroext %value) #4 !dbg !1290 {
entry:
  %buf.addr = alloca i8*, align 8
  %offset.addr = alloca i32*, align 8
  %value.addr = alloca i8, align 1
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !1293, metadata !DIExpression()), !dbg !1294
  store i32* %offset, i32** %offset.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %offset.addr, metadata !1295, metadata !DIExpression()), !dbg !1296
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !1297, metadata !DIExpression()), !dbg !1298
  %0 = load i8, i8* %value.addr, align 1, !dbg !1299
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !1300
  %2 = load i32*, i32** %offset.addr, align 8, !dbg !1301
  %3 = load i32, i32* %2, align 4, !dbg !1302
  %inc = add nsw i32 %3, 1, !dbg !1302
  store i32 %inc, i32* %2, align 4, !dbg !1302
  %idxprom = sext i32 %3 to i64, !dbg !1300
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !1300
  store i8 %0, i8* %arrayidx, align 1, !dbg !1303
  ret void, !dbg !1304
}

; Function Attrs: mustprogress noinline nounwind uwtable
define internal void @_ZL15write_frame_crcPhRii(i8* %buf, i32* nonnull align 4 dereferenceable(4) %offset, i32 %buf_size) #4 !dbg !1305 {
entry:
  %buf.addr = alloca i8*, align 8
  %offset.addr = alloca i32*, align 8
  %buf_size.addr = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !1306, metadata !DIExpression()), !dbg !1307
  store i32* %offset, i32** %offset.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %offset.addr, metadata !1308, metadata !DIExpression()), !dbg !1309
  store i32 %buf_size, i32* %buf_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %buf_size.addr, metadata !1310, metadata !DIExpression()), !dbg !1311
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !1312
  %1 = load i32*, i32** %offset.addr, align 8, !dbg !1313
  %2 = load i8*, i8** %buf.addr, align 8, !dbg !1314
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 2, !dbg !1315
  %3 = load i32, i32* %buf_size.addr, align 4, !dbg !1316
  %sub = sub nsw i32 %3, 3, !dbg !1317
  %call = call zeroext i8 @_Z15crc8_dvb_s2_bufPhi(i8* %add.ptr, i32 %sub), !dbg !1318
  call void @_ZL13write_uint8_tPhRih(i8* %0, i32* nonnull align 4 dereferenceable(4) %1, i8 zeroext %call), !dbg !1319
  ret void, !dbg !1320
}

declare dso_local i64 @write(i32, i8*, i64) #1

; Function Attrs: mustprogress noinline uwtable
define dso_local zeroext i1 @_Z23crsf_send_telemetry_gpsiiittth(i32 %uart_fd, i32 %latitude, i32 %longitude, i16 zeroext %groundspeed, i16 zeroext %gps_heading, i16 zeroext %altitude, i8 zeroext %num_satellites) #6 !dbg !1321 {
entry:
  %uart_fd.addr = alloca i32, align 4
  %latitude.addr = alloca i32, align 4
  %longitude.addr = alloca i32, align 4
  %groundspeed.addr = alloca i16, align 2
  %gps_heading.addr = alloca i16, align 2
  %altitude.addr = alloca i16, align 2
  %num_satellites.addr = alloca i8, align 1
  %buf = alloca [19 x i8], align 16
  %offset = alloca i32, align 4
  store i32 %uart_fd, i32* %uart_fd.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %uart_fd.addr, metadata !1324, metadata !DIExpression()), !dbg !1325
  store i32 %latitude, i32* %latitude.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %latitude.addr, metadata !1326, metadata !DIExpression()), !dbg !1327
  store i32 %longitude, i32* %longitude.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %longitude.addr, metadata !1328, metadata !DIExpression()), !dbg !1329
  store i16 %groundspeed, i16* %groundspeed.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %groundspeed.addr, metadata !1330, metadata !DIExpression()), !dbg !1331
  store i16 %gps_heading, i16* %gps_heading.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %gps_heading.addr, metadata !1332, metadata !DIExpression()), !dbg !1333
  store i16 %altitude, i16* %altitude.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %altitude.addr, metadata !1334, metadata !DIExpression()), !dbg !1335
  store i8 %num_satellites, i8* %num_satellites.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %num_satellites.addr, metadata !1336, metadata !DIExpression()), !dbg !1337
  call void @llvm.dbg.declare(metadata [19 x i8]* %buf, metadata !1338, metadata !DIExpression()), !dbg !1342
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !1343, metadata !DIExpression()), !dbg !1344
  store i32 0, i32* %offset, align 4, !dbg !1344
  %arraydecay = getelementptr inbounds [19 x i8], [19 x i8]* %buf, i64 0, i64 0, !dbg !1345
  call void @_ZL18write_frame_headerPhRi17crsf_frame_type_th(i8* %arraydecay, i32* nonnull align 4 dereferenceable(4) %offset, i8 zeroext 2, i8 zeroext 15), !dbg !1346
  %arraydecay1 = getelementptr inbounds [19 x i8], [19 x i8]* %buf, i64 0, i64 0, !dbg !1347
  %0 = load i32, i32* %latitude.addr, align 4, !dbg !1348
  call void @_ZL13write_int32_tPhRii(i8* %arraydecay1, i32* nonnull align 4 dereferenceable(4) %offset, i32 %0), !dbg !1349
  %arraydecay2 = getelementptr inbounds [19 x i8], [19 x i8]* %buf, i64 0, i64 0, !dbg !1350
  %1 = load i32, i32* %longitude.addr, align 4, !dbg !1351
  call void @_ZL13write_int32_tPhRii(i8* %arraydecay2, i32* nonnull align 4 dereferenceable(4) %offset, i32 %1), !dbg !1352
  %arraydecay3 = getelementptr inbounds [19 x i8], [19 x i8]* %buf, i64 0, i64 0, !dbg !1353
  %2 = load i16, i16* %groundspeed.addr, align 2, !dbg !1354
  call void @_ZL14write_uint16_tPhRit(i8* %arraydecay3, i32* nonnull align 4 dereferenceable(4) %offset, i16 zeroext %2), !dbg !1355
  %arraydecay4 = getelementptr inbounds [19 x i8], [19 x i8]* %buf, i64 0, i64 0, !dbg !1356
  %3 = load i16, i16* %gps_heading.addr, align 2, !dbg !1357
  call void @_ZL14write_uint16_tPhRit(i8* %arraydecay4, i32* nonnull align 4 dereferenceable(4) %offset, i16 zeroext %3), !dbg !1358
  %arraydecay5 = getelementptr inbounds [19 x i8], [19 x i8]* %buf, i64 0, i64 0, !dbg !1359
  %4 = load i16, i16* %altitude.addr, align 2, !dbg !1360
  call void @_ZL14write_uint16_tPhRit(i8* %arraydecay5, i32* nonnull align 4 dereferenceable(4) %offset, i16 zeroext %4), !dbg !1361
  %arraydecay6 = getelementptr inbounds [19 x i8], [19 x i8]* %buf, i64 0, i64 0, !dbg !1362
  %5 = load i8, i8* %num_satellites.addr, align 1, !dbg !1363
  call void @_ZL13write_uint8_tPhRih(i8* %arraydecay6, i32* nonnull align 4 dereferenceable(4) %offset, i8 zeroext %5), !dbg !1364
  %arraydecay7 = getelementptr inbounds [19 x i8], [19 x i8]* %buf, i64 0, i64 0, !dbg !1365
  call void @_ZL15write_frame_crcPhRii(i8* %arraydecay7, i32* nonnull align 4 dereferenceable(4) %offset, i32 19), !dbg !1366
  %6 = load i32, i32* %uart_fd.addr, align 4, !dbg !1367
  %arraydecay8 = getelementptr inbounds [19 x i8], [19 x i8]* %buf, i64 0, i64 0, !dbg !1368
  %7 = load i32, i32* %offset, align 4, !dbg !1369
  %conv = sext i32 %7 to i64, !dbg !1369
  %call = call i64 @write(i32 %6, i8* %arraydecay8, i64 %conv), !dbg !1370
  %8 = load i32, i32* %offset, align 4, !dbg !1371
  %conv9 = sext i32 %8 to i64, !dbg !1371
  %cmp = icmp eq i64 %call, %conv9, !dbg !1372
  ret i1 %cmp, !dbg !1373
}

; Function Attrs: mustprogress noinline nounwind uwtable
define internal void @_ZL13write_int32_tPhRii(i8* %buf, i32* nonnull align 4 dereferenceable(4) %offset, i32 %value) #4 !dbg !1374 {
entry:
  %buf.addr = alloca i8*, align 8
  %offset.addr = alloca i32*, align 8
  %value.addr = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !1377, metadata !DIExpression()), !dbg !1378
  store i32* %offset, i32** %offset.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %offset.addr, metadata !1379, metadata !DIExpression()), !dbg !1380
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1381, metadata !DIExpression()), !dbg !1382
  %0 = load i32, i32* %value.addr, align 4, !dbg !1383
  %shr = ashr i32 %0, 24, !dbg !1384
  %conv = trunc i32 %shr to i8, !dbg !1383
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !1385
  %2 = load i32*, i32** %offset.addr, align 8, !dbg !1386
  %3 = load i32, i32* %2, align 4, !dbg !1386
  %idxprom = sext i32 %3 to i64, !dbg !1385
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !1385
  store i8 %conv, i8* %arrayidx, align 1, !dbg !1387
  %4 = load i32, i32* %value.addr, align 4, !dbg !1388
  %shr1 = ashr i32 %4, 16, !dbg !1389
  %and = and i32 %shr1, 255, !dbg !1390
  %conv2 = trunc i32 %and to i8, !dbg !1391
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !1392
  %6 = load i32*, i32** %offset.addr, align 8, !dbg !1393
  %7 = load i32, i32* %6, align 4, !dbg !1393
  %add = add nsw i32 %7, 1, !dbg !1394
  %idxprom3 = sext i32 %add to i64, !dbg !1392
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %idxprom3, !dbg !1392
  store i8 %conv2, i8* %arrayidx4, align 1, !dbg !1395
  %8 = load i32, i32* %value.addr, align 4, !dbg !1396
  %shr5 = ashr i32 %8, 8, !dbg !1397
  %and6 = and i32 %shr5, 255, !dbg !1398
  %conv7 = trunc i32 %and6 to i8, !dbg !1399
  %9 = load i8*, i8** %buf.addr, align 8, !dbg !1400
  %10 = load i32*, i32** %offset.addr, align 8, !dbg !1401
  %11 = load i32, i32* %10, align 4, !dbg !1401
  %add8 = add nsw i32 %11, 2, !dbg !1402
  %idxprom9 = sext i32 %add8 to i64, !dbg !1400
  %arrayidx10 = getelementptr inbounds i8, i8* %9, i64 %idxprom9, !dbg !1400
  store i8 %conv7, i8* %arrayidx10, align 1, !dbg !1403
  %12 = load i32, i32* %value.addr, align 4, !dbg !1404
  %and11 = and i32 %12, 255, !dbg !1405
  %conv12 = trunc i32 %and11 to i8, !dbg !1404
  %13 = load i8*, i8** %buf.addr, align 8, !dbg !1406
  %14 = load i32*, i32** %offset.addr, align 8, !dbg !1407
  %15 = load i32, i32* %14, align 4, !dbg !1407
  %add13 = add nsw i32 %15, 3, !dbg !1408
  %idxprom14 = sext i32 %add13 to i64, !dbg !1406
  %arrayidx15 = getelementptr inbounds i8, i8* %13, i64 %idxprom14, !dbg !1406
  store i8 %conv12, i8* %arrayidx15, align 1, !dbg !1409
  %16 = load i32*, i32** %offset.addr, align 8, !dbg !1410
  %17 = load i32, i32* %16, align 4, !dbg !1411
  %add16 = add nsw i32 %17, 4, !dbg !1411
  store i32 %add16, i32* %16, align 4, !dbg !1411
  ret void, !dbg !1412
}

; Function Attrs: mustprogress noinline uwtable
define dso_local zeroext i1 @_Z28crsf_send_telemetry_attitudeisss(i32 %uart_fd, i16 signext %pitch, i16 signext %roll, i16 signext %yaw) #6 !dbg !1413 {
entry:
  %uart_fd.addr = alloca i32, align 4
  %pitch.addr = alloca i16, align 2
  %roll.addr = alloca i16, align 2
  %yaw.addr = alloca i16, align 2
  %buf = alloca [10 x i8], align 1
  %offset = alloca i32, align 4
  store i32 %uart_fd, i32* %uart_fd.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %uart_fd.addr, metadata !1416, metadata !DIExpression()), !dbg !1417
  store i16 %pitch, i16* %pitch.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %pitch.addr, metadata !1418, metadata !DIExpression()), !dbg !1419
  store i16 %roll, i16* %roll.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %roll.addr, metadata !1420, metadata !DIExpression()), !dbg !1421
  store i16 %yaw, i16* %yaw.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %yaw.addr, metadata !1422, metadata !DIExpression()), !dbg !1423
  call void @llvm.dbg.declare(metadata [10 x i8]* %buf, metadata !1424, metadata !DIExpression()), !dbg !1428
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !1429, metadata !DIExpression()), !dbg !1430
  store i32 0, i32* %offset, align 4, !dbg !1430
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %buf, i64 0, i64 0, !dbg !1431
  call void @_ZL18write_frame_headerPhRi17crsf_frame_type_th(i8* %arraydecay, i32* nonnull align 4 dereferenceable(4) %offset, i8 zeroext 30, i8 zeroext 6), !dbg !1432
  %arraydecay1 = getelementptr inbounds [10 x i8], [10 x i8]* %buf, i64 0, i64 0, !dbg !1433
  %0 = load i16, i16* %pitch.addr, align 2, !dbg !1434
  call void @_ZL14write_uint16_tPhRit(i8* %arraydecay1, i32* nonnull align 4 dereferenceable(4) %offset, i16 zeroext %0), !dbg !1435
  %arraydecay2 = getelementptr inbounds [10 x i8], [10 x i8]* %buf, i64 0, i64 0, !dbg !1436
  %1 = load i16, i16* %roll.addr, align 2, !dbg !1437
  call void @_ZL14write_uint16_tPhRit(i8* %arraydecay2, i32* nonnull align 4 dereferenceable(4) %offset, i16 zeroext %1), !dbg !1438
  %arraydecay3 = getelementptr inbounds [10 x i8], [10 x i8]* %buf, i64 0, i64 0, !dbg !1439
  %2 = load i16, i16* %yaw.addr, align 2, !dbg !1440
  call void @_ZL14write_uint16_tPhRit(i8* %arraydecay3, i32* nonnull align 4 dereferenceable(4) %offset, i16 zeroext %2), !dbg !1441
  %arraydecay4 = getelementptr inbounds [10 x i8], [10 x i8]* %buf, i64 0, i64 0, !dbg !1442
  call void @_ZL15write_frame_crcPhRii(i8* %arraydecay4, i32* nonnull align 4 dereferenceable(4) %offset, i32 10), !dbg !1443
  %3 = load i32, i32* %uart_fd.addr, align 4, !dbg !1444
  %arraydecay5 = getelementptr inbounds [10 x i8], [10 x i8]* %buf, i64 0, i64 0, !dbg !1445
  %4 = load i32, i32* %offset, align 4, !dbg !1446
  %conv = sext i32 %4 to i64, !dbg !1446
  %call = call i64 @write(i32 %3, i8* %arraydecay5, i64 %conv), !dbg !1447
  %5 = load i32, i32* %offset, align 4, !dbg !1448
  %conv6 = sext i32 %5 to i64, !dbg !1448
  %cmp = icmp eq i64 %call, %conv6, !dbg !1449
  ret i1 %cmp, !dbg !1450
}

; Function Attrs: mustprogress noinline uwtable
define dso_local zeroext i1 @_Z31crsf_send_telemetry_flight_modeiPKc(i32 %uart_fd, i8* %flight_mode) #6 !dbg !1451 {
entry:
  %uart_fd.addr = alloca i32, align 4
  %flight_mode.addr = alloca i8*, align 8
  %max_length = alloca i32, align 4
  %length = alloca i32, align 4
  %buf = alloca [20 x i8], align 16
  %offset = alloca i32, align 4
  store i32 %uart_fd, i32* %uart_fd.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %uart_fd.addr, metadata !1454, metadata !DIExpression()), !dbg !1455
  store i8* %flight_mode, i8** %flight_mode.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %flight_mode.addr, metadata !1456, metadata !DIExpression()), !dbg !1457
  call void @llvm.dbg.declare(metadata i32* %max_length, metadata !1458, metadata !DIExpression()), !dbg !1459
  store i32 16, i32* %max_length, align 4, !dbg !1459
  call void @llvm.dbg.declare(metadata i32* %length, metadata !1460, metadata !DIExpression()), !dbg !1461
  %0 = load i8*, i8** %flight_mode.addr, align 8, !dbg !1462
  %call = call i64 @strlen(i8* %0) #12, !dbg !1463
  %add = add i64 %call, 1, !dbg !1464
  %conv = trunc i64 %add to i32, !dbg !1463
  store i32 %conv, i32* %length, align 4, !dbg !1461
  %1 = load i32, i32* %length, align 4, !dbg !1465
  %cmp = icmp sgt i32 %1, 16, !dbg !1467
  %spec.store.select = select i1 %cmp, i32 16, i32 %conv, !dbg !1468
  store i32 %spec.store.select, i32* %length, align 4, !dbg !1469
  call void @llvm.dbg.declare(metadata [20 x i8]* %buf, metadata !1470, metadata !DIExpression()), !dbg !1474
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !1475, metadata !DIExpression()), !dbg !1476
  store i32 0, i32* %offset, align 4, !dbg !1476
  %arraydecay = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 0, !dbg !1477
  %2 = load i32, i32* %length, align 4, !dbg !1478
  %conv1 = trunc i32 %2 to i8, !dbg !1478
  call void @_ZL18write_frame_headerPhRi17crsf_frame_type_th(i8* %arraydecay, i32* nonnull align 4 dereferenceable(4) %offset, i8 zeroext 33, i8 zeroext %conv1), !dbg !1479
  %arraydecay2 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 0, !dbg !1480
  %3 = load i32, i32* %offset, align 4, !dbg !1481
  %idx.ext = sext i32 %3 to i64, !dbg !1482
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay2, i64 %idx.ext, !dbg !1482
  %4 = load i8*, i8** %flight_mode.addr, align 8, !dbg !1483
  %5 = load i32, i32* %length, align 4, !dbg !1484
  %conv3 = sext i32 %5 to i64, !dbg !1484
  %6 = call i8* @memcpy(i8* %add.ptr, i8* %4, i64 %conv3), !dbg !1485
  %7 = load i32, i32* %length, align 4, !dbg !1486
  %8 = load i32, i32* %offset, align 4, !dbg !1487
  %add4 = add nsw i32 %8, %7, !dbg !1487
  store i32 %add4, i32* %offset, align 4, !dbg !1487
  %9 = load i32, i32* %offset, align 4, !dbg !1488
  %sub = sub nsw i32 %9, 1, !dbg !1489
  %idxprom = sext i32 %sub to i64, !dbg !1490
  %arrayidx = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 %idxprom, !dbg !1490
  store i8 0, i8* %arrayidx, align 1, !dbg !1491
  %arraydecay5 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 0, !dbg !1492
  %10 = load i32, i32* %length, align 4, !dbg !1493
  %add6 = add nsw i32 %10, 4, !dbg !1494
  call void @_ZL15write_frame_crcPhRii(i8* %arraydecay5, i32* nonnull align 4 dereferenceable(4) %offset, i32 %add6), !dbg !1495
  %11 = load i32, i32* %uart_fd.addr, align 4, !dbg !1496
  %arraydecay7 = getelementptr inbounds [20 x i8], [20 x i8]* %buf, i64 0, i64 0, !dbg !1497
  %12 = load i32, i32* %offset, align 4, !dbg !1498
  %conv8 = sext i32 %12 to i64, !dbg !1498
  %call9 = call i64 @write(i32 %11, i8* %arraydecay7, i64 %conv8), !dbg !1499
  %13 = load i32, i32* %offset, align 4, !dbg !1500
  %conv10 = sext i32 %13 to i64, !dbg !1500
  %cmp11 = icmp eq i64 %call9, %conv10, !dbg !1501
  ret i1 %cmp11, !dbg !1502
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #8

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #9

; Function Attrs: noinline nounwind uwtable
define dso_local void @symbolic_execution_begin() #10 !dbg !1503 {
entry:
  call void @klee.ctor_stub()
  %now = alloca i32, align 4
  %len = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %now, metadata !1504, metadata !DIExpression()), !dbg !1505
  store i32 1, i32* %now, align 4, !dbg !1505
  call void @llvm.dbg.declare(metadata i32* %len, metadata !1506, metadata !DIExpression()), !dbg !1507
  store i32 500, i32* %len, align 4, !dbg !1507
  %0 = bitcast i32* %now to i8*, !dbg !1508
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !1509
  %1 = bitcast i32* %len to i8*, !dbg !1510
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0)), !dbg !1511
  %2 = load i32, i32* %now, align 4, !dbg !1512
  %cmp = icmp slt i32 %2, 20, !dbg !1513
  %conv = zext i1 %cmp to i32, !dbg !1513
  %3 = load i32, i32* %len, align 4, !dbg !1514
  %cmp1 = icmp slt i32 %3, 100, !dbg !1515
  %conv2 = zext i1 %cmp1 to i32, !dbg !1515
  %and = and i32 %conv, %conv2, !dbg !1516
  %conv3 = sext i32 %and to i64, !dbg !1517
  call void @klee_assume(i64 %conv3), !dbg !1518
  %4 = load i32, i32* %now, align 4, !dbg !1519
  %cmp4 = icmp sge i32 %4, 0, !dbg !1520
  %conv5 = zext i1 %cmp4 to i32, !dbg !1520
  %5 = load i32, i32* %len, align 4, !dbg !1521
  %cmp6 = icmp sge i32 %5, 0, !dbg !1522
  %conv7 = zext i1 %cmp6 to i32, !dbg !1522
  %and8 = and i32 %conv5, %conv7, !dbg !1523
  %conv9 = sext i32 %and8 to i64, !dbg !1524
  call void @klee_assume(i64 %conv9), !dbg !1525
  %6 = load i32, i32* %now, align 4, !dbg !1526
  %7 = load i32, i32* %len, align 4, !dbg !1527
  call void @invoke_by_external(i32 %6, i32 %7), !dbg !1528
  ret void, !dbg !1529
}

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #1

declare dso_local void @klee_assume(i64) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8* %0, i8* %1, i64 %2) #11 !dbg !1530 {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1536, metadata !DIExpression()), !dbg !1537
  store i8* %1, i8** %5, align 8
  call void @llvm.dbg.declare(metadata i8** %5, metadata !1538, metadata !DIExpression()), !dbg !1539
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !1540, metadata !DIExpression()), !dbg !1541
  call void @llvm.dbg.declare(metadata i8** %7, metadata !1542, metadata !DIExpression()), !dbg !1543
  %9 = load i8*, i8** %4, align 8, !dbg !1544
  store i8* %9, i8** %7, align 8, !dbg !1543
  call void @llvm.dbg.declare(metadata i8** %8, metadata !1545, metadata !DIExpression()), !dbg !1546
  %10 = load i8*, i8** %5, align 8, !dbg !1547
  store i8* %10, i8** %8, align 8, !dbg !1546
  br label %11, !dbg !1548

11:                                               ; preds = %15, %3
  %12 = load i64, i64* %6, align 8, !dbg !1549
  %13 = add i64 %12, -1, !dbg !1549
  store i64 %13, i64* %6, align 8, !dbg !1549
  %14 = icmp ugt i64 %12, 0, !dbg !1550
  br i1 %14, label %15, label %21, !dbg !1548

15:                                               ; preds = %11
  %16 = load i8*, i8** %8, align 8, !dbg !1551
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !1551
  store i8* %17, i8** %8, align 8, !dbg !1551
  %18 = load i8, i8* %16, align 1, !dbg !1552
  %19 = load i8*, i8** %7, align 8, !dbg !1553
  %20 = getelementptr inbounds i8, i8* %19, i32 1, !dbg !1553
  store i8* %20, i8** %7, align 8, !dbg !1553
  store i8 %18, i8* %19, align 1, !dbg !1554
  br label %11, !dbg !1548, !llvm.loop !1555

21:                                               ; preds = %11
  %22 = load i8*, i8** %4, align 8, !dbg !1556
  ret i8* %22, !dbg !1557
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memset(i8* %0, i32 %1, i64 %2) #11 !dbg !1558 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1562, metadata !DIExpression()), !dbg !1563
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !1564, metadata !DIExpression()), !dbg !1565
  store i64 %2, i64* %6, align 8
  call void @llvm.dbg.declare(metadata i64* %6, metadata !1566, metadata !DIExpression()), !dbg !1567
  call void @llvm.dbg.declare(metadata i8** %7, metadata !1568, metadata !DIExpression()), !dbg !1569
  %8 = load i8*, i8** %4, align 8, !dbg !1570
  store i8* %8, i8** %7, align 8, !dbg !1569
  br label %9, !dbg !1571

9:                                                ; preds = %13, %3
  %10 = load i64, i64* %6, align 8, !dbg !1572
  %11 = add i64 %10, -1, !dbg !1572
  store i64 %11, i64* %6, align 8, !dbg !1572
  %12 = icmp ugt i64 %10, 0, !dbg !1573
  br i1 %12, label %13, label %18, !dbg !1571

13:                                               ; preds = %9
  %14 = load i32, i32* %5, align 4, !dbg !1574
  %15 = trunc i32 %14 to i8, !dbg !1574
  %16 = load i8*, i8** %7, align 8, !dbg !1575
  %17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !1575
  store i8* %17, i8** %7, align 8, !dbg !1575
  store i8 %15, i8* %16, align 1, !dbg !1576
  br label %9, !dbg !1571, !llvm.loop !1577

18:                                               ; preds = %9
  %19 = load i8*, i8** %4, align 8, !dbg !1578
  ret i8* %19, !dbg !1579
}

define internal void @klee.ctor_stub() {
entry:
  call void @_GLOBAL__sub_I_crsf.cpp()
  ret void
}

attributes #0 = { noinline uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }
attributes #4 = { mustprogress noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { mustprogress noinline uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly nofree nounwind willreturn writeonly }
attributes #8 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { argmemonly nofree nounwind willreturn }
attributes #10 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!9, !904, !899, !906, !908}
!llvm.ident = !{!910, !910, !911, !911, !911}
!llvm.module.flags = !{!912, !913, !914, !915, !916}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/iostream", directory: "")
!4 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 626, size: 8, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/ios_base.h", directory: "")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, size: 1728, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "crsf_frame", linkageName: "_ZL10crsf_frame", scope: !9, file: !10, line: 136, type: !884, isLocal: true, isDefinition: true)
!9 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !10, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !11, retainedTypes: !41, globals: !51, imports: !56, splitDebugInlining: false, nameTableKind: None)
!10 = !DIFile(filename: "crsf.cpp", directory: "/home/zrz0517/study/chain_attestation/OP-DFI/src_test")
!11 = !{!12, !21, !35}
!12 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "crsf_parser_state_t", file: !10, line: 130, baseType: !13, size: 8, flags: DIFlagEnumClass, elements: !18, identifier: "_ZTS19crsf_parser_state_t")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !14, line: 24, baseType: !15)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !16, line: 38, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!17 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!18 = !{!19, !20}
!19 = !DIEnumerator(name: "unsynced", value: 0, isUnsigned: true)
!20 = !DIEnumerator(name: "synced", value: 1, isUnsigned: true)
!21 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "crsf_frame_type_t", file: !10, line: 65, baseType: !13, size: 8, flags: DIFlagEnumClass, elements: !22, identifier: "_ZTS17crsf_frame_type_t")
!22 = !{!23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34}
!23 = !DIEnumerator(name: "gps", value: 2, isUnsigned: true)
!24 = !DIEnumerator(name: "battery_sensor", value: 8, isUnsigned: true)
!25 = !DIEnumerator(name: "link_statistics", value: 20, isUnsigned: true)
!26 = !DIEnumerator(name: "rc_channels_packed", value: 22, isUnsigned: true)
!27 = !DIEnumerator(name: "attitude", value: 30, isUnsigned: true)
!28 = !DIEnumerator(name: "flight_mode", value: 33, isUnsigned: true)
!29 = !DIEnumerator(name: "device_ping", value: 40, isUnsigned: true)
!30 = !DIEnumerator(name: "device_info", value: 41, isUnsigned: true)
!31 = !DIEnumerator(name: "parameter_settings_entry", value: 43, isUnsigned: true)
!32 = !DIEnumerator(name: "parameter_read", value: 44, isUnsigned: true)
!33 = !DIEnumerator(name: "parameter_write", value: 45, isUnsigned: true)
!34 = !DIEnumerator(name: "command", value: 50, isUnsigned: true)
!35 = distinct !DICompositeType(tag: DW_TAG_enumeration_type, name: "crsf_payload_size_t", file: !10, line: 82, baseType: !13, size: 8, flags: DIFlagEnumClass, elements: !36, identifier: "_ZTS19crsf_payload_size_t")
!36 = !{!37, !24, !38, !39, !40}
!37 = !DIEnumerator(name: "gps", value: 15, isUnsigned: true)
!38 = !DIEnumerator(name: "link_statistics", value: 10, isUnsigned: true)
!39 = !DIEnumerator(name: "rc_channels", value: 22, isUnsigned: true)
!40 = !DIEnumerator(name: "attitude", value: 6, isUnsigned: true)
!41 = !{!42, !45, !46, !47, !50, !13}
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !14, line: 27, baseType: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !16, line: 45, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !14, line: 25, baseType: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !16, line: 40, baseType: !49)
!49 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!51 = !{!0, !7, !52, !54}
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "current_frame_position", linkageName: "_ZL22current_frame_position", scope: !9, file: !10, line: 137, type: !45, isLocal: true, isDefinition: true)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "parser_state", linkageName: "_ZL12parser_state", scope: !9, file: !10, line: 138, type: !12, isLocal: true, isDefinition: true)
!56 = !{!57, !76, !79, !84, !92, !100, !104, !111, !115, !119, !121, !123, !127, !138, !142, !148, !154, !156, !160, !164, !168, !172, !184, !186, !190, !194, !198, !200, !206, !210, !214, !216, !218, !222, !230, !234, !238, !242, !244, !250, !252, !259, !264, !268, !273, !277, !281, !285, !287, !289, !293, !297, !301, !303, !307, !311, !313, !315, !319, !325, !330, !335, !336, !337, !338, !339, !340, !341, !342, !343, !344, !345, !349, !353, !357, !363, !367, !370, !373, !376, !378, !380, !382, !385, !388, !391, !394, !397, !401, !402, !403, !406, !407, !409, !411, !413, !415, !418, !421, !424, !427, !430, !432, !436, !440, !445, !451, !453, !455, !457, !459, !461, !463, !465, !467, !469, !471, !473, !475, !477, !481, !485, !491, !495, !500, !502, !506, !510, !514, !524, !528, !532, !536, !540, !544, !548, !552, !556, !560, !564, !568, !572, !574, !578, !582, !586, !592, !596, !600, !602, !606, !610, !616, !618, !622, !626, !630, !634, !638, !642, !646, !647, !648, !649, !651, !652, !653, !654, !655, !656, !657, !661, !667, !672, !676, !678, !680, !682, !684, !691, !695, !699, !703, !707, !711, !716, !720, !722, !726, !732, !736, !741, !743, !745, !749, !753, !755, !757, !759, !761, !765, !767, !769, !773, !777, !781, !785, !789, !793, !795, !799, !803, !807, !811, !813, !815, !819, !823, !824, !825, !826, !827, !828, !834, !837, !838, !840, !842, !844, !846, !850, !852, !854, !856, !858, !860, !862, !864, !866, !870, !874, !876, !880}
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !58, file: !75, line: 64)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !59, line: 6, baseType: !60)
!59 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "")
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !61, line: 21, baseType: !62)
!61 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "")
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !61, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !63, identifier: "_ZTS11__mbstate_t")
!63 = !{!64, !65}
!64 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !62, file: !61, line: 15, baseType: !45, size: 32)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !62, file: !61, line: 20, baseType: !66, size: 32, offset: 32)
!66 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !62, file: !61, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !67, identifier: "_ZTSN11__mbstate_tUt_E")
!67 = !{!68, !70}
!68 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !66, file: !61, line: 18, baseType: !69, size: 32)
!69 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !66, file: !61, line: 19, baseType: !71, size: 32)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 32, elements: !73)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !{!74}
!74 = !DISubrange(count: 4)
!75 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cwchar", directory: "")
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !77, file: !75, line: 141)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !78, line: 20, baseType: !69)
!78 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "")
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !80, file: !75, line: 143)
!80 = !DISubprogram(name: "btowc", scope: !81, file: !81, line: 284, type: !82, flags: DIFlagPrototyped, spFlags: 0)
!81 = !DIFile(filename: "/usr/include/wchar.h", directory: "")
!82 = !DISubroutineType(types: !83)
!83 = !{!77, !45}
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !85, file: !75, line: 144)
!85 = !DISubprogram(name: "fgetwc", scope: !81, file: !81, line: 726, type: !86, flags: DIFlagPrototyped, spFlags: 0)
!86 = !DISubroutineType(types: !87)
!87 = !{!77, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !90, line: 5, baseType: !91)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "")
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !90, line: 4, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8_IO_FILE")
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !93, file: !75, line: 145)
!93 = !DISubprogram(name: "fgetws", scope: !81, file: !81, line: 755, type: !94, flags: DIFlagPrototyped, spFlags: 0)
!94 = !DISubroutineType(types: !95)
!95 = !{!96, !98, !45, !99}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!98 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !96)
!99 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !88)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !101, file: !75, line: 146)
!101 = !DISubprogram(name: "fputwc", scope: !81, file: !81, line: 740, type: !102, flags: DIFlagPrototyped, spFlags: 0)
!102 = !DISubroutineType(types: !103)
!103 = !{!77, !97, !88}
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !105, file: !75, line: 147)
!105 = !DISubprogram(name: "fputws", scope: !81, file: !81, line: 762, type: !106, flags: DIFlagPrototyped, spFlags: 0)
!106 = !DISubroutineType(types: !107)
!107 = !{!45, !108, !99}
!108 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !109)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !97)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !112, file: !75, line: 148)
!112 = !DISubprogram(name: "fwide", scope: !81, file: !81, line: 573, type: !113, flags: DIFlagPrototyped, spFlags: 0)
!113 = !DISubroutineType(types: !114)
!114 = !{!45, !88, !45}
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !116, file: !75, line: 149)
!116 = !DISubprogram(name: "fwprintf", scope: !81, file: !81, line: 580, type: !117, flags: DIFlagPrototyped, spFlags: 0)
!117 = !DISubroutineType(types: !118)
!118 = !{!45, !99, !108, null}
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !120, file: !75, line: 150)
!120 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !81, file: !81, line: 640, type: !117, flags: DIFlagPrototyped, spFlags: 0)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !122, file: !75, line: 151)
!122 = !DISubprogram(name: "getwc", scope: !81, file: !81, line: 727, type: !86, flags: DIFlagPrototyped, spFlags: 0)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !124, file: !75, line: 152)
!124 = !DISubprogram(name: "getwchar", scope: !81, file: !81, line: 733, type: !125, flags: DIFlagPrototyped, spFlags: 0)
!125 = !DISubroutineType(types: !126)
!126 = !{!77}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !128, file: !75, line: 153)
!128 = !DISubprogram(name: "mbrlen", scope: !81, file: !81, line: 307, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!129 = !DISubroutineType(types: !130)
!130 = !{!131, !133, !131, !136}
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !132, line: 46, baseType: !44)
!132 = !DIFile(filename: "toolchain/llvm-project/build/lib/clang/13.0.1/include/stddef.h", directory: "/home/zrz0517/study/chain_attestation/OP-DFI")
!133 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !134)
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64)
!135 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !72)
!136 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !137)
!137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !139, file: !75, line: 154)
!139 = !DISubprogram(name: "mbrtowc", scope: !81, file: !81, line: 296, type: !140, flags: DIFlagPrototyped, spFlags: 0)
!140 = !DISubroutineType(types: !141)
!141 = !{!131, !98, !133, !131, !136}
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !143, file: !75, line: 155)
!143 = !DISubprogram(name: "mbsinit", scope: !81, file: !81, line: 292, type: !144, flags: DIFlagPrototyped, spFlags: 0)
!144 = !DISubroutineType(types: !145)
!145 = !{!45, !146}
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!147 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !149, file: !75, line: 156)
!149 = !DISubprogram(name: "mbsrtowcs", scope: !81, file: !81, line: 337, type: !150, flags: DIFlagPrototyped, spFlags: 0)
!150 = !DISubroutineType(types: !151)
!151 = !{!131, !98, !152, !131, !136}
!152 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !153)
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !134, size: 64)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !155, file: !75, line: 157)
!155 = !DISubprogram(name: "putwc", scope: !81, file: !81, line: 741, type: !102, flags: DIFlagPrototyped, spFlags: 0)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !157, file: !75, line: 158)
!157 = !DISubprogram(name: "putwchar", scope: !81, file: !81, line: 747, type: !158, flags: DIFlagPrototyped, spFlags: 0)
!158 = !DISubroutineType(types: !159)
!159 = !{!77, !97}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !161, file: !75, line: 160)
!161 = !DISubprogram(name: "swprintf", scope: !81, file: !81, line: 590, type: !162, flags: DIFlagPrototyped, spFlags: 0)
!162 = !DISubroutineType(types: !163)
!163 = !{!45, !98, !131, !108, null}
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !165, file: !75, line: 162)
!165 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !81, file: !81, line: 647, type: !166, flags: DIFlagPrototyped, spFlags: 0)
!166 = !DISubroutineType(types: !167)
!167 = !{!45, !108, !108, null}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !169, file: !75, line: 163)
!169 = !DISubprogram(name: "ungetwc", scope: !81, file: !81, line: 770, type: !170, flags: DIFlagPrototyped, spFlags: 0)
!170 = !DISubroutineType(types: !171)
!171 = !{!77, !77, !88}
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !173, file: !75, line: 164)
!173 = !DISubprogram(name: "vfwprintf", scope: !81, file: !81, line: 598, type: !174, flags: DIFlagPrototyped, spFlags: 0)
!174 = !DISubroutineType(types: !175)
!175 = !{!45, !99, !108, !176}
!176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !177, size: 64)
!177 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, flags: DIFlagTypePassByValue, elements: !178, identifier: "_ZTS13__va_list_tag")
!178 = !{!179, !180, !181, !183}
!179 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !177, file: !10, baseType: !69, size: 32)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !177, file: !10, baseType: !69, size: 32, offset: 32)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !177, file: !10, baseType: !182, size: 64, offset: 64)
!182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !177, file: !10, baseType: !182, size: 64, offset: 128)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !185, file: !75, line: 166)
!185 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !81, file: !81, line: 693, type: !174, flags: DIFlagPrototyped, spFlags: 0)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !187, file: !75, line: 169)
!187 = !DISubprogram(name: "vswprintf", scope: !81, file: !81, line: 611, type: !188, flags: DIFlagPrototyped, spFlags: 0)
!188 = !DISubroutineType(types: !189)
!189 = !{!45, !98, !131, !108, !176}
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !191, file: !75, line: 172)
!191 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !81, file: !81, line: 700, type: !192, flags: DIFlagPrototyped, spFlags: 0)
!192 = !DISubroutineType(types: !193)
!193 = !{!45, !108, !108, !176}
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !195, file: !75, line: 174)
!195 = !DISubprogram(name: "vwprintf", scope: !81, file: !81, line: 606, type: !196, flags: DIFlagPrototyped, spFlags: 0)
!196 = !DISubroutineType(types: !197)
!197 = !{!45, !108, !176}
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !199, file: !75, line: 176)
!199 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !81, file: !81, line: 697, type: !196, flags: DIFlagPrototyped, spFlags: 0)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !201, file: !75, line: 178)
!201 = !DISubprogram(name: "wcrtomb", scope: !81, file: !81, line: 301, type: !202, flags: DIFlagPrototyped, spFlags: 0)
!202 = !DISubroutineType(types: !203)
!203 = !{!131, !204, !97, !136}
!204 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !205)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !207, file: !75, line: 179)
!207 = !DISubprogram(name: "wcscat", scope: !81, file: !81, line: 97, type: !208, flags: DIFlagPrototyped, spFlags: 0)
!208 = !DISubroutineType(types: !209)
!209 = !{!96, !98, !108}
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !211, file: !75, line: 180)
!211 = !DISubprogram(name: "wcscmp", scope: !81, file: !81, line: 106, type: !212, flags: DIFlagPrototyped, spFlags: 0)
!212 = !DISubroutineType(types: !213)
!213 = !{!45, !109, !109}
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !215, file: !75, line: 181)
!215 = !DISubprogram(name: "wcscoll", scope: !81, file: !81, line: 131, type: !212, flags: DIFlagPrototyped, spFlags: 0)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !217, file: !75, line: 182)
!217 = !DISubprogram(name: "wcscpy", scope: !81, file: !81, line: 87, type: !208, flags: DIFlagPrototyped, spFlags: 0)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !219, file: !75, line: 183)
!219 = !DISubprogram(name: "wcscspn", scope: !81, file: !81, line: 187, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DISubroutineType(types: !221)
!221 = !{!131, !109, !109}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !223, file: !75, line: 184)
!223 = !DISubprogram(name: "wcsftime", scope: !81, file: !81, line: 834, type: !224, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DISubroutineType(types: !225)
!225 = !{!131, !98, !131, !108, !226}
!226 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !227)
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !228, size: 64)
!228 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !229)
!229 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !81, line: 83, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !231, file: !75, line: 185)
!231 = !DISubprogram(name: "wcslen", scope: !81, file: !81, line: 222, type: !232, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DISubroutineType(types: !233)
!233 = !{!131, !109}
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !235, file: !75, line: 186)
!235 = !DISubprogram(name: "wcsncat", scope: !81, file: !81, line: 101, type: !236, flags: DIFlagPrototyped, spFlags: 0)
!236 = !DISubroutineType(types: !237)
!237 = !{!96, !98, !108, !131}
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !239, file: !75, line: 187)
!239 = !DISubprogram(name: "wcsncmp", scope: !81, file: !81, line: 109, type: !240, flags: DIFlagPrototyped, spFlags: 0)
!240 = !DISubroutineType(types: !241)
!241 = !{!45, !109, !109, !131}
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !243, file: !75, line: 188)
!243 = !DISubprogram(name: "wcsncpy", scope: !81, file: !81, line: 92, type: !236, flags: DIFlagPrototyped, spFlags: 0)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !245, file: !75, line: 189)
!245 = !DISubprogram(name: "wcsrtombs", scope: !81, file: !81, line: 343, type: !246, flags: DIFlagPrototyped, spFlags: 0)
!246 = !DISubroutineType(types: !247)
!247 = !{!131, !204, !248, !131, !136}
!248 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !249)
!249 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !251, file: !75, line: 190)
!251 = !DISubprogram(name: "wcsspn", scope: !81, file: !81, line: 191, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !253, file: !75, line: 191)
!253 = !DISubprogram(name: "wcstod", scope: !81, file: !81, line: 377, type: !254, flags: DIFlagPrototyped, spFlags: 0)
!254 = !DISubroutineType(types: !255)
!255 = !{!256, !108, !257}
!256 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!257 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !258)
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !260, file: !75, line: 193)
!260 = !DISubprogram(name: "wcstof", scope: !81, file: !81, line: 382, type: !261, flags: DIFlagPrototyped, spFlags: 0)
!261 = !DISubroutineType(types: !262)
!262 = !{!263, !108, !257}
!263 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !265, file: !75, line: 195)
!265 = !DISubprogram(name: "wcstok", scope: !81, file: !81, line: 217, type: !266, flags: DIFlagPrototyped, spFlags: 0)
!266 = !DISubroutineType(types: !267)
!267 = !{!96, !98, !108, !257}
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !269, file: !75, line: 196)
!269 = !DISubprogram(name: "wcstol", scope: !81, file: !81, line: 428, type: !270, flags: DIFlagPrototyped, spFlags: 0)
!270 = !DISubroutineType(types: !271)
!271 = !{!272, !108, !257, !45}
!272 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !274, file: !75, line: 197)
!274 = !DISubprogram(name: "wcstoul", scope: !81, file: !81, line: 433, type: !275, flags: DIFlagPrototyped, spFlags: 0)
!275 = !DISubroutineType(types: !276)
!276 = !{!44, !108, !257, !45}
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !278, file: !75, line: 198)
!278 = !DISubprogram(name: "wcsxfrm", scope: !81, file: !81, line: 135, type: !279, flags: DIFlagPrototyped, spFlags: 0)
!279 = !DISubroutineType(types: !280)
!280 = !{!131, !98, !108, !131}
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !282, file: !75, line: 199)
!282 = !DISubprogram(name: "wctob", scope: !81, file: !81, line: 288, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!283 = !DISubroutineType(types: !284)
!284 = !{!45, !77}
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !286, file: !75, line: 200)
!286 = !DISubprogram(name: "wmemcmp", scope: !81, file: !81, line: 258, type: !240, flags: DIFlagPrototyped, spFlags: 0)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !288, file: !75, line: 201)
!288 = !DISubprogram(name: "wmemcpy", scope: !81, file: !81, line: 262, type: !236, flags: DIFlagPrototyped, spFlags: 0)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !290, file: !75, line: 202)
!290 = !DISubprogram(name: "wmemmove", scope: !81, file: !81, line: 267, type: !291, flags: DIFlagPrototyped, spFlags: 0)
!291 = !DISubroutineType(types: !292)
!292 = !{!96, !96, !109, !131}
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !294, file: !75, line: 203)
!294 = !DISubprogram(name: "wmemset", scope: !81, file: !81, line: 271, type: !295, flags: DIFlagPrototyped, spFlags: 0)
!295 = !DISubroutineType(types: !296)
!296 = !{!96, !96, !97, !131}
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !298, file: !75, line: 204)
!298 = !DISubprogram(name: "wprintf", scope: !81, file: !81, line: 587, type: !299, flags: DIFlagPrototyped, spFlags: 0)
!299 = !DISubroutineType(types: !300)
!300 = !{!45, !108, null}
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !302, file: !75, line: 205)
!302 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !81, file: !81, line: 644, type: !299, flags: DIFlagPrototyped, spFlags: 0)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !304, file: !75, line: 206)
!304 = !DISubprogram(name: "wcschr", scope: !81, file: !81, line: 164, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!305 = !DISubroutineType(types: !306)
!306 = !{!96, !109, !97}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !308, file: !75, line: 207)
!308 = !DISubprogram(name: "wcspbrk", scope: !81, file: !81, line: 201, type: !309, flags: DIFlagPrototyped, spFlags: 0)
!309 = !DISubroutineType(types: !310)
!310 = !{!96, !109, !109}
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !312, file: !75, line: 208)
!312 = !DISubprogram(name: "wcsrchr", scope: !81, file: !81, line: 174, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !314, file: !75, line: 209)
!314 = !DISubprogram(name: "wcsstr", scope: !81, file: !81, line: 212, type: !309, flags: DIFlagPrototyped, spFlags: 0)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !316, file: !75, line: 210)
!316 = !DISubprogram(name: "wmemchr", scope: !81, file: !81, line: 253, type: !317, flags: DIFlagPrototyped, spFlags: 0)
!317 = !DISubroutineType(types: !318)
!318 = !{!96, !109, !97, !131}
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !321, file: !75, line: 251)
!320 = !DINamespace(name: "__gnu_cxx", scope: null)
!321 = !DISubprogram(name: "wcstold", scope: !81, file: !81, line: 384, type: !322, flags: DIFlagPrototyped, spFlags: 0)
!322 = !DISubroutineType(types: !323)
!323 = !{!324, !108, !257}
!324 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !326, file: !75, line: 260)
!326 = !DISubprogram(name: "wcstoll", scope: !81, file: !81, line: 441, type: !327, flags: DIFlagPrototyped, spFlags: 0)
!327 = !DISubroutineType(types: !328)
!328 = !{!329, !108, !257, !45}
!329 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !331, file: !75, line: 261)
!331 = !DISubprogram(name: "wcstoull", scope: !81, file: !81, line: 448, type: !332, flags: DIFlagPrototyped, spFlags: 0)
!332 = !DISubroutineType(types: !333)
!333 = !{!334, !108, !257, !45}
!334 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !321, file: !75, line: 267)
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !326, file: !75, line: 268)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !331, file: !75, line: 269)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !260, file: !75, line: 283)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !185, file: !75, line: 286)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !191, file: !75, line: 289)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !199, file: !75, line: 292)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !321, file: !75, line: 296)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !326, file: !75, line: 297)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !331, file: !75, line: 298)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !346, file: !347, line: 68)
!346 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !348, file: !347, line: 90, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!347 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/exception_ptr.h", directory: "")
!348 = !DINamespace(name: "__exception_ptr", scope: !2)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !348, entity: !350, file: !347, line: 84)
!350 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !347, line: 80, type: !351, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!351 = !DISubroutineType(types: !352)
!352 = !{null, !346}
!353 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !354, entity: !355, file: !356, line: 58)
!354 = !DINamespace(name: "__gnu_debug", scope: null)
!355 = !DINamespace(name: "__debug", scope: !2)
!356 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/debug/debug.h", directory: "")
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !358, file: !362, line: 47)
!358 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !359, line: 24, baseType: !360)
!359 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!360 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !16, line: 37, baseType: !361)
!361 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!362 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cstdint", directory: "")
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !364, file: !362, line: 48)
!364 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !359, line: 25, baseType: !365)
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !16, line: 39, baseType: !366)
!366 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !368, file: !362, line: 49)
!368 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !359, line: 26, baseType: !369)
!369 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !16, line: 41, baseType: !45)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !371, file: !362, line: 50)
!371 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !359, line: 27, baseType: !372)
!372 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !16, line: 44, baseType: !272)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !374, file: !362, line: 52)
!374 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !375, line: 58, baseType: !361)
!375 = !DIFile(filename: "/usr/include/stdint.h", directory: "")
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !377, file: !362, line: 53)
!377 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !375, line: 60, baseType: !272)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !379, file: !362, line: 54)
!379 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !375, line: 61, baseType: !272)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !381, file: !362, line: 55)
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !375, line: 62, baseType: !272)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !383, file: !362, line: 57)
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !375, line: 43, baseType: !384)
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !16, line: 52, baseType: !360)
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !386, file: !362, line: 58)
!386 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !375, line: 44, baseType: !387)
!387 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !16, line: 54, baseType: !365)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !389, file: !362, line: 59)
!389 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !375, line: 45, baseType: !390)
!390 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !16, line: 56, baseType: !369)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !392, file: !362, line: 60)
!392 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !375, line: 46, baseType: !393)
!393 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !16, line: 58, baseType: !372)
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !395, file: !362, line: 62)
!395 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !375, line: 101, baseType: !396)
!396 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !16, line: 72, baseType: !272)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !398, file: !362, line: 63)
!398 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !399, line: 267, baseType: !400)
!399 = !DIFile(filename: "/usr/include/unistd.h", directory: "")
!400 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intptr_t", file: !16, line: 206, baseType: !272)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !13, file: !362, line: 65)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !47, file: !362, line: 66)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !404, file: !362, line: 67)
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !14, line: 26, baseType: !405)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !16, line: 42, baseType: !69)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !42, file: !362, line: 68)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !408, file: !362, line: 70)
!408 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !375, line: 71, baseType: !17)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !410, file: !362, line: 71)
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !375, line: 73, baseType: !44)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !412, file: !362, line: 72)
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !375, line: 74, baseType: !44)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !414, file: !362, line: 73)
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !375, line: 75, baseType: !44)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !416, file: !362, line: 75)
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !375, line: 49, baseType: !417)
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !16, line: 53, baseType: !15)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !419, file: !362, line: 76)
!419 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !375, line: 50, baseType: !420)
!420 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !16, line: 55, baseType: !48)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !422, file: !362, line: 77)
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !375, line: 51, baseType: !423)
!423 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !16, line: 57, baseType: !405)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !425, file: !362, line: 78)
!425 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !375, line: 52, baseType: !426)
!426 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !16, line: 59, baseType: !43)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !428, file: !362, line: 80)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !375, line: 102, baseType: !429)
!429 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !16, line: 73, baseType: !44)
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !431, file: !362, line: 81)
!431 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !375, line: 90, baseType: !44)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !433, file: !435, line: 53)
!433 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !434, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!434 = !DIFile(filename: "/usr/include/locale.h", directory: "")
!435 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/clocale", directory: "")
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !437, file: !435, line: 54)
!437 = !DISubprogram(name: "setlocale", scope: !434, file: !434, line: 122, type: !438, flags: DIFlagPrototyped, spFlags: 0)
!438 = !DISubroutineType(types: !439)
!439 = !{!205, !45, !134}
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !441, file: !435, line: 55)
!441 = !DISubprogram(name: "localeconv", scope: !434, file: !434, line: 125, type: !442, flags: DIFlagPrototyped, spFlags: 0)
!442 = !DISubroutineType(types: !443)
!443 = !{!444}
!444 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !433, size: 64)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !446, file: !450, line: 64)
!446 = !DISubprogram(name: "isalnum", scope: !447, file: !447, line: 108, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!447 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!448 = !DISubroutineType(types: !449)
!449 = !{!45, !45}
!450 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cctype", directory: "")
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !452, file: !450, line: 65)
!452 = !DISubprogram(name: "isalpha", scope: !447, file: !447, line: 109, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !454, file: !450, line: 66)
!454 = !DISubprogram(name: "iscntrl", scope: !447, file: !447, line: 110, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !456, file: !450, line: 67)
!456 = !DISubprogram(name: "isdigit", scope: !447, file: !447, line: 111, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !458, file: !450, line: 68)
!458 = !DISubprogram(name: "isgraph", scope: !447, file: !447, line: 113, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !460, file: !450, line: 69)
!460 = !DISubprogram(name: "islower", scope: !447, file: !447, line: 112, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !462, file: !450, line: 70)
!462 = !DISubprogram(name: "isprint", scope: !447, file: !447, line: 114, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !464, file: !450, line: 71)
!464 = !DISubprogram(name: "ispunct", scope: !447, file: !447, line: 115, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !466, file: !450, line: 72)
!466 = !DISubprogram(name: "isspace", scope: !447, file: !447, line: 116, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !468, file: !450, line: 73)
!468 = !DISubprogram(name: "isupper", scope: !447, file: !447, line: 117, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !470, file: !450, line: 74)
!470 = !DISubprogram(name: "isxdigit", scope: !447, file: !447, line: 118, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !472, file: !450, line: 75)
!472 = !DISubprogram(name: "tolower", scope: !447, file: !447, line: 122, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !474, file: !450, line: 76)
!474 = !DISubprogram(name: "toupper", scope: !447, file: !447, line: 125, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !476, file: !450, line: 87)
!476 = !DISubprogram(name: "isblank", scope: !447, file: !447, line: 130, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !478, file: !480, line: 52)
!478 = !DISubprogram(name: "abs", scope: !479, file: !479, line: 840, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!479 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!480 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/std_abs.h", directory: "")
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !482, file: !484, line: 127)
!482 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !479, line: 62, baseType: !483)
!483 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !479, line: 58, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!484 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cstdlib", directory: "")
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !486, file: !484, line: 128)
!486 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !479, line: 70, baseType: !487)
!487 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !479, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !488, identifier: "_ZTS6ldiv_t")
!488 = !{!489, !490}
!489 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !487, file: !479, line: 68, baseType: !272, size: 64)
!490 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !487, file: !479, line: 69, baseType: !272, size: 64, offset: 64)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !492, file: !484, line: 130)
!492 = !DISubprogram(name: "abort", scope: !479, file: !479, line: 591, type: !493, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!493 = !DISubroutineType(types: !494)
!494 = !{null}
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !496, file: !484, line: 134)
!496 = !DISubprogram(name: "atexit", scope: !479, file: !479, line: 595, type: !497, flags: DIFlagPrototyped, spFlags: 0)
!497 = !DISubroutineType(types: !498)
!498 = !{!45, !499}
!499 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !493, size: 64)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !501, file: !484, line: 137)
!501 = !DISubprogram(name: "at_quick_exit", scope: !479, file: !479, line: 600, type: !497, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !503, file: !484, line: 140)
!503 = !DISubprogram(name: "atof", scope: !479, file: !479, line: 101, type: !504, flags: DIFlagPrototyped, spFlags: 0)
!504 = !DISubroutineType(types: !505)
!505 = !{!256, !134}
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !507, file: !484, line: 141)
!507 = !DISubprogram(name: "atoi", scope: !479, file: !479, line: 104, type: !508, flags: DIFlagPrototyped, spFlags: 0)
!508 = !DISubroutineType(types: !509)
!509 = !{!45, !134}
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !511, file: !484, line: 142)
!511 = !DISubprogram(name: "atol", scope: !479, file: !479, line: 107, type: !512, flags: DIFlagPrototyped, spFlags: 0)
!512 = !DISubroutineType(types: !513)
!513 = !{!272, !134}
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !515, file: !484, line: 143)
!515 = !DISubprogram(name: "bsearch", scope: !479, file: !479, line: 820, type: !516, flags: DIFlagPrototyped, spFlags: 0)
!516 = !DISubroutineType(types: !517)
!517 = !{!182, !518, !518, !131, !131, !520}
!518 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !519, size: 64)
!519 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!520 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !479, line: 808, baseType: !521)
!521 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !522, size: 64)
!522 = !DISubroutineType(types: !523)
!523 = !{!45, !518, !518}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !525, file: !484, line: 144)
!525 = !DISubprogram(name: "calloc", scope: !479, file: !479, line: 542, type: !526, flags: DIFlagPrototyped, spFlags: 0)
!526 = !DISubroutineType(types: !527)
!527 = !{!182, !131, !131}
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !529, file: !484, line: 145)
!529 = !DISubprogram(name: "div", scope: !479, file: !479, line: 852, type: !530, flags: DIFlagPrototyped, spFlags: 0)
!530 = !DISubroutineType(types: !531)
!531 = !{!482, !45, !45}
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !533, file: !484, line: 146)
!533 = !DISubprogram(name: "exit", scope: !479, file: !479, line: 617, type: !534, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!534 = !DISubroutineType(types: !535)
!535 = !{null, !45}
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !537, file: !484, line: 147)
!537 = !DISubprogram(name: "free", scope: !479, file: !479, line: 565, type: !538, flags: DIFlagPrototyped, spFlags: 0)
!538 = !DISubroutineType(types: !539)
!539 = !{null, !182}
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !541, file: !484, line: 148)
!541 = !DISubprogram(name: "getenv", scope: !479, file: !479, line: 634, type: !542, flags: DIFlagPrototyped, spFlags: 0)
!542 = !DISubroutineType(types: !543)
!543 = !{!205, !134}
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !545, file: !484, line: 149)
!545 = !DISubprogram(name: "labs", scope: !479, file: !479, line: 841, type: !546, flags: DIFlagPrototyped, spFlags: 0)
!546 = !DISubroutineType(types: !547)
!547 = !{!272, !272}
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !549, file: !484, line: 150)
!549 = !DISubprogram(name: "ldiv", scope: !479, file: !479, line: 854, type: !550, flags: DIFlagPrototyped, spFlags: 0)
!550 = !DISubroutineType(types: !551)
!551 = !{!486, !272, !272}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !553, file: !484, line: 151)
!553 = !DISubprogram(name: "malloc", scope: !479, file: !479, line: 539, type: !554, flags: DIFlagPrototyped, spFlags: 0)
!554 = !DISubroutineType(types: !555)
!555 = !{!182, !131}
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !557, file: !484, line: 153)
!557 = !DISubprogram(name: "mblen", scope: !479, file: !479, line: 922, type: !558, flags: DIFlagPrototyped, spFlags: 0)
!558 = !DISubroutineType(types: !559)
!559 = !{!45, !134, !131}
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !561, file: !484, line: 154)
!561 = !DISubprogram(name: "mbstowcs", scope: !479, file: !479, line: 933, type: !562, flags: DIFlagPrototyped, spFlags: 0)
!562 = !DISubroutineType(types: !563)
!563 = !{!131, !98, !133, !131}
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !565, file: !484, line: 155)
!565 = !DISubprogram(name: "mbtowc", scope: !479, file: !479, line: 925, type: !566, flags: DIFlagPrototyped, spFlags: 0)
!566 = !DISubroutineType(types: !567)
!567 = !{!45, !98, !133, !131}
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !569, file: !484, line: 157)
!569 = !DISubprogram(name: "qsort", scope: !479, file: !479, line: 830, type: !570, flags: DIFlagPrototyped, spFlags: 0)
!570 = !DISubroutineType(types: !571)
!571 = !{null, !182, !131, !131, !520}
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !573, file: !484, line: 160)
!573 = !DISubprogram(name: "quick_exit", scope: !479, file: !479, line: 623, type: !534, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !575, file: !484, line: 163)
!575 = !DISubprogram(name: "rand", scope: !479, file: !479, line: 453, type: !576, flags: DIFlagPrototyped, spFlags: 0)
!576 = !DISubroutineType(types: !577)
!577 = !{!45}
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !579, file: !484, line: 164)
!579 = !DISubprogram(name: "realloc", scope: !479, file: !479, line: 550, type: !580, flags: DIFlagPrototyped, spFlags: 0)
!580 = !DISubroutineType(types: !581)
!581 = !{!182, !182, !131}
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !583, file: !484, line: 165)
!583 = !DISubprogram(name: "srand", scope: !479, file: !479, line: 455, type: !584, flags: DIFlagPrototyped, spFlags: 0)
!584 = !DISubroutineType(types: !585)
!585 = !{null, !69}
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !587, file: !484, line: 166)
!587 = !DISubprogram(name: "strtod", scope: !479, file: !479, line: 117, type: !588, flags: DIFlagPrototyped, spFlags: 0)
!588 = !DISubroutineType(types: !589)
!589 = !{!256, !133, !590}
!590 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !591)
!591 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !593, file: !484, line: 167)
!593 = !DISubprogram(name: "strtol", scope: !479, file: !479, line: 176, type: !594, flags: DIFlagPrototyped, spFlags: 0)
!594 = !DISubroutineType(types: !595)
!595 = !{!272, !133, !590, !45}
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !597, file: !484, line: 168)
!597 = !DISubprogram(name: "strtoul", scope: !479, file: !479, line: 180, type: !598, flags: DIFlagPrototyped, spFlags: 0)
!598 = !DISubroutineType(types: !599)
!599 = !{!44, !133, !590, !45}
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !601, file: !484, line: 169)
!601 = !DISubprogram(name: "system", scope: !479, file: !479, line: 784, type: !508, flags: DIFlagPrototyped, spFlags: 0)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !603, file: !484, line: 171)
!603 = !DISubprogram(name: "wcstombs", scope: !479, file: !479, line: 936, type: !604, flags: DIFlagPrototyped, spFlags: 0)
!604 = !DISubroutineType(types: !605)
!605 = !{!131, !204, !108, !131}
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !607, file: !484, line: 172)
!607 = !DISubprogram(name: "wctomb", scope: !479, file: !479, line: 929, type: !608, flags: DIFlagPrototyped, spFlags: 0)
!608 = !DISubroutineType(types: !609)
!609 = !{!45, !205, !97}
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !611, file: !484, line: 200)
!611 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !479, line: 80, baseType: !612)
!612 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !479, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !613, identifier: "_ZTS7lldiv_t")
!613 = !{!614, !615}
!614 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !612, file: !479, line: 78, baseType: !329, size: 64)
!615 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !612, file: !479, line: 79, baseType: !329, size: 64, offset: 64)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !617, file: !484, line: 206)
!617 = !DISubprogram(name: "_Exit", scope: !479, file: !479, line: 629, type: !534, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !619, file: !484, line: 210)
!619 = !DISubprogram(name: "llabs", scope: !479, file: !479, line: 844, type: !620, flags: DIFlagPrototyped, spFlags: 0)
!620 = !DISubroutineType(types: !621)
!621 = !{!329, !329}
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !623, file: !484, line: 216)
!623 = !DISubprogram(name: "lldiv", scope: !479, file: !479, line: 858, type: !624, flags: DIFlagPrototyped, spFlags: 0)
!624 = !DISubroutineType(types: !625)
!625 = !{!611, !329, !329}
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !627, file: !484, line: 227)
!627 = !DISubprogram(name: "atoll", scope: !479, file: !479, line: 112, type: !628, flags: DIFlagPrototyped, spFlags: 0)
!628 = !DISubroutineType(types: !629)
!629 = !{!329, !134}
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !631, file: !484, line: 228)
!631 = !DISubprogram(name: "strtoll", scope: !479, file: !479, line: 200, type: !632, flags: DIFlagPrototyped, spFlags: 0)
!632 = !DISubroutineType(types: !633)
!633 = !{!329, !133, !590, !45}
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !635, file: !484, line: 229)
!635 = !DISubprogram(name: "strtoull", scope: !479, file: !479, line: 205, type: !636, flags: DIFlagPrototyped, spFlags: 0)
!636 = !DISubroutineType(types: !637)
!637 = !{!334, !133, !590, !45}
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !639, file: !484, line: 231)
!639 = !DISubprogram(name: "strtof", scope: !479, file: !479, line: 123, type: !640, flags: DIFlagPrototyped, spFlags: 0)
!640 = !DISubroutineType(types: !641)
!641 = !{!263, !133, !590}
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !643, file: !484, line: 232)
!643 = !DISubprogram(name: "strtold", scope: !479, file: !479, line: 126, type: !644, flags: DIFlagPrototyped, spFlags: 0)
!644 = !DISubroutineType(types: !645)
!645 = !{!324, !133, !590}
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !611, file: !484, line: 240)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !617, file: !484, line: 242)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !619, file: !484, line: 244)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !650, file: !484, line: 245)
!650 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !320, file: !484, line: 213, type: !624, flags: DIFlagPrototyped, spFlags: 0)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !623, file: !484, line: 246)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !627, file: !484, line: 248)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !639, file: !484, line: 249)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !631, file: !484, line: 250)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !635, file: !484, line: 251)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !643, file: !484, line: 252)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !658, file: !660, line: 98)
!658 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !659, line: 7, baseType: !91)
!659 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!660 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cstdio", directory: "")
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !662, file: !660, line: 99)
!662 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !663, line: 84, baseType: !664)
!663 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!664 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !665, line: 14, baseType: !666)
!665 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "")
!666 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !665, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !668, file: !660, line: 101)
!668 = !DISubprogram(name: "clearerr", scope: !663, file: !663, line: 757, type: !669, flags: DIFlagPrototyped, spFlags: 0)
!669 = !DISubroutineType(types: !670)
!670 = !{null, !671}
!671 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !658, size: 64)
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !673, file: !660, line: 102)
!673 = !DISubprogram(name: "fclose", scope: !663, file: !663, line: 213, type: !674, flags: DIFlagPrototyped, spFlags: 0)
!674 = !DISubroutineType(types: !675)
!675 = !{!45, !671}
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !677, file: !660, line: 103)
!677 = !DISubprogram(name: "feof", scope: !663, file: !663, line: 759, type: !674, flags: DIFlagPrototyped, spFlags: 0)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !679, file: !660, line: 104)
!679 = !DISubprogram(name: "ferror", scope: !663, file: !663, line: 761, type: !674, flags: DIFlagPrototyped, spFlags: 0)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !681, file: !660, line: 105)
!681 = !DISubprogram(name: "fflush", scope: !663, file: !663, line: 218, type: !674, flags: DIFlagPrototyped, spFlags: 0)
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !683, file: !660, line: 106)
!683 = !DISubprogram(name: "fgetc", scope: !663, file: !663, line: 485, type: !674, flags: DIFlagPrototyped, spFlags: 0)
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !685, file: !660, line: 107)
!685 = !DISubprogram(name: "fgetpos", scope: !663, file: !663, line: 731, type: !686, flags: DIFlagPrototyped, spFlags: 0)
!686 = !DISubroutineType(types: !687)
!687 = !{!45, !688, !689}
!688 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !671)
!689 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !690)
!690 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !662, size: 64)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !692, file: !660, line: 108)
!692 = !DISubprogram(name: "fgets", scope: !663, file: !663, line: 564, type: !693, flags: DIFlagPrototyped, spFlags: 0)
!693 = !DISubroutineType(types: !694)
!694 = !{!205, !204, !45, !688}
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !696, file: !660, line: 109)
!696 = !DISubprogram(name: "fopen", scope: !663, file: !663, line: 246, type: !697, flags: DIFlagPrototyped, spFlags: 0)
!697 = !DISubroutineType(types: !698)
!698 = !{!671, !133, !133}
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !700, file: !660, line: 110)
!700 = !DISubprogram(name: "fprintf", scope: !663, file: !663, line: 326, type: !701, flags: DIFlagPrototyped, spFlags: 0)
!701 = !DISubroutineType(types: !702)
!702 = !{!45, !688, !133, null}
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !704, file: !660, line: 111)
!704 = !DISubprogram(name: "fputc", scope: !663, file: !663, line: 521, type: !705, flags: DIFlagPrototyped, spFlags: 0)
!705 = !DISubroutineType(types: !706)
!706 = !{!45, !45, !671}
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !708, file: !660, line: 112)
!708 = !DISubprogram(name: "fputs", scope: !663, file: !663, line: 626, type: !709, flags: DIFlagPrototyped, spFlags: 0)
!709 = !DISubroutineType(types: !710)
!710 = !{!45, !133, !688}
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !712, file: !660, line: 113)
!712 = !DISubprogram(name: "fread", scope: !663, file: !663, line: 646, type: !713, flags: DIFlagPrototyped, spFlags: 0)
!713 = !DISubroutineType(types: !714)
!714 = !{!131, !715, !131, !131, !688}
!715 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !182)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !717, file: !660, line: 114)
!717 = !DISubprogram(name: "freopen", scope: !663, file: !663, line: 252, type: !718, flags: DIFlagPrototyped, spFlags: 0)
!718 = !DISubroutineType(types: !719)
!719 = !{!671, !133, !133, !688}
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !721, file: !660, line: 115)
!721 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !663, file: !663, line: 407, type: !701, flags: DIFlagPrototyped, spFlags: 0)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !723, file: !660, line: 116)
!723 = !DISubprogram(name: "fseek", scope: !663, file: !663, line: 684, type: !724, flags: DIFlagPrototyped, spFlags: 0)
!724 = !DISubroutineType(types: !725)
!725 = !{!45, !671, !272, !45}
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !727, file: !660, line: 117)
!727 = !DISubprogram(name: "fsetpos", scope: !663, file: !663, line: 736, type: !728, flags: DIFlagPrototyped, spFlags: 0)
!728 = !DISubroutineType(types: !729)
!729 = !{!45, !671, !730}
!730 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !731, size: 64)
!731 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !662)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !733, file: !660, line: 118)
!733 = !DISubprogram(name: "ftell", scope: !663, file: !663, line: 689, type: !734, flags: DIFlagPrototyped, spFlags: 0)
!734 = !DISubroutineType(types: !735)
!735 = !{!272, !671}
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !737, file: !660, line: 119)
!737 = !DISubprogram(name: "fwrite", scope: !663, file: !663, line: 652, type: !738, flags: DIFlagPrototyped, spFlags: 0)
!738 = !DISubroutineType(types: !739)
!739 = !{!131, !740, !131, !131, !688}
!740 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !518)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !742, file: !660, line: 120)
!742 = !DISubprogram(name: "getc", scope: !663, file: !663, line: 486, type: !674, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !744, file: !660, line: 121)
!744 = !DISubprogram(name: "getchar", scope: !663, file: !663, line: 492, type: !576, flags: DIFlagPrototyped, spFlags: 0)
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !746, file: !660, line: 126)
!746 = !DISubprogram(name: "perror", scope: !663, file: !663, line: 775, type: !747, flags: DIFlagPrototyped, spFlags: 0)
!747 = !DISubroutineType(types: !748)
!748 = !{null, !134}
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !750, file: !660, line: 127)
!750 = !DISubprogram(name: "printf", scope: !663, file: !663, line: 332, type: !751, flags: DIFlagPrototyped, spFlags: 0)
!751 = !DISubroutineType(types: !752)
!752 = !{!45, !133, null}
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !754, file: !660, line: 128)
!754 = !DISubprogram(name: "putc", scope: !663, file: !663, line: 522, type: !705, flags: DIFlagPrototyped, spFlags: 0)
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !756, file: !660, line: 129)
!756 = !DISubprogram(name: "putchar", scope: !663, file: !663, line: 528, type: !448, flags: DIFlagPrototyped, spFlags: 0)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !758, file: !660, line: 130)
!758 = !DISubprogram(name: "puts", scope: !663, file: !663, line: 632, type: !508, flags: DIFlagPrototyped, spFlags: 0)
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !760, file: !660, line: 131)
!760 = !DISubprogram(name: "remove", scope: !663, file: !663, line: 146, type: !508, flags: DIFlagPrototyped, spFlags: 0)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !762, file: !660, line: 132)
!762 = !DISubprogram(name: "rename", scope: !663, file: !663, line: 148, type: !763, flags: DIFlagPrototyped, spFlags: 0)
!763 = !DISubroutineType(types: !764)
!764 = !{!45, !134, !134}
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !766, file: !660, line: 133)
!766 = !DISubprogram(name: "rewind", scope: !663, file: !663, line: 694, type: !669, flags: DIFlagPrototyped, spFlags: 0)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !768, file: !660, line: 134)
!768 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !663, file: !663, line: 410, type: !751, flags: DIFlagPrototyped, spFlags: 0)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !770, file: !660, line: 135)
!770 = !DISubprogram(name: "setbuf", scope: !663, file: !663, line: 304, type: !771, flags: DIFlagPrototyped, spFlags: 0)
!771 = !DISubroutineType(types: !772)
!772 = !{null, !688, !204}
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !774, file: !660, line: 136)
!774 = !DISubprogram(name: "setvbuf", scope: !663, file: !663, line: 308, type: !775, flags: DIFlagPrototyped, spFlags: 0)
!775 = !DISubroutineType(types: !776)
!776 = !{!45, !688, !204, !45, !131}
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !778, file: !660, line: 137)
!778 = !DISubprogram(name: "sprintf", scope: !663, file: !663, line: 334, type: !779, flags: DIFlagPrototyped, spFlags: 0)
!779 = !DISubroutineType(types: !780)
!780 = !{!45, !204, !133, null}
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !782, file: !660, line: 138)
!782 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !663, file: !663, line: 412, type: !783, flags: DIFlagPrototyped, spFlags: 0)
!783 = !DISubroutineType(types: !784)
!784 = !{!45, !133, !133, null}
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !786, file: !660, line: 139)
!786 = !DISubprogram(name: "tmpfile", scope: !663, file: !663, line: 173, type: !787, flags: DIFlagPrototyped, spFlags: 0)
!787 = !DISubroutineType(types: !788)
!788 = !{!671}
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !790, file: !660, line: 141)
!790 = !DISubprogram(name: "tmpnam", scope: !663, file: !663, line: 187, type: !791, flags: DIFlagPrototyped, spFlags: 0)
!791 = !DISubroutineType(types: !792)
!792 = !{!205, !205}
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !794, file: !660, line: 143)
!794 = !DISubprogram(name: "ungetc", scope: !663, file: !663, line: 639, type: !705, flags: DIFlagPrototyped, spFlags: 0)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !796, file: !660, line: 144)
!796 = !DISubprogram(name: "vfprintf", scope: !663, file: !663, line: 341, type: !797, flags: DIFlagPrototyped, spFlags: 0)
!797 = !DISubroutineType(types: !798)
!798 = !{!45, !688, !133, !176}
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !800, file: !660, line: 145)
!800 = !DISubprogram(name: "vprintf", scope: !663, file: !663, line: 347, type: !801, flags: DIFlagPrototyped, spFlags: 0)
!801 = !DISubroutineType(types: !802)
!802 = !{!45, !133, !176}
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !804, file: !660, line: 146)
!804 = !DISubprogram(name: "vsprintf", scope: !663, file: !663, line: 349, type: !805, flags: DIFlagPrototyped, spFlags: 0)
!805 = !DISubroutineType(types: !806)
!806 = !{!45, !204, !133, !176}
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !808, file: !660, line: 175)
!808 = !DISubprogram(name: "snprintf", scope: !663, file: !663, line: 354, type: !809, flags: DIFlagPrototyped, spFlags: 0)
!809 = !DISubroutineType(types: !810)
!810 = !{!45, !204, !131, !133, null}
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !812, file: !660, line: 176)
!812 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !663, file: !663, line: 451, type: !797, flags: DIFlagPrototyped, spFlags: 0)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !814, file: !660, line: 177)
!814 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !663, file: !663, line: 456, type: !801, flags: DIFlagPrototyped, spFlags: 0)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !816, file: !660, line: 178)
!816 = !DISubprogram(name: "vsnprintf", scope: !663, file: !663, line: 358, type: !817, flags: DIFlagPrototyped, spFlags: 0)
!817 = !DISubroutineType(types: !818)
!818 = !{!45, !204, !131, !133, !176}
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !320, entity: !820, file: !660, line: 179)
!820 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !663, file: !663, line: 459, type: !821, flags: DIFlagPrototyped, spFlags: 0)
!821 = !DISubroutineType(types: !822)
!822 = !{!45, !133, !133, !176}
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !808, file: !660, line: 185)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !812, file: !660, line: 186)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !814, file: !660, line: 187)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !816, file: !660, line: 188)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !820, file: !660, line: 189)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !829, file: !833, line: 82)
!829 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !830, line: 48, baseType: !831)
!830 = !DIFile(filename: "/usr/include/wctype.h", directory: "")
!831 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !832, size: 64)
!832 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !369)
!833 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cwctype", directory: "")
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !835, file: !833, line: 83)
!835 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !836, line: 38, baseType: !44)
!836 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "")
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !77, file: !833, line: 84)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !839, file: !833, line: 86)
!839 = !DISubprogram(name: "iswalnum", scope: !836, file: !836, line: 95, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !841, file: !833, line: 87)
!841 = !DISubprogram(name: "iswalpha", scope: !836, file: !836, line: 101, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !843, file: !833, line: 89)
!843 = !DISubprogram(name: "iswblank", scope: !836, file: !836, line: 146, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !845, file: !833, line: 91)
!845 = !DISubprogram(name: "iswcntrl", scope: !836, file: !836, line: 104, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !847, file: !833, line: 92)
!847 = !DISubprogram(name: "iswctype", scope: !836, file: !836, line: 159, type: !848, flags: DIFlagPrototyped, spFlags: 0)
!848 = !DISubroutineType(types: !849)
!849 = !{!45, !77, !835}
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !851, file: !833, line: 93)
!851 = !DISubprogram(name: "iswdigit", scope: !836, file: !836, line: 108, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !853, file: !833, line: 94)
!853 = !DISubprogram(name: "iswgraph", scope: !836, file: !836, line: 112, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !855, file: !833, line: 95)
!855 = !DISubprogram(name: "iswlower", scope: !836, file: !836, line: 117, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !857, file: !833, line: 96)
!857 = !DISubprogram(name: "iswprint", scope: !836, file: !836, line: 120, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !859, file: !833, line: 97)
!859 = !DISubprogram(name: "iswpunct", scope: !836, file: !836, line: 125, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !861, file: !833, line: 98)
!861 = !DISubprogram(name: "iswspace", scope: !836, file: !836, line: 130, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !863, file: !833, line: 99)
!863 = !DISubprogram(name: "iswupper", scope: !836, file: !836, line: 135, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !865, file: !833, line: 100)
!865 = !DISubprogram(name: "iswxdigit", scope: !836, file: !836, line: 140, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !867, file: !833, line: 101)
!867 = !DISubprogram(name: "towctrans", scope: !830, file: !830, line: 55, type: !868, flags: DIFlagPrototyped, spFlags: 0)
!868 = !DISubroutineType(types: !869)
!869 = !{!77, !77, !829}
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !871, file: !833, line: 102)
!871 = !DISubprogram(name: "towlower", scope: !836, file: !836, line: 166, type: !872, flags: DIFlagPrototyped, spFlags: 0)
!872 = !DISubroutineType(types: !873)
!873 = !{!77, !77}
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !875, file: !833, line: 103)
!875 = !DISubprogram(name: "towupper", scope: !836, file: !836, line: 169, type: !872, flags: DIFlagPrototyped, spFlags: 0)
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !877, file: !833, line: 104)
!877 = !DISubprogram(name: "wctrans", scope: !830, file: !830, line: 52, type: !878, flags: DIFlagPrototyped, spFlags: 0)
!878 = !DISubroutineType(types: !879)
!879 = !{!829, !134}
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !881, file: !833, line: 105)
!881 = !DISubprogram(name: "wctype", scope: !836, file: !836, line: 155, type: !882, flags: DIFlagPrototyped, spFlags: 0)
!882 = !DISubroutineType(types: !883)
!883 = !{!835, !134}
!884 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "crsf_frame_t", file: !885, line: 61, size: 240, flags: DIFlagTypePassByValue, elements: !886, identifier: "_ZTS12crsf_frame_t")
!885 = !DIFile(filename: "./crsf.h", directory: "/home/zrz0517/study/chain_attestation/OP-DFI/src_test")
!886 = !{!887, !892, !893}
!887 = !DIDerivedType(tag: DW_TAG_member, name: "header", scope: !884, file: !885, line: 62, baseType: !888, size: 16)
!888 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "crsf_frame_header_t", file: !885, line: 56, size: 16, flags: DIFlagTypePassByValue, elements: !889, identifier: "_ZTS19crsf_frame_header_t")
!889 = !{!890, !891}
!890 = !DIDerivedType(tag: DW_TAG_member, name: "device_address", scope: !888, file: !885, line: 57, baseType: !13, size: 8)
!891 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !888, file: !885, line: 58, baseType: !13, size: 8, offset: 8)
!892 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !884, file: !885, line: 63, baseType: !13, size: 8, offset: 16)
!893 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !884, file: !885, line: 64, baseType: !894, size: 216, offset: 24)
!894 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 216, elements: !895)
!895 = !{!896}
!896 = !DISubrange(count: 27)
!897 = !DIGlobalVariableExpression(var: !898, expr: !DIExpression())
!898 = distinct !DIGlobalVariable(name: "__dso_handle", scope: !899, file: !903, line: 1, type: !182, isLocal: false, isDefinition: true)
!899 = distinct !DICompileUnit(language: DW_LANG_C89, file: !900, producer: "clang version 9.0.1-12 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !901, globals: !902, nameTableKind: None)
!900 = !DIFile(filename: "/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee/runtime/Intrinsic/dso_handle.c", directory: "/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee/build/runtime/Intrinsic")
!901 = !{}
!902 = !{!897}
!903 = !DIFile(filename: "runtime/Intrinsic/dso_handle.c", directory: "/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee")
!904 = distinct !DICompileUnit(language: DW_LANG_C99, file: !905, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !901, splitDebugInlining: false, nameTableKind: None)
!905 = !DIFile(filename: "symbolic_entry.c", directory: "/home/zrz0517/study/chain_attestation/OP-DFI/src_test")
!906 = distinct !DICompileUnit(language: DW_LANG_C99, file: !907, producer: "clang version 9.0.1-12 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !901, nameTableKind: None)
!907 = !DIFile(filename: "/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee/runtime/Freestanding/memcpy.c", directory: "/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee/build/runtime/Freestanding")
!908 = distinct !DICompileUnit(language: DW_LANG_C99, file: !909, producer: "clang version 9.0.1-12 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !901, nameTableKind: None)
!909 = !DIFile(filename: "/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee/runtime/Freestanding/memset.c", directory: "/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee/build/runtime/Freestanding")
!910 = !{!"clang version 13.0.1 (https://github.com/llvm/llvm-project 75e33f71c2dae584b13a7d1186ae0a038ba98838)"}
!911 = !{!"clang version 9.0.1-12 "}
!912 = !{i32 7, !"Dwarf Version", i32 4}
!913 = !{i32 2, !"Debug Info Version", i32 3}
!914 = !{i32 1, !"wchar_size", i32 4}
!915 = !{i32 7, !"uwtable", i32 1}
!916 = !{i32 7, !"frame-pointer", i32 2}
!917 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_crsf.cpp", scope: !10, file: !10, type: !918, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !901)
!918 = !DISubroutineType(types: !901)
!919 = !DILocation(line: 0, scope: !917)
!920 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !10, file: !10, type: !493, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !901)
!921 = !DILocation(line: 74, column: 25, scope: !922)
!922 = !DILexicalBlockFile(scope: !920, file: !3, discriminator: 0)
!923 = !DILocation(line: 0, scope: !920)
!924 = distinct !DISubprogram(name: "crc8_dvb_s2", linkageName: "_Z11crc8_dvb_s2hh", scope: !925, file: !925, line: 28, type: !926, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !901)
!925 = !DIFile(filename: "./common_rc.h", directory: "/home/zrz0517/study/chain_attestation/OP-DFI/src_test")
!926 = !DISubroutineType(types: !927)
!927 = !{!13, !13, !13}
!928 = !DILocalVariable(name: "crc", arg: 1, scope: !924, file: !925, line: 28, type: !13)
!929 = !DILocation(line: 28, column: 29, scope: !924)
!930 = !DILocalVariable(name: "a", arg: 2, scope: !924, file: !925, line: 28, type: !13)
!931 = !DILocation(line: 28, column: 42, scope: !924)
!932 = !DILocation(line: 29, column: 9, scope: !924)
!933 = !DILocation(line: 29, column: 6, scope: !924)
!934 = !DILocalVariable(name: "i", scope: !935, file: !925, line: 30, type: !45)
!935 = distinct !DILexicalBlock(scope: !924, file: !925, line: 30, column: 2)
!936 = !DILocation(line: 30, column: 11, scope: !935)
!937 = !DILocation(line: 30, column: 7, scope: !935)
!938 = !DILocation(line: 30, column: 18, scope: !939)
!939 = distinct !DILexicalBlock(scope: !935, file: !925, line: 30, column: 2)
!940 = !DILocation(line: 30, column: 20, scope: !939)
!941 = !DILocation(line: 30, column: 2, scope: !935)
!942 = !DILocation(line: 31, column: 7, scope: !943)
!943 = distinct !DILexicalBlock(scope: !944, file: !925, line: 31, column: 7)
!944 = distinct !DILexicalBlock(scope: !939, file: !925, line: 30, column: 29)
!945 = !DILocation(line: 31, column: 11, scope: !943)
!946 = !DILocation(line: 31, column: 7, scope: !944)
!947 = !DILocation(line: 32, column: 11, scope: !948)
!948 = distinct !DILexicalBlock(scope: !943, file: !925, line: 31, column: 18)
!949 = !DILocation(line: 32, column: 15, scope: !948)
!950 = !DILocation(line: 32, column: 21, scope: !948)
!951 = !DILocation(line: 32, column: 10, scope: !948)
!952 = !DILocation(line: 32, column: 8, scope: !948)
!953 = !DILocation(line: 33, column: 3, scope: !948)
!954 = !DILocation(line: 34, column: 8, scope: !955)
!955 = distinct !DILexicalBlock(scope: !943, file: !925, line: 33, column: 8)
!956 = !DILocation(line: 30, column: 26, scope: !939)
!957 = !DILocation(line: 30, column: 2, scope: !939)
!958 = distinct !{!958, !941, !959, !960}
!959 = !DILocation(line: 36, column: 2, scope: !935)
!960 = !{!"llvm.loop.mustprogress"}
!961 = !DILocation(line: 37, column: 9, scope: !924)
!962 = !DILocation(line: 37, column: 2, scope: !924)
!963 = distinct !DISubprogram(name: "crc8_dvb_s2_buf", linkageName: "_Z15crc8_dvb_s2_bufPhi", scope: !925, file: !925, line: 39, type: !964, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !901)
!964 = !DISubroutineType(types: !965)
!965 = !{!13, !50, !45}
!966 = !DILocalVariable(name: "buf", arg: 1, scope: !963, file: !925, line: 39, type: !50)
!967 = !DILocation(line: 39, column: 34, scope: !963)
!968 = !DILocalVariable(name: "len", arg: 2, scope: !963, file: !925, line: 39, type: !45)
!969 = !DILocation(line: 39, column: 43, scope: !963)
!970 = !DILocalVariable(name: "crc", scope: !963, file: !925, line: 40, type: !13)
!971 = !DILocation(line: 40, column: 10, scope: !963)
!972 = !DILocalVariable(name: "i", scope: !973, file: !925, line: 41, type: !45)
!973 = distinct !DILexicalBlock(scope: !963, file: !925, line: 41, column: 2)
!974 = !DILocation(line: 41, column: 11, scope: !973)
!975 = !DILocation(line: 41, column: 7, scope: !973)
!976 = !DILocation(line: 41, column: 18, scope: !977)
!977 = distinct !DILexicalBlock(scope: !973, file: !925, line: 41, column: 2)
!978 = !DILocation(line: 41, column: 22, scope: !977)
!979 = !DILocation(line: 41, column: 20, scope: !977)
!980 = !DILocation(line: 41, column: 2, scope: !973)
!981 = !DILocation(line: 42, column: 21, scope: !982)
!982 = distinct !DILexicalBlock(scope: !977, file: !925, line: 41, column: 31)
!983 = !DILocation(line: 42, column: 26, scope: !982)
!984 = !DILocation(line: 42, column: 30, scope: !982)
!985 = !DILocation(line: 42, column: 9, scope: !982)
!986 = !DILocation(line: 42, column: 7, scope: !982)
!987 = !DILocation(line: 41, column: 28, scope: !977)
!988 = !DILocation(line: 41, column: 2, scope: !977)
!989 = distinct !{!989, !980, !990, !960}
!990 = !DILocation(line: 43, column: 2, scope: !973)
!991 = !DILocation(line: 44, column: 9, scope: !963)
!992 = !DILocation(line: 44, column: 2, scope: !963)
!993 = distinct !DISubprogram(name: "crsf_config", linkageName: "_Z11crsf_configi", scope: !10, file: !10, line: 149, type: !448, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !901)
!994 = !DILocalVariable(name: "uart_fd", arg: 1, scope: !993, file: !10, line: 149, type: !45)
!995 = !DILocation(line: 149, column: 17, scope: !993)
!996 = !DILocation(line: 158, column: 5, scope: !993)
!997 = distinct !DISubprogram(name: "invoke_by_external", scope: !10, file: !10, line: 175, type: !998, scopeLine: 175, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !901)
!998 = !DISubroutineType(types: !999)
!999 = !{null, !45, !45}
!1000 = !DILocalVariable(name: "now", arg: 1, scope: !997, file: !10, line: 175, type: !45)
!1001 = !DILocation(line: 175, column: 29, scope: !997)
!1002 = !DILocalVariable(name: "len", arg: 2, scope: !997, file: !10, line: 175, type: !45)
!1003 = !DILocation(line: 175, column: 38, scope: !997)
!1004 = !DILocalVariable(name: "frame", scope: !997, file: !10, line: 179, type: !1005)
!1005 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1006, size: 4096, elements: !1007)
!1006 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!1007 = !{!1008}
!1008 = !DISubrange(count: 512)
!1009 = !DILocation(line: 179, column: 20, scope: !997)
!1010 = !DILocalVariable(name: "values", scope: !997, file: !10, line: 180, type: !1011)
!1011 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 8192, elements: !1007)
!1012 = !DILocation(line: 180, column: 12, scope: !997)
!1013 = !DILocalVariable(name: "num_values", scope: !997, file: !10, line: 181, type: !45)
!1014 = !DILocation(line: 181, column: 7, scope: !997)
!1015 = !DILocalVariable(name: "max_channels", scope: !997, file: !10, line: 182, type: !45)
!1016 = !DILocation(line: 182, column: 6, scope: !997)
!1017 = !DILocation(line: 183, column: 32, scope: !997)
!1018 = !DILocation(line: 183, column: 37, scope: !997)
!1019 = !DILocation(line: 183, column: 50, scope: !997)
!1020 = !DILocation(line: 183, column: 54, scope: !997)
!1021 = !DILocation(line: 183, column: 53, scope: !997)
!1022 = !DILocation(line: 183, column: 59, scope: !997)
!1023 = !DILocation(line: 184, column: 3, scope: !997)
!1024 = !DILocation(line: 184, column: 39, scope: !997)
!1025 = !DILocation(line: 183, column: 5, scope: !997)
!1026 = !DILocation(line: 187, column: 1, scope: !997)
!1027 = distinct !DISubprogram(name: "crsf_parse", linkageName: "_Z10crsf_parsemPKhiPtS1_t", scope: !10, file: !10, line: 195, type: !1028, scopeLine: 197, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1028 = !DISubroutineType(types: !1029)
!1029 = !{!1030, !1031, !1032, !45, !46, !46, !47}
!1030 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!1031 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!1032 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1006, size: 64)
!1033 = !DILocalVariable(name: "now", arg: 1, scope: !1027, file: !10, line: 195, type: !1031)
!1034 = !DILocation(line: 195, column: 32, scope: !1027)
!1035 = !DILocalVariable(name: "frame", arg: 2, scope: !1027, file: !10, line: 195, type: !1032)
!1036 = !DILocation(line: 195, column: 52, scope: !1027)
!1037 = !DILocalVariable(name: "len", arg: 3, scope: !1027, file: !10, line: 195, type: !45)
!1038 = !DILocation(line: 195, column: 63, scope: !1027)
!1039 = !DILocalVariable(name: "values", arg: 4, scope: !1027, file: !10, line: 195, type: !46)
!1040 = !DILocation(line: 195, column: 78, scope: !1027)
!1041 = !DILocalVariable(name: "num_values", arg: 5, scope: !1027, file: !10, line: 196, type: !46)
!1042 = !DILocation(line: 196, column: 13, scope: !1027)
!1043 = !DILocalVariable(name: "max_channels", arg: 6, scope: !1027, file: !10, line: 196, type: !47)
!1044 = !DILocation(line: 196, column: 34, scope: !1027)
!1045 = !DILocalVariable(name: "ret", scope: !1027, file: !10, line: 198, type: !1030)
!1046 = !DILocation(line: 198, column: 7, scope: !1027)
!1047 = !DILocalVariable(name: "crsf_frame_ptr", scope: !1027, file: !10, line: 199, type: !50)
!1048 = !DILocation(line: 199, column: 11, scope: !1027)
!1049 = !DILocalVariable(name: "len_checked", scope: !1027, file: !10, line: 201, type: !1030)
!1050 = !DILocation(line: 201, column: 7, scope: !1027)
!1051 = !DILocation(line: 202, column: 2, scope: !1027)
!1052 = !DILocation(line: 202, column: 9, scope: !1027)
!1053 = !DILocation(line: 202, column: 13, scope: !1027)
!1054 = !DILocalVariable(name: "current_len", scope: !1055, file: !10, line: 205, type: !1056)
!1055 = distinct !DILexicalBlock(scope: !1027, file: !10, line: 202, column: 18)
!1056 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!1057 = !DILocation(line: 205, column: 13, scope: !1055)
!1058 = !DILocation(line: 205, column: 27, scope: !1055)
!1059 = !DILocation(line: 207, column: 29, scope: !1055)
!1060 = !DILocation(line: 207, column: 26, scope: !1055)
!1061 = !DILocation(line: 210, column: 6, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1055, file: !10, line: 210, column: 6)
!1063 = !DILocation(line: 210, column: 9, scope: !1062)
!1064 = !DILocation(line: 210, column: 6, scope: !1055)
!1065 = !DILocation(line: 211, column: 7, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1062, file: !10, line: 210, column: 28)
!1067 = !DILocation(line: 212, column: 4, scope: !1066)
!1068 = !DILocation(line: 213, column: 3, scope: !1066)
!1069 = !DILocation(line: 215, column: 7, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1055, file: !10, line: 215, column: 7)
!1071 = !DILocation(line: 215, column: 19, scope: !1070)
!1072 = !DILocation(line: 215, column: 7, scope: !1055)
!1073 = !DILocalVariable(name: "i", scope: !1074, file: !10, line: 218, type: !45)
!1074 = distinct !DILexicalBlock(scope: !1075, file: !10, line: 218, column: 4)
!1075 = distinct !DILexicalBlock(scope: !1070, file: !10, line: 215, column: 25)
!1076 = !DILocation(line: 218, column: 13, scope: !1074)
!1077 = !DILocation(line: 218, column: 9, scope: !1074)
!1078 = !DILocation(line: 218, column: 20, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1074, file: !10, line: 218, column: 4)
!1080 = !DILocation(line: 218, column: 24, scope: !1079)
!1081 = !DILocation(line: 218, column: 22, scope: !1079)
!1082 = !DILocation(line: 218, column: 4, scope: !1074)
!1083 = !DILocation(line: 218, column: 48, scope: !1079)
!1084 = !DILocation(line: 218, column: 4, scope: !1079)
!1085 = distinct !{!1085, !1082, !1086, !960}
!1086 = !DILocation(line: 220, column: 4, scope: !1074)
!1087 = !DILocation(line: 223, column: 27, scope: !1075)
!1088 = !DILocation(line: 224, column: 17, scope: !1075)
!1089 = !DILocation(line: 225, column: 4, scope: !1075)
!1090 = !DILocation(line: 228, column: 6, scope: !1055)
!1091 = !DILocation(line: 229, column: 12, scope: !1055)
!1092 = !DILocation(line: 229, column: 9, scope: !1055)
!1093 = !DILocation(line: 231, column: 25, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1055, file: !10, line: 231, column: 7)
!1095 = !DILocation(line: 231, column: 33, scope: !1094)
!1096 = !DILocation(line: 231, column: 45, scope: !1094)
!1097 = !DILocation(line: 231, column: 7, scope: !1094)
!1098 = !DILocation(line: 231, column: 7, scope: !1055)
!1099 = !DILocation(line: 232, column: 8, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1094, file: !10, line: 231, column: 60)
!1101 = !DILocation(line: 233, column: 3, scope: !1100)
!1102 = distinct !{!1102, !1051, !1103, !960}
!1103 = !DILocation(line: 234, column: 2, scope: !1027)
!1104 = !DILocation(line: 237, column: 9, scope: !1027)
!1105 = !DILocation(line: 237, column: 2, scope: !1027)
!1106 = !DILocation(line: 238, column: 1, scope: !1027)
!1107 = distinct !DISubprogram(name: "handle_error_input", linkageName: "_Z18handle_error_inputv", scope: !10, file: !10, line: 190, type: !493, scopeLine: 190, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1108 = !DILocalVariable(name: "i", scope: !1109, file: !10, line: 191, type: !45)
!1109 = distinct !DILexicalBlock(scope: !1107, file: !10, line: 191, column: 2)
!1110 = !DILocation(line: 191, column: 10, scope: !1109)
!1111 = !DILocation(line: 191, column: 6, scope: !1109)
!1112 = !DILocation(line: 191, column: 14, scope: !1113)
!1113 = distinct !DILexicalBlock(scope: !1109, file: !10, line: 191, column: 2)
!1114 = !DILocation(line: 191, column: 15, scope: !1113)
!1115 = !DILocation(line: 191, column: 2, scope: !1109)
!1116 = !DILocation(line: 191, column: 38, scope: !1113)
!1117 = !DILocation(line: 191, column: 2, scope: !1113)
!1118 = distinct !{!1118, !1115, !1119, !960}
!1119 = !DILocation(line: 193, column: 2, scope: !1109)
!1120 = !DILocation(line: 194, column: 1, scope: !1107)
!1121 = distinct !DISubprogram(name: "crsf_parse_buffer", linkageName: "_ZL17crsf_parse_bufferPtS_t", scope: !10, file: !10, line: 265, type: !1122, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1122 = !DISubroutineType(types: !1123)
!1123 = !{!1030, !46, !46, !47}
!1124 = !DILocalVariable(name: "values", arg: 1, scope: !1121, file: !10, line: 265, type: !46)
!1125 = !DILocation(line: 265, column: 41, scope: !1121)
!1126 = !DILocalVariable(name: "num_values", arg: 2, scope: !1121, file: !10, line: 265, type: !46)
!1127 = !DILocation(line: 265, column: 59, scope: !1121)
!1128 = !DILocalVariable(name: "max_channels", arg: 3, scope: !1121, file: !10, line: 265, type: !47)
!1129 = !DILocation(line: 265, column: 80, scope: !1121)
!1130 = !DILocation(line: 267, column: 2, scope: !1121)
!1131 = distinct !DISubprogram(name: "crsf_frame_CRC", linkageName: "_Z14crsf_frame_CRCRK12crsf_frame_t", scope: !10, file: !10, line: 240, type: !1132, scopeLine: 241, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1132 = !DISubroutineType(types: !1133)
!1133 = !{!13, !1134}
!1134 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1135, size: 64)
!1135 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !884)
!1136 = !DILocalVariable(name: "frame", arg: 1, scope: !1131, file: !10, line: 240, type: !1134)
!1137 = !DILocation(line: 240, column: 44, scope: !1131)
!1138 = !DILocalVariable(name: "crc", scope: !1131, file: !10, line: 243, type: !13)
!1139 = !DILocation(line: 243, column: 10, scope: !1131)
!1140 = !DILocation(line: 243, column: 31, scope: !1131)
!1141 = !DILocation(line: 243, column: 37, scope: !1131)
!1142 = !DILocation(line: 243, column: 16, scope: !1131)
!1143 = !DILocalVariable(name: "i", scope: !1144, file: !10, line: 245, type: !45)
!1144 = distinct !DILexicalBlock(scope: !1131, file: !10, line: 245, column: 2)
!1145 = !DILocation(line: 245, column: 11, scope: !1144)
!1146 = !DILocation(line: 245, column: 7, scope: !1144)
!1147 = !DILocation(line: 245, column: 18, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1144, file: !10, line: 245, column: 2)
!1149 = !DILocation(line: 245, column: 22, scope: !1148)
!1150 = !DILocation(line: 245, column: 28, scope: !1148)
!1151 = !DILocation(line: 245, column: 35, scope: !1148)
!1152 = !DILocation(line: 245, column: 42, scope: !1148)
!1153 = !DILocation(line: 245, column: 20, scope: !1148)
!1154 = !DILocation(line: 245, column: 2, scope: !1144)
!1155 = !DILocation(line: 246, column: 21, scope: !1156)
!1156 = distinct !DILexicalBlock(scope: !1148, file: !10, line: 245, column: 52)
!1157 = !DILocation(line: 246, column: 26, scope: !1156)
!1158 = !DILocation(line: 246, column: 32, scope: !1156)
!1159 = !DILocation(line: 246, column: 40, scope: !1156)
!1160 = !DILocation(line: 246, column: 9, scope: !1156)
!1161 = !DILocation(line: 246, column: 7, scope: !1156)
!1162 = !DILocation(line: 245, column: 47, scope: !1148)
!1163 = !DILocation(line: 245, column: 2, scope: !1148)
!1164 = distinct !{!1164, !1154, !1165, !960}
!1165 = !DILocation(line: 247, column: 2, scope: !1144)
!1166 = !DILocation(line: 249, column: 9, scope: !1131)
!1167 = !DILocation(line: 249, column: 2, scope: !1131)
!1168 = distinct !DISubprogram(name: "crsf_send_telemetry_battery", linkageName: "_Z27crsf_send_telemetry_batteryittih", scope: !10, file: !10, line: 460, type: !1169, scopeLine: 461, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1169 = !DISubroutineType(types: !1170)
!1170 = !{!1030, !45, !47, !47, !45, !13}
!1171 = !DILocalVariable(name: "uart_fd", arg: 1, scope: !1168, file: !10, line: 460, type: !45)
!1172 = !DILocation(line: 460, column: 38, scope: !1168)
!1173 = !DILocalVariable(name: "voltage", arg: 2, scope: !1168, file: !10, line: 460, type: !47)
!1174 = !DILocation(line: 460, column: 56, scope: !1168)
!1175 = !DILocalVariable(name: "current", arg: 3, scope: !1168, file: !10, line: 460, type: !47)
!1176 = !DILocation(line: 460, column: 74, scope: !1168)
!1177 = !DILocalVariable(name: "fuel", arg: 4, scope: !1168, file: !10, line: 460, type: !45)
!1178 = !DILocation(line: 460, column: 87, scope: !1168)
!1179 = !DILocalVariable(name: "remaining", arg: 5, scope: !1168, file: !10, line: 460, type: !13)
!1180 = !DILocation(line: 460, column: 101, scope: !1168)
!1181 = !DILocalVariable(name: "buf", scope: !1168, file: !10, line: 462, type: !1182)
!1182 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 96, elements: !1183)
!1183 = !{!1184}
!1184 = !DISubrange(count: 12)
!1185 = !DILocation(line: 462, column: 10, scope: !1168)
!1186 = !DILocalVariable(name: "offset", scope: !1168, file: !10, line: 463, type: !45)
!1187 = !DILocation(line: 463, column: 6, scope: !1168)
!1188 = !DILocation(line: 464, column: 21, scope: !1168)
!1189 = !DILocation(line: 464, column: 2, scope: !1168)
!1190 = !DILocation(line: 465, column: 17, scope: !1168)
!1191 = !DILocation(line: 465, column: 30, scope: !1168)
!1192 = !DILocation(line: 465, column: 2, scope: !1168)
!1193 = !DILocation(line: 466, column: 17, scope: !1168)
!1194 = !DILocation(line: 466, column: 30, scope: !1168)
!1195 = !DILocation(line: 466, column: 2, scope: !1168)
!1196 = !DILocation(line: 467, column: 17, scope: !1168)
!1197 = !DILocation(line: 467, column: 30, scope: !1168)
!1198 = !DILocation(line: 467, column: 2, scope: !1168)
!1199 = !DILocation(line: 468, column: 16, scope: !1168)
!1200 = !DILocation(line: 468, column: 29, scope: !1168)
!1201 = !DILocation(line: 468, column: 2, scope: !1168)
!1202 = !DILocation(line: 469, column: 18, scope: !1168)
!1203 = !DILocation(line: 469, column: 2, scope: !1168)
!1204 = !DILocation(line: 470, column: 15, scope: !1168)
!1205 = !DILocation(line: 470, column: 24, scope: !1168)
!1206 = !DILocation(line: 470, column: 29, scope: !1168)
!1207 = !DILocation(line: 470, column: 9, scope: !1168)
!1208 = !DILocation(line: 470, column: 40, scope: !1168)
!1209 = !DILocation(line: 470, column: 37, scope: !1168)
!1210 = !DILocation(line: 470, column: 2, scope: !1168)
!1211 = distinct !DISubprogram(name: "write_frame_header", linkageName: "_ZL18write_frame_headerPhRi17crsf_frame_type_th", scope: !10, file: !10, line: 445, type: !1212, scopeLine: 446, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1212 = !DISubroutineType(types: !1213)
!1213 = !{null, !50, !1214, !21, !13}
!1214 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !45, size: 64)
!1215 = !DILocalVariable(name: "buf", arg: 1, scope: !1211, file: !10, line: 445, type: !50)
!1216 = !DILocation(line: 445, column: 48, scope: !1211)
!1217 = !DILocalVariable(name: "offset", arg: 2, scope: !1211, file: !10, line: 445, type: !1214)
!1218 = !DILocation(line: 445, column: 58, scope: !1211)
!1219 = !DILocalVariable(name: "type", arg: 3, scope: !1211, file: !10, line: 445, type: !21)
!1220 = !DILocation(line: 445, column: 84, scope: !1211)
!1221 = !DILocalVariable(name: "payload_size", arg: 4, scope: !1211, file: !10, line: 445, type: !13)
!1222 = !DILocation(line: 445, column: 98, scope: !1211)
!1223 = !DILocation(line: 447, column: 16, scope: !1211)
!1224 = !DILocation(line: 447, column: 21, scope: !1211)
!1225 = !DILocation(line: 447, column: 2, scope: !1211)
!1226 = !DILocation(line: 448, column: 16, scope: !1211)
!1227 = !DILocation(line: 448, column: 21, scope: !1211)
!1228 = !DILocation(line: 448, column: 29, scope: !1211)
!1229 = !DILocation(line: 448, column: 42, scope: !1211)
!1230 = !DILocation(line: 448, column: 2, scope: !1211)
!1231 = !DILocation(line: 449, column: 16, scope: !1211)
!1232 = !DILocation(line: 449, column: 21, scope: !1211)
!1233 = !DILocation(line: 449, column: 38, scope: !1211)
!1234 = !DILocation(line: 449, column: 2, scope: !1211)
!1235 = !DILocation(line: 450, column: 1, scope: !1211)
!1236 = distinct !DISubprogram(name: "write_uint16_t", linkageName: "_ZL14write_uint16_tPhRit", scope: !10, file: !10, line: 413, type: !1237, scopeLine: 414, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1237 = !DISubroutineType(types: !1238)
!1238 = !{null, !50, !1214, !47}
!1239 = !DILocalVariable(name: "buf", arg: 1, scope: !1236, file: !10, line: 413, type: !50)
!1240 = !DILocation(line: 413, column: 44, scope: !1236)
!1241 = !DILocalVariable(name: "offset", arg: 2, scope: !1236, file: !10, line: 413, type: !1214)
!1242 = !DILocation(line: 413, column: 54, scope: !1236)
!1243 = !DILocalVariable(name: "value", arg: 3, scope: !1236, file: !10, line: 413, type: !47)
!1244 = !DILocation(line: 413, column: 71, scope: !1236)
!1245 = !DILocation(line: 416, column: 16, scope: !1236)
!1246 = !DILocation(line: 416, column: 22, scope: !1236)
!1247 = !DILocation(line: 416, column: 2, scope: !1236)
!1248 = !DILocation(line: 416, column: 6, scope: !1236)
!1249 = !DILocation(line: 416, column: 14, scope: !1236)
!1250 = !DILocation(line: 417, column: 20, scope: !1236)
!1251 = !DILocation(line: 417, column: 26, scope: !1236)
!1252 = !DILocation(line: 417, column: 2, scope: !1236)
!1253 = !DILocation(line: 417, column: 6, scope: !1236)
!1254 = !DILocation(line: 417, column: 13, scope: !1236)
!1255 = !DILocation(line: 417, column: 18, scope: !1236)
!1256 = !DILocation(line: 418, column: 2, scope: !1236)
!1257 = !DILocation(line: 418, column: 9, scope: !1236)
!1258 = !DILocation(line: 419, column: 1, scope: !1236)
!1259 = distinct !DISubprogram(name: "write_uint24_t", linkageName: "_ZL14write_uint24_tPhRii", scope: !10, file: !10, line: 423, type: !1260, scopeLine: 424, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1260 = !DISubroutineType(types: !1261)
!1261 = !{null, !50, !1214, !45}
!1262 = !DILocalVariable(name: "buf", arg: 1, scope: !1259, file: !10, line: 423, type: !50)
!1263 = !DILocation(line: 423, column: 44, scope: !1259)
!1264 = !DILocalVariable(name: "offset", arg: 2, scope: !1259, file: !10, line: 423, type: !1214)
!1265 = !DILocation(line: 423, column: 54, scope: !1259)
!1266 = !DILocalVariable(name: "value", arg: 3, scope: !1259, file: !10, line: 423, type: !45)
!1267 = !DILocation(line: 423, column: 66, scope: !1259)
!1268 = !DILocation(line: 426, column: 16, scope: !1259)
!1269 = !DILocation(line: 426, column: 22, scope: !1259)
!1270 = !DILocation(line: 426, column: 2, scope: !1259)
!1271 = !DILocation(line: 426, column: 6, scope: !1259)
!1272 = !DILocation(line: 426, column: 14, scope: !1259)
!1273 = !DILocation(line: 427, column: 21, scope: !1259)
!1274 = !DILocation(line: 427, column: 27, scope: !1259)
!1275 = !DILocation(line: 427, column: 33, scope: !1259)
!1276 = !DILocation(line: 427, column: 20, scope: !1259)
!1277 = !DILocation(line: 427, column: 2, scope: !1259)
!1278 = !DILocation(line: 427, column: 6, scope: !1259)
!1279 = !DILocation(line: 427, column: 13, scope: !1259)
!1280 = !DILocation(line: 427, column: 18, scope: !1259)
!1281 = !DILocation(line: 428, column: 20, scope: !1259)
!1282 = !DILocation(line: 428, column: 26, scope: !1259)
!1283 = !DILocation(line: 428, column: 2, scope: !1259)
!1284 = !DILocation(line: 428, column: 6, scope: !1259)
!1285 = !DILocation(line: 428, column: 13, scope: !1259)
!1286 = !DILocation(line: 428, column: 18, scope: !1259)
!1287 = !DILocation(line: 429, column: 2, scope: !1259)
!1288 = !DILocation(line: 429, column: 9, scope: !1259)
!1289 = !DILocation(line: 430, column: 1, scope: !1259)
!1290 = distinct !DISubprogram(name: "write_uint8_t", linkageName: "_ZL13write_uint8_tPhRih", scope: !10, file: !10, line: 406, type: !1291, scopeLine: 407, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1291 = !DISubroutineType(types: !1292)
!1292 = !{null, !50, !1214, !13}
!1293 = !DILocalVariable(name: "buf", arg: 1, scope: !1290, file: !10, line: 406, type: !50)
!1294 = !DILocation(line: 406, column: 43, scope: !1290)
!1295 = !DILocalVariable(name: "offset", arg: 2, scope: !1290, file: !10, line: 406, type: !1214)
!1296 = !DILocation(line: 406, column: 53, scope: !1290)
!1297 = !DILocalVariable(name: "value", arg: 3, scope: !1290, file: !10, line: 406, type: !13)
!1298 = !DILocation(line: 406, column: 69, scope: !1290)
!1299 = !DILocation(line: 408, column: 18, scope: !1290)
!1300 = !DILocation(line: 408, column: 2, scope: !1290)
!1301 = !DILocation(line: 408, column: 6, scope: !1290)
!1302 = !DILocation(line: 408, column: 12, scope: !1290)
!1303 = !DILocation(line: 408, column: 16, scope: !1290)
!1304 = !DILocation(line: 409, column: 1, scope: !1290)
!1305 = distinct !DISubprogram(name: "write_frame_crc", linkageName: "_ZL15write_frame_crcPhRii", scope: !10, file: !10, line: 451, type: !1260, scopeLine: 452, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1306 = !DILocalVariable(name: "buf", arg: 1, scope: !1305, file: !10, line: 451, type: !50)
!1307 = !DILocation(line: 451, column: 45, scope: !1305)
!1308 = !DILocalVariable(name: "offset", arg: 2, scope: !1305, file: !10, line: 451, type: !1214)
!1309 = !DILocation(line: 451, column: 55, scope: !1305)
!1310 = !DILocalVariable(name: "buf_size", arg: 3, scope: !1305, file: !10, line: 451, type: !45)
!1311 = !DILocation(line: 451, column: 67, scope: !1305)
!1312 = !DILocation(line: 454, column: 16, scope: !1305)
!1313 = !DILocation(line: 454, column: 21, scope: !1305)
!1314 = !DILocation(line: 454, column: 45, scope: !1305)
!1315 = !DILocation(line: 454, column: 49, scope: !1305)
!1316 = !DILocation(line: 454, column: 54, scope: !1305)
!1317 = !DILocation(line: 454, column: 63, scope: !1305)
!1318 = !DILocation(line: 454, column: 29, scope: !1305)
!1319 = !DILocation(line: 454, column: 2, scope: !1305)
!1320 = !DILocation(line: 458, column: 1, scope: !1305)
!1321 = distinct !DISubprogram(name: "crsf_send_telemetry_gps", linkageName: "_Z23crsf_send_telemetry_gpsiiittth", scope: !10, file: !10, line: 473, type: !1322, scopeLine: 475, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1322 = !DISubroutineType(types: !1323)
!1323 = !{!1030, !45, !368, !368, !47, !47, !47, !13}
!1324 = !DILocalVariable(name: "uart_fd", arg: 1, scope: !1321, file: !10, line: 473, type: !45)
!1325 = !DILocation(line: 473, column: 34, scope: !1321)
!1326 = !DILocalVariable(name: "latitude", arg: 2, scope: !1321, file: !10, line: 473, type: !368)
!1327 = !DILocation(line: 473, column: 51, scope: !1321)
!1328 = !DILocalVariable(name: "longitude", arg: 3, scope: !1321, file: !10, line: 473, type: !368)
!1329 = !DILocation(line: 473, column: 69, scope: !1321)
!1330 = !DILocalVariable(name: "groundspeed", arg: 4, scope: !1321, file: !10, line: 473, type: !47)
!1331 = !DILocation(line: 473, column: 89, scope: !1321)
!1332 = !DILocalVariable(name: "gps_heading", arg: 5, scope: !1321, file: !10, line: 474, type: !47)
!1333 = !DILocation(line: 474, column: 18, scope: !1321)
!1334 = !DILocalVariable(name: "altitude", arg: 6, scope: !1321, file: !10, line: 474, type: !47)
!1335 = !DILocation(line: 474, column: 40, scope: !1321)
!1336 = !DILocalVariable(name: "num_satellites", arg: 7, scope: !1321, file: !10, line: 474, type: !13)
!1337 = !DILocation(line: 474, column: 58, scope: !1321)
!1338 = !DILocalVariable(name: "buf", scope: !1321, file: !10, line: 476, type: !1339)
!1339 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 152, elements: !1340)
!1340 = !{!1341}
!1341 = !DISubrange(count: 19)
!1342 = !DILocation(line: 476, column: 10, scope: !1321)
!1343 = !DILocalVariable(name: "offset", scope: !1321, file: !10, line: 477, type: !45)
!1344 = !DILocation(line: 477, column: 6, scope: !1321)
!1345 = !DILocation(line: 478, column: 21, scope: !1321)
!1346 = !DILocation(line: 478, column: 2, scope: !1321)
!1347 = !DILocation(line: 479, column: 16, scope: !1321)
!1348 = !DILocation(line: 479, column: 29, scope: !1321)
!1349 = !DILocation(line: 479, column: 2, scope: !1321)
!1350 = !DILocation(line: 480, column: 16, scope: !1321)
!1351 = !DILocation(line: 480, column: 29, scope: !1321)
!1352 = !DILocation(line: 480, column: 2, scope: !1321)
!1353 = !DILocation(line: 481, column: 17, scope: !1321)
!1354 = !DILocation(line: 481, column: 30, scope: !1321)
!1355 = !DILocation(line: 481, column: 2, scope: !1321)
!1356 = !DILocation(line: 482, column: 17, scope: !1321)
!1357 = !DILocation(line: 482, column: 30, scope: !1321)
!1358 = !DILocation(line: 482, column: 2, scope: !1321)
!1359 = !DILocation(line: 483, column: 17, scope: !1321)
!1360 = !DILocation(line: 483, column: 30, scope: !1321)
!1361 = !DILocation(line: 483, column: 2, scope: !1321)
!1362 = !DILocation(line: 484, column: 16, scope: !1321)
!1363 = !DILocation(line: 484, column: 29, scope: !1321)
!1364 = !DILocation(line: 484, column: 2, scope: !1321)
!1365 = !DILocation(line: 485, column: 18, scope: !1321)
!1366 = !DILocation(line: 485, column: 2, scope: !1321)
!1367 = !DILocation(line: 486, column: 15, scope: !1321)
!1368 = !DILocation(line: 486, column: 24, scope: !1321)
!1369 = !DILocation(line: 486, column: 29, scope: !1321)
!1370 = !DILocation(line: 486, column: 9, scope: !1321)
!1371 = !DILocation(line: 486, column: 40, scope: !1321)
!1372 = !DILocation(line: 486, column: 37, scope: !1321)
!1373 = !DILocation(line: 486, column: 2, scope: !1321)
!1374 = distinct !DISubprogram(name: "write_int32_t", linkageName: "_ZL13write_int32_tPhRii", scope: !10, file: !10, line: 435, type: !1375, scopeLine: 436, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1375 = !DISubroutineType(types: !1376)
!1376 = !{null, !50, !1214, !368}
!1377 = !DILocalVariable(name: "buf", arg: 1, scope: !1374, file: !10, line: 435, type: !50)
!1378 = !DILocation(line: 435, column: 43, scope: !1374)
!1379 = !DILocalVariable(name: "offset", arg: 2, scope: !1374, file: !10, line: 435, type: !1214)
!1380 = !DILocation(line: 435, column: 53, scope: !1374)
!1381 = !DILocalVariable(name: "value", arg: 3, scope: !1374, file: !10, line: 435, type: !368)
!1382 = !DILocation(line: 435, column: 69, scope: !1374)
!1383 = !DILocation(line: 438, column: 16, scope: !1374)
!1384 = !DILocation(line: 438, column: 22, scope: !1374)
!1385 = !DILocation(line: 438, column: 2, scope: !1374)
!1386 = !DILocation(line: 438, column: 6, scope: !1374)
!1387 = !DILocation(line: 438, column: 14, scope: !1374)
!1388 = !DILocation(line: 439, column: 21, scope: !1374)
!1389 = !DILocation(line: 439, column: 27, scope: !1374)
!1390 = !DILocation(line: 439, column: 34, scope: !1374)
!1391 = !DILocation(line: 439, column: 20, scope: !1374)
!1392 = !DILocation(line: 439, column: 2, scope: !1374)
!1393 = !DILocation(line: 439, column: 6, scope: !1374)
!1394 = !DILocation(line: 439, column: 13, scope: !1374)
!1395 = !DILocation(line: 439, column: 18, scope: !1374)
!1396 = !DILocation(line: 440, column: 21, scope: !1374)
!1397 = !DILocation(line: 440, column: 27, scope: !1374)
!1398 = !DILocation(line: 440, column: 33, scope: !1374)
!1399 = !DILocation(line: 440, column: 20, scope: !1374)
!1400 = !DILocation(line: 440, column: 2, scope: !1374)
!1401 = !DILocation(line: 440, column: 6, scope: !1374)
!1402 = !DILocation(line: 440, column: 13, scope: !1374)
!1403 = !DILocation(line: 440, column: 18, scope: !1374)
!1404 = !DILocation(line: 441, column: 20, scope: !1374)
!1405 = !DILocation(line: 441, column: 26, scope: !1374)
!1406 = !DILocation(line: 441, column: 2, scope: !1374)
!1407 = !DILocation(line: 441, column: 6, scope: !1374)
!1408 = !DILocation(line: 441, column: 13, scope: !1374)
!1409 = !DILocation(line: 441, column: 18, scope: !1374)
!1410 = !DILocation(line: 442, column: 2, scope: !1374)
!1411 = !DILocation(line: 442, column: 9, scope: !1374)
!1412 = !DILocation(line: 443, column: 1, scope: !1374)
!1413 = distinct !DISubprogram(name: "crsf_send_telemetry_attitude", linkageName: "_Z28crsf_send_telemetry_attitudeisss", scope: !10, file: !10, line: 489, type: !1414, scopeLine: 490, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1414 = !DISubroutineType(types: !1415)
!1415 = !{!1030, !45, !364, !364, !364}
!1416 = !DILocalVariable(name: "uart_fd", arg: 1, scope: !1413, file: !10, line: 489, type: !45)
!1417 = !DILocation(line: 489, column: 39, scope: !1413)
!1418 = !DILocalVariable(name: "pitch", arg: 2, scope: !1413, file: !10, line: 489, type: !364)
!1419 = !DILocation(line: 489, column: 56, scope: !1413)
!1420 = !DILocalVariable(name: "roll", arg: 3, scope: !1413, file: !10, line: 489, type: !364)
!1421 = !DILocation(line: 489, column: 71, scope: !1413)
!1422 = !DILocalVariable(name: "yaw", arg: 4, scope: !1413, file: !10, line: 489, type: !364)
!1423 = !DILocation(line: 489, column: 85, scope: !1413)
!1424 = !DILocalVariable(name: "buf", scope: !1413, file: !10, line: 491, type: !1425)
!1425 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 80, elements: !1426)
!1426 = !{!1427}
!1427 = !DISubrange(count: 10)
!1428 = !DILocation(line: 491, column: 10, scope: !1413)
!1429 = !DILocalVariable(name: "offset", scope: !1413, file: !10, line: 492, type: !45)
!1430 = !DILocation(line: 492, column: 6, scope: !1413)
!1431 = !DILocation(line: 493, column: 21, scope: !1413)
!1432 = !DILocation(line: 493, column: 2, scope: !1413)
!1433 = !DILocation(line: 494, column: 17, scope: !1413)
!1434 = !DILocation(line: 494, column: 30, scope: !1413)
!1435 = !DILocation(line: 494, column: 2, scope: !1413)
!1436 = !DILocation(line: 495, column: 17, scope: !1413)
!1437 = !DILocation(line: 495, column: 30, scope: !1413)
!1438 = !DILocation(line: 495, column: 2, scope: !1413)
!1439 = !DILocation(line: 496, column: 17, scope: !1413)
!1440 = !DILocation(line: 496, column: 30, scope: !1413)
!1441 = !DILocation(line: 496, column: 2, scope: !1413)
!1442 = !DILocation(line: 497, column: 18, scope: !1413)
!1443 = !DILocation(line: 497, column: 2, scope: !1413)
!1444 = !DILocation(line: 498, column: 15, scope: !1413)
!1445 = !DILocation(line: 498, column: 24, scope: !1413)
!1446 = !DILocation(line: 498, column: 29, scope: !1413)
!1447 = !DILocation(line: 498, column: 9, scope: !1413)
!1448 = !DILocation(line: 498, column: 40, scope: !1413)
!1449 = !DILocation(line: 498, column: 37, scope: !1413)
!1450 = !DILocation(line: 498, column: 2, scope: !1413)
!1451 = distinct !DISubprogram(name: "crsf_send_telemetry_flight_mode", linkageName: "_Z31crsf_send_telemetry_flight_modeiPKc", scope: !10, file: !10, line: 501, type: !1452, scopeLine: 502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !901)
!1452 = !DISubroutineType(types: !1453)
!1453 = !{!1030, !45, !134}
!1454 = !DILocalVariable(name: "uart_fd", arg: 1, scope: !1451, file: !10, line: 501, type: !45)
!1455 = !DILocation(line: 501, column: 42, scope: !1451)
!1456 = !DILocalVariable(name: "flight_mode", arg: 2, scope: !1451, file: !10, line: 501, type: !134)
!1457 = !DILocation(line: 501, column: 63, scope: !1451)
!1458 = !DILocalVariable(name: "max_length", scope: !1451, file: !10, line: 503, type: !1056)
!1459 = !DILocation(line: 503, column: 12, scope: !1451)
!1460 = !DILocalVariable(name: "length", scope: !1451, file: !10, line: 504, type: !45)
!1461 = !DILocation(line: 504, column: 6, scope: !1451)
!1462 = !DILocation(line: 504, column: 22, scope: !1451)
!1463 = !DILocation(line: 504, column: 15, scope: !1451)
!1464 = !DILocation(line: 504, column: 35, scope: !1451)
!1465 = !DILocation(line: 506, column: 6, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1451, file: !10, line: 506, column: 6)
!1467 = !DILocation(line: 506, column: 13, scope: !1466)
!1468 = !DILocation(line: 506, column: 6, scope: !1451)
!1469 = !DILocation(line: 0, scope: !1451)
!1470 = !DILocalVariable(name: "buf", scope: !1451, file: !10, line: 510, type: !1471)
!1471 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !1472)
!1472 = !{!1473}
!1473 = !DISubrange(count: 20)
!1474 = !DILocation(line: 510, column: 10, scope: !1451)
!1475 = !DILocalVariable(name: "offset", scope: !1451, file: !10, line: 511, type: !45)
!1476 = !DILocation(line: 511, column: 6, scope: !1451)
!1477 = !DILocation(line: 512, column: 21, scope: !1451)
!1478 = !DILocation(line: 512, column: 66, scope: !1451)
!1479 = !DILocation(line: 512, column: 2, scope: !1451)
!1480 = !DILocation(line: 513, column: 9, scope: !1451)
!1481 = !DILocation(line: 513, column: 15, scope: !1451)
!1482 = !DILocation(line: 513, column: 13, scope: !1451)
!1483 = !DILocation(line: 513, column: 23, scope: !1451)
!1484 = !DILocation(line: 513, column: 36, scope: !1451)
!1485 = !DILocation(line: 513, column: 2, scope: !1451)
!1486 = !DILocation(line: 514, column: 12, scope: !1451)
!1487 = !DILocation(line: 514, column: 9, scope: !1451)
!1488 = !DILocation(line: 515, column: 6, scope: !1451)
!1489 = !DILocation(line: 515, column: 13, scope: !1451)
!1490 = !DILocation(line: 515, column: 2, scope: !1451)
!1491 = !DILocation(line: 515, column: 18, scope: !1451)
!1492 = !DILocation(line: 516, column: 18, scope: !1451)
!1493 = !DILocation(line: 516, column: 31, scope: !1451)
!1494 = !DILocation(line: 516, column: 38, scope: !1451)
!1495 = !DILocation(line: 516, column: 2, scope: !1451)
!1496 = !DILocation(line: 517, column: 15, scope: !1451)
!1497 = !DILocation(line: 517, column: 24, scope: !1451)
!1498 = !DILocation(line: 517, column: 29, scope: !1451)
!1499 = !DILocation(line: 517, column: 9, scope: !1451)
!1500 = !DILocation(line: 517, column: 40, scope: !1451)
!1501 = !DILocation(line: 517, column: 37, scope: !1451)
!1502 = !DILocation(line: 517, column: 2, scope: !1451)
!1503 = distinct !DISubprogram(name: "symbolic_execution_begin", scope: !905, file: !905, line: 7, type: !493, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !904, retainedNodes: !901)
!1504 = !DILocalVariable(name: "now", scope: !1503, file: !905, line: 8, type: !45)
!1505 = !DILocation(line: 8, column: 9, scope: !1503)
!1506 = !DILocalVariable(name: "len", scope: !1503, file: !905, line: 9, type: !45)
!1507 = !DILocation(line: 9, column: 6, scope: !1503)
!1508 = !DILocation(line: 13, column: 24, scope: !1503)
!1509 = !DILocation(line: 13, column: 5, scope: !1503)
!1510 = !DILocation(line: 14, column: 24, scope: !1503)
!1511 = !DILocation(line: 14, column: 5, scope: !1503)
!1512 = !DILocation(line: 18, column: 18, scope: !1503)
!1513 = !DILocation(line: 18, column: 21, scope: !1503)
!1514 = !DILocation(line: 18, column: 29, scope: !1503)
!1515 = !DILocation(line: 18, column: 32, scope: !1503)
!1516 = !DILocation(line: 18, column: 26, scope: !1503)
!1517 = !DILocation(line: 18, column: 17, scope: !1503)
!1518 = !DILocation(line: 18, column: 5, scope: !1503)
!1519 = !DILocation(line: 19, column: 18, scope: !1503)
!1520 = !DILocation(line: 19, column: 21, scope: !1503)
!1521 = !DILocation(line: 19, column: 29, scope: !1503)
!1522 = !DILocation(line: 19, column: 32, scope: !1503)
!1523 = !DILocation(line: 19, column: 26, scope: !1503)
!1524 = !DILocation(line: 19, column: 17, scope: !1503)
!1525 = !DILocation(line: 19, column: 5, scope: !1503)
!1526 = !DILocation(line: 20, column: 24, scope: !1503)
!1527 = !DILocation(line: 20, column: 28, scope: !1503)
!1528 = !DILocation(line: 20, column: 5, scope: !1503)
!1529 = !DILocation(line: 21, column: 2, scope: !1503)
!1530 = distinct !DISubprogram(name: "memcpy", scope: !1531, file: !1531, line: 12, type: !1532, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !906, retainedNodes: !901)
!1531 = !DIFile(filename: "runtime/Freestanding/memcpy.c", directory: "/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee")
!1532 = !DISubroutineType(types: !1533)
!1533 = !{!182, !182, !518, !1534}
!1534 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1535, line: 46, baseType: !44)
!1535 = !DIFile(filename: "/usr/lib/llvm-9/lib/clang/9.0.1/include/stddef.h", directory: "")
!1536 = !DILocalVariable(name: "destaddr", arg: 1, scope: !1530, file: !1531, line: 12, type: !182)
!1537 = !DILocation(line: 12, column: 20, scope: !1530)
!1538 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !1530, file: !1531, line: 12, type: !518)
!1539 = !DILocation(line: 12, column: 42, scope: !1530)
!1540 = !DILocalVariable(name: "len", arg: 3, scope: !1530, file: !1531, line: 12, type: !1534)
!1541 = !DILocation(line: 12, column: 58, scope: !1530)
!1542 = !DILocalVariable(name: "dest", scope: !1530, file: !1531, line: 13, type: !205)
!1543 = !DILocation(line: 13, column: 9, scope: !1530)
!1544 = !DILocation(line: 13, column: 16, scope: !1530)
!1545 = !DILocalVariable(name: "src", scope: !1530, file: !1531, line: 14, type: !134)
!1546 = !DILocation(line: 14, column: 15, scope: !1530)
!1547 = !DILocation(line: 14, column: 21, scope: !1530)
!1548 = !DILocation(line: 16, column: 3, scope: !1530)
!1549 = !DILocation(line: 16, column: 13, scope: !1530)
!1550 = !DILocation(line: 16, column: 16, scope: !1530)
!1551 = !DILocation(line: 17, column: 19, scope: !1530)
!1552 = !DILocation(line: 17, column: 15, scope: !1530)
!1553 = !DILocation(line: 17, column: 10, scope: !1530)
!1554 = !DILocation(line: 17, column: 13, scope: !1530)
!1555 = distinct !{!1555, !1548, !1551}
!1556 = !DILocation(line: 18, column: 10, scope: !1530)
!1557 = !DILocation(line: 18, column: 3, scope: !1530)
!1558 = distinct !DISubprogram(name: "memset", scope: !1559, file: !1559, line: 12, type: !1560, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !908, retainedNodes: !901)
!1559 = !DIFile(filename: "runtime/Freestanding/memset.c", directory: "/home/zrz0517/study/chain_attestation/OP-DFI/toolchain/klee")
!1560 = !DISubroutineType(types: !1561)
!1561 = !{!182, !182, !45, !1534}
!1562 = !DILocalVariable(name: "dst", arg: 1, scope: !1558, file: !1559, line: 12, type: !182)
!1563 = !DILocation(line: 12, column: 20, scope: !1558)
!1564 = !DILocalVariable(name: "s", arg: 2, scope: !1558, file: !1559, line: 12, type: !45)
!1565 = !DILocation(line: 12, column: 29, scope: !1558)
!1566 = !DILocalVariable(name: "count", arg: 3, scope: !1558, file: !1559, line: 12, type: !1534)
!1567 = !DILocation(line: 12, column: 39, scope: !1558)
!1568 = !DILocalVariable(name: "a", scope: !1558, file: !1559, line: 13, type: !205)
!1569 = !DILocation(line: 13, column: 9, scope: !1558)
!1570 = !DILocation(line: 13, column: 13, scope: !1558)
!1571 = !DILocation(line: 14, column: 3, scope: !1558)
!1572 = !DILocation(line: 14, column: 15, scope: !1558)
!1573 = !DILocation(line: 14, column: 18, scope: !1558)
!1574 = !DILocation(line: 15, column: 12, scope: !1558)
!1575 = !DILocation(line: 15, column: 7, scope: !1558)
!1576 = !DILocation(line: 15, column: 10, scope: !1558)
!1577 = distinct !{!1577, !1571, !1574}
!1578 = !DILocation(line: 16, column: 10, scope: !1558)
!1579 = !DILocation(line: 16, column: 3, scope: !1558)
