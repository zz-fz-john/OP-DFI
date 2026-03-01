; ModuleID = './output/data_flow_test.bc'
source_filename = "data_flow_test.c"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv6kz-unknown-linux-gnueabihf"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.cmd_t = type { i32, i32, [1 x i8] }

@.str = private unnamed_addr constant [44 x i8] c"[op_move_arm] called with n=%d, param=\22%s\22\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"(null)\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"Read %zu bytes from %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"./peripheral_input.txt\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"Enter command (e.g. \22move 42\22 or \22quit\22): \00", align 1
@stdin = external dso_local global %struct._IO_FILE*, align 4
@.str.6 = private unnamed_addr constant [5 x i8] c"quit\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"move\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"Parsed move command.\0A\00", align 1
@.str.9 = private unnamed_addr constant [19 x i8] c"nova_sensitive_var\00", section "llvm.metadata"
@.str.10 = private unnamed_addr constant [17 x i8] c"data_flow_test.c\00", section "llvm.metadata"
@.str.11 = private unnamed_addr constant [45 x i8] c"get_input failed or returned bad status: %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [39 x i8] c"No command read: exiting main_looper.\0A\00", align 1
@.str.13 = private unnamed_addr constant [58 x i8] c"Starting main_looper demo. Type commands in the prompts.\0A\00", align 1
@.str.14 = private unnamed_addr constant [26 x i8] c"main_looper exited. Bye.\0A\00", align 1
@.str.15 = private unnamed_addr constant [18 x i8] c"critical function\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32, i8* }] [{ i8*, i8*, i8*, i32, i8* } { i8* bitcast (i32 ()* @main to i8*), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.10, i32 0, i32 0), i32 159, i8* null }], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @op_move_arm(i32 %n, i8* %param) #0 !dbg !32 {
entry:
  %n.addr = alloca i32, align 4
  %param.addr = alloca i8*, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !38, metadata !DIExpression()), !dbg !39
  store i8* %param, i8** %param.addr, align 4
  call void @llvm.dbg.declare(metadata i8** %param.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i32, i32* %n.addr, align 4, !dbg !42
  %1 = load i8*, i8** %param.addr, align 4, !dbg !43
  %tobool = icmp ne i8* %1, null, !dbg !43
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !43

cond.true:                                        ; preds = %entry
  %2 = load i8*, i8** %param.addr, align 4, !dbg !44
  br label %cond.end, !dbg !43

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !43

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %2, %cond.true ], [ getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), %cond.false ], !dbg !43
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 %0, i8* %cond), !dbg !45
  ret i32 0, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone
define dso_local i32 (i32, i8*)* @get_op_func(i32 %op) #0 !dbg !47 {
entry:
  %op.addr = alloca i32, align 4
  store i32 %op, i32* %op.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %op.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i32, i32* %op.addr, align 4, !dbg !53
  ret i32 (i32, i8*)* @op_move_arm, !dbg !54
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @status_OK(i32 %st) #0 !dbg !55 {
entry:
  %st.addr = alloca i32, align 4
  store i32 %st, i32* %st.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %st.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = load i32, i32* %st.addr, align 4, !dbg !60
  %cmp = icmp sge i32 %0, 0, !dbg !61
  %conv = zext i1 %cmp to i32, !dbg !61
  ret i32 %conv, !dbg !62
}

; Function Attrs: noinline nounwind optnone
define dso_local void @read_char_from_file(i8* %filename, i8* %buffer, i32 %buffer_size) #0 !dbg !63 {
entry:
  %filename.addr = alloca i8*, align 4
  %buffer.addr = alloca i8*, align 4
  %buffer_size.addr = alloca i32, align 4
  %file = alloca %struct._IO_FILE*, align 4
  %bytes_read = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 4
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8* %buffer, i8** %buffer.addr, align 4
  call void @llvm.dbg.declare(metadata i8** %buffer.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 %buffer_size, i32* %buffer_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %buffer_size.addr, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %file, metadata !76, metadata !DIExpression()), !dbg !135
  %0 = load i8*, i8** %filename.addr, align 4, !dbg !136
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0)), !dbg !137
  store %struct._IO_FILE* %call, %struct._IO_FILE** %file, align 4, !dbg !135
  call void @llvm.dbg.declare(metadata i32* %bytes_read, metadata !138, metadata !DIExpression()), !dbg !139
  %1 = load i8*, i8** %buffer.addr, align 4, !dbg !140
  %2 = load i32, i32* %buffer_size.addr, align 4, !dbg !141
  %sub = sub i32 %2, 1, !dbg !142
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 4, !dbg !143
  %call1 = call i32 @fread(i8* %1, i32 1, i32 %sub, %struct._IO_FILE* %3), !dbg !144
  store i32 %call1, i32* %bytes_read, align 4, !dbg !139
  %4 = load i32, i32* %bytes_read, align 4, !dbg !145
  %5 = load i8*, i8** %filename.addr, align 4, !dbg !146
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i32 0, i32 0), i32 %4, i8* %5), !dbg !147
  %6 = load i8*, i8** %buffer.addr, align 4, !dbg !148
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 0, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 4, !dbg !150
  %call3 = call i32 @fclose(%struct._IO_FILE* %7), !dbg !151
  ret void, !dbg !152
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i32 @fread(i8*, i32, i32, %struct._IO_FILE*) #2

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind optnone
define dso_local void @get_input() #0 !dbg !153 {
entry:
  %peripheral_input = alloca [1 x i8], align 1
  call void @llvm.dbg.declare(metadata [1 x i8]* %peripheral_input, metadata !156, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [1 x i8], [1 x i8]* %peripheral_input, i32 0, i32 0, !dbg !158
  call void @read_char_from_file(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0), i8* %arraydecay, i32 1000), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @read_command(%struct.cmd_t* %cmd) #0 !dbg !161 {
entry:
  %retval = alloca i32, align 4
  %cmd.addr = alloca %struct.cmd_t*, align 4
  %line = alloca [256 x i8], align 1
  %L = alloca i32, align 4
  %p = alloca i8*, align 4
  store %struct.cmd_t* %cmd, %struct.cmd_t** %cmd.addr, align 4
  call void @llvm.dbg.declare(metadata %struct.cmd_t** %cmd.addr, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [256 x i8]* %line, metadata !173, metadata !DIExpression()), !dbg !177
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i32 0, i32 0)), !dbg !178
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %line, i32 0, i32 0, !dbg !179
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4, !dbg !181
  %call1 = call i8* @fgets(i8* %arraydecay, i32 256, %struct._IO_FILE* %0), !dbg !182
  %tobool = icmp ne i8* %call1, null, !dbg !182
  br i1 %tobool, label %if.end, label %if.then, !dbg !183

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !184
  br label %return, !dbg !184

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %L, metadata !186, metadata !DIExpression()), !dbg !187
  %arraydecay2 = getelementptr inbounds [256 x i8], [256 x i8]* %line, i32 0, i32 0, !dbg !188
  %call3 = call i32 @strlen(i8* %arraydecay2) #8, !dbg !189
  store i32 %call3, i32* %L, align 4, !dbg !187
  %1 = load i32, i32* %L, align 4, !dbg !190
  %cmp = icmp ugt i32 %1, 0, !dbg !192
  br i1 %cmp, label %land.lhs.true, label %if.end8, !dbg !193

land.lhs.true:                                    ; preds = %if.end
  %2 = load i32, i32* %L, align 4, !dbg !194
  %sub = sub i32 %2, 1, !dbg !195
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %line, i32 0, i32 %sub, !dbg !196
  %3 = load i8, i8* %arrayidx, align 1, !dbg !196
  %conv = zext i8 %3 to i32, !dbg !196
  %cmp4 = icmp eq i32 %conv, 10, !dbg !197
  br i1 %cmp4, label %if.then6, label %if.end8, !dbg !198

if.then6:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %L, align 4, !dbg !199
  %dec = add i32 %4, -1, !dbg !199
  store i32 %dec, i32* %L, align 4, !dbg !199
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* %line, i32 0, i32 %dec, !dbg !200
  store i8 0, i8* %arrayidx7, align 1, !dbg !201
  br label %if.end8, !dbg !200

if.end8:                                          ; preds = %if.then6, %land.lhs.true, %if.end
  call void @llvm.dbg.declare(metadata i8** %p, metadata !202, metadata !DIExpression()), !dbg !203
  %arraydecay9 = getelementptr inbounds [256 x i8], [256 x i8]* %line, i32 0, i32 0, !dbg !204
  store i8* %arraydecay9, i8** %p, align 4, !dbg !203
  br label %while.cond, !dbg !205

while.cond:                                       ; preds = %while.body, %if.end8
  %5 = load i8*, i8** %p, align 4, !dbg !206
  %6 = load i8, i8* %5, align 1, !dbg !207
  %conv10 = zext i8 %6 to i32, !dbg !207
  %tobool11 = icmp ne i32 %conv10, 0, !dbg !207
  br i1 %tobool11, label %land.rhs, label %land.end, !dbg !208

land.rhs:                                         ; preds = %while.cond
  %call12 = call i16** @__ctype_b_loc() #9, !dbg !209
  %7 = load i16*, i16** %call12, align 4, !dbg !209
  %8 = load i8*, i8** %p, align 4, !dbg !209
  %9 = load i8, i8* %8, align 1, !dbg !209
  %conv13 = zext i8 %9 to i32, !dbg !209
  %arrayidx14 = getelementptr inbounds i16, i16* %7, i32 %conv13, !dbg !209
  %10 = load i16, i16* %arrayidx14, align 2, !dbg !209
  %conv15 = zext i16 %10 to i32, !dbg !209
  %and = and i32 %conv15, 8192, !dbg !209
  %tobool16 = icmp ne i32 %and, 0, !dbg !208
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %11 = phi i1 [ false, %while.cond ], [ %tobool16, %land.rhs ], !dbg !210
  br i1 %11, label %while.body, label %while.end, !dbg !205

while.body:                                       ; preds = %land.end
  %12 = load i8*, i8** %p, align 4, !dbg !211
  %incdec.ptr = getelementptr inbounds i8, i8* %12, i32 1, !dbg !211
  store i8* %incdec.ptr, i8** %p, align 4, !dbg !211
  br label %while.cond, !dbg !205, !llvm.loop !212

while.end:                                        ; preds = %land.end
  %13 = load i8*, i8** %p, align 4, !dbg !215
  %call17 = call i32 @strncmp(i8* %13, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i32 4) #8, !dbg !217
  %cmp18 = icmp eq i32 %call17, 0, !dbg !218
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !219

if.then20:                                        ; preds = %while.end
  %14 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !220
  %op = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %14, i32 0, i32 1, !dbg !222
  store i32 0, i32* %op, align 4, !dbg !223
  store i32 0, i32* %retval, align 4, !dbg !224
  br label %return, !dbg !224

if.end21:                                         ; preds = %while.end
  %15 = load i8*, i8** %p, align 4, !dbg !225
  %call22 = call i32 @strncmp(i8* %15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i32 4) #8, !dbg !227
  %cmp23 = icmp eq i32 %call22, 0, !dbg !228
  br i1 %cmp23, label %if.then25, label %if.end57, !dbg !229

if.then25:                                        ; preds = %if.end21
  %16 = load i8*, i8** %p, align 4, !dbg !230
  %add.ptr = getelementptr inbounds i8, i8* %16, i32 4, !dbg !230
  store i8* %add.ptr, i8** %p, align 4, !dbg !230
  br label %while.cond26, !dbg !232

while.cond26:                                     ; preds = %while.body37, %if.then25
  %17 = load i8*, i8** %p, align 4, !dbg !233
  %18 = load i8, i8* %17, align 1, !dbg !234
  %conv27 = zext i8 %18 to i32, !dbg !234
  %tobool28 = icmp ne i32 %conv27, 0, !dbg !234
  br i1 %tobool28, label %land.rhs29, label %land.end36, !dbg !235

land.rhs29:                                       ; preds = %while.cond26
  %call30 = call i16** @__ctype_b_loc() #9, !dbg !236
  %19 = load i16*, i16** %call30, align 4, !dbg !236
  %20 = load i8*, i8** %p, align 4, !dbg !236
  %21 = load i8, i8* %20, align 1, !dbg !236
  %conv31 = zext i8 %21 to i32, !dbg !236
  %arrayidx32 = getelementptr inbounds i16, i16* %19, i32 %conv31, !dbg !236
  %22 = load i16, i16* %arrayidx32, align 2, !dbg !236
  %conv33 = zext i16 %22 to i32, !dbg !236
  %and34 = and i32 %conv33, 8192, !dbg !236
  %tobool35 = icmp ne i32 %and34, 0, !dbg !235
  br label %land.end36

land.end36:                                       ; preds = %land.rhs29, %while.cond26
  %23 = phi i1 [ false, %while.cond26 ], [ %tobool35, %land.rhs29 ], !dbg !237
  br i1 %23, label %while.body37, label %while.end39, !dbg !232

while.body37:                                     ; preds = %land.end36
  %24 = load i8*, i8** %p, align 4, !dbg !238
  %incdec.ptr38 = getelementptr inbounds i8, i8* %24, i32 1, !dbg !238
  store i8* %incdec.ptr38, i8** %p, align 4, !dbg !238
  br label %while.cond26, !dbg !232, !llvm.loop !239

while.end39:                                      ; preds = %land.end36
  %25 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !241
  %op40 = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %25, i32 0, i32 1, !dbg !242
  store i32 1, i32* %op40, align 4, !dbg !243
  %call41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i32 0, i32 0)), !dbg !244
  %26 = load i8*, i8** %p, align 4, !dbg !245
  %27 = load i8, i8* %26, align 1, !dbg !247
  %conv42 = zext i8 %27 to i32, !dbg !247
  %cmp43 = icmp eq i32 %conv42, 0, !dbg !248
  br i1 %cmp43, label %if.then45, label %if.else, !dbg !249

if.then45:                                        ; preds = %while.end39
  %28 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !250
  %p_size = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %28, i32 0, i32 0, !dbg !252
  store i32 0, i32* %p_size, align 4, !dbg !253
  %29 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !254
  %param = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %29, i32 0, i32 2, !dbg !255
  %arrayidx46 = getelementptr inbounds [1 x i8], [1 x i8]* %param, i32 0, i32 0, !dbg !254
  store i8 0, i8* %arrayidx46, align 4, !dbg !256
  br label %if.end56, !dbg !257

if.else:                                          ; preds = %while.end39
  %30 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !258
  %param47 = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %30, i32 0, i32 2, !dbg !260
  %arraydecay48 = getelementptr inbounds [1 x i8], [1 x i8]* %param47, i32 0, i32 0, !dbg !258
  %31 = load i8*, i8** %p, align 4, !dbg !261
  %call49 = call i8* @strncpy(i8* %arraydecay48, i8* %31, i32 0) #10, !dbg !262
  %32 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !263
  %param50 = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %32, i32 0, i32 2, !dbg !264
  %arrayidx51 = getelementptr inbounds [1 x i8], [1 x i8]* %param50, i32 0, i32 0, !dbg !263
  store i8 0, i8* %arrayidx51, align 4, !dbg !265
  %33 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !266
  %param52 = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %33, i32 0, i32 2, !dbg !267
  %arraydecay53 = getelementptr inbounds [1 x i8], [1 x i8]* %param52, i32 0, i32 0, !dbg !266
  %call54 = call i32 @strlen(i8* %arraydecay53) #8, !dbg !268
  %34 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !269
  %p_size55 = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %34, i32 0, i32 0, !dbg !270
  store i32 %call54, i32* %p_size55, align 4, !dbg !271
  br label %if.end56

if.end56:                                         ; preds = %if.else, %if.then45
  store i32 3, i32* %retval, align 4, !dbg !272
  br label %return, !dbg !272

if.end57:                                         ; preds = %if.end21
  %35 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !273
  %param58 = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %35, i32 0, i32 2, !dbg !274
  %arraydecay59 = getelementptr inbounds [1 x i8], [1 x i8]* %param58, i32 0, i32 0, !dbg !273
  %36 = load i8*, i8** %p, align 4, !dbg !275
  %call60 = call i8* @strncpy(i8* %arraydecay59, i8* %36, i32 0) #10, !dbg !276
  %37 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !277
  %param61 = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %37, i32 0, i32 2, !dbg !278
  %arrayidx62 = getelementptr inbounds [1 x i8], [1 x i8]* %param61, i32 0, i32 0, !dbg !277
  store i8 0, i8* %arrayidx62, align 4, !dbg !279
  %38 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !280
  %op63 = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %38, i32 0, i32 1, !dbg !281
  store i32 1, i32* %op63, align 4, !dbg !282
  %39 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !283
  %param64 = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %39, i32 0, i32 2, !dbg !284
  %arraydecay65 = getelementptr inbounds [1 x i8], [1 x i8]* %param64, i32 0, i32 0, !dbg !283
  %call66 = call i32 @strlen(i8* %arraydecay65) #8, !dbg !285
  %40 = load %struct.cmd_t*, %struct.cmd_t** %cmd.addr, align 4, !dbg !286
  %p_size67 = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %40, i32 0, i32 0, !dbg !287
  store i32 %call66, i32* %p_size67, align 4, !dbg !288
  store i32 3, i32* %retval, align 4, !dbg !289
  br label %return, !dbg !289

return:                                           ; preds = %if.end57, %if.end56, %if.then20, %if.then
  %41 = load i32, i32* %retval, align 4, !dbg !290
  ret i32 %41, !dbg !290
}

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @strlen(i8*) #3

; Function Attrs: nounwind readnone willreturn
declare dso_local i16** @__ctype_b_loc() #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @strncmp(i8*, i8*, i32) #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i32) #5

; Function Attrs: noinline nounwind optnone
define dso_local void @main_looper() #0 !dbg !291 {
entry:
  %dynamic_size = alloca i32, align 4
  %saved_stack = alloca i8*, align 4
  %__vla_expr0 = alloca i32, align 4
  %st = alloca i32, align 4
  %cmd = alloca %struct.cmd_t, align 4
  %op_func = alloca i32 (i32, i8*)*, align 4
  call void @llvm.dbg.declare(metadata i32* %dynamic_size, metadata !292, metadata !DIExpression()), !dbg !294
  store volatile i32 4, i32* %dynamic_size, align 4, !dbg !294
  %0 = load volatile i32, i32* %dynamic_size, align 4, !dbg !295
  %1 = call i8* @llvm.stacksave(), !dbg !296
  store i8* %1, i8** %saved_stack, align 4, !dbg !296
  %vla = alloca i8, i32 %0, align 1, !dbg !296
  store i32 %0, i32* %__vla_expr0, align 4, !dbg !296
  call void @llvm.dbg.declare(metadata i32* %__vla_expr0, metadata !297, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.declare(metadata i8* %vla, metadata !299, metadata !DIExpression()), !dbg !303
  %arrayidx = getelementptr inbounds i8, i8* %vla, i32 0, !dbg !304
  store i8 0, i8* %arrayidx, align 1, !dbg !305
  call void @llvm.dbg.declare(metadata i32* %st, metadata !306, metadata !DIExpression()), !dbg !307
  store i32 0, i32* %st, align 4, !dbg !307
  call void @llvm.dbg.declare(metadata %struct.cmd_t* %cmd, metadata !308, metadata !DIExpression()), !dbg !309
  %cmd1 = bitcast %struct.cmd_t* %cmd to i8*, !dbg !310
  call void @llvm.var.annotation(i8* %cmd1, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.10, i32 0, i32 0), i32 127, i8* null), !dbg !310
  call void @llvm.dbg.declare(metadata i32 (i32, i8*)** %op_func, metadata !311, metadata !DIExpression()), !dbg !312
  br label %while.cond, !dbg !313

while.cond:                                       ; preds = %if.end8, %entry
  br label %while.body, !dbg !313

while.body:                                       ; preds = %while.cond
  %call = call i32 @read_command(%struct.cmd_t* %cmd), !dbg !314
  store i32 %call, i32* %st, align 4, !dbg !317
  %tobool = icmp ne i32 %call, 0, !dbg !317
  br i1 %tobool, label %if.then, label %if.else6, !dbg !318

if.then:                                          ; preds = %while.body
  call void @get_input(), !dbg !319
  %2 = load i32, i32* %st, align 4, !dbg !321
  %cmp = icmp sgt i32 %2, 2, !dbg !323
  br i1 %cmp, label %if.then2, label %if.else, !dbg !324

if.then2:                                         ; preds = %if.then
  %op = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %cmd, i32 0, i32 1, !dbg !325
  %3 = load i32, i32* %op, align 4, !dbg !325
  %call3 = call i32 (i32, i8*)* @get_op_func(i32 %3), !dbg !327
  store i32 (i32, i8*)* %call3, i32 (i32, i8*)** %op_func, align 4, !dbg !328
  %4 = load i32 (i32, i8*)*, i32 (i32, i8*)** %op_func, align 4, !dbg !329
  %p_size = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %cmd, i32 0, i32 0, !dbg !330
  %5 = load i32, i32* %p_size, align 4, !dbg !330
  %param = getelementptr inbounds %struct.cmd_t, %struct.cmd_t* %cmd, i32 0, i32 2, !dbg !331
  %arraydecay = getelementptr inbounds [1 x i8], [1 x i8]* %param, i32 0, i32 0, !dbg !332
  %call4 = call i32 %4(i32 %5, i8* %arraydecay), !dbg !333
  br label %if.end, !dbg !334

if.else:                                          ; preds = %if.then
  %6 = load i32, i32* %st, align 4, !dbg !335
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.11, i32 0, i32 0), i32 %6), !dbg !337
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end8, !dbg !338

if.else6:                                         ; preds = %while.body
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.12, i32 0, i32 0)), !dbg !339
  br label %while.end, !dbg !341

if.end8:                                          ; preds = %if.end
  %call9 = call i32 @usleep(i32 100000), !dbg !342
  br label %while.cond, !dbg !313, !llvm.loop !343

while.end:                                        ; preds = %if.else6
  %7 = load i8*, i8** %saved_stack, align 4, !dbg !345
  call void @llvm.stackrestore(i8* %7), !dbg !345
  ret void, !dbg !345
}

; Function Attrs: nofree nosync nounwind willreturn
declare i8* @llvm.stacksave() #6

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.var.annotation(i8*, i8*, i8*, i32, i8*) #7

declare dso_local i32 @usleep(i32) #2

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.stackrestore(i8*) #6

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !346 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.13, i32 0, i32 0)), !dbg !349
  call void @main_looper(), !dbg !350
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.14, i32 0, i32 0)), !dbg !351
  ret i32 0, !dbg !352
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-jump-tables"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm1176jzf-s" "target-features"="+armv6kz,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm1176jzf-s" "target-features"="+armv6kz,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm1176jzf-s" "target-features"="+armv6kz,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm1176jzf-s" "target-features"="+armv6kz,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="arm1176jzf-s" "target-features"="+armv6kz,+dsp,+fp64,+strict-align,+vfp2,+vfp2sp,-aes,-d32,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-neon,-sha2,-thumb-mode,-vfp3,-vfp3d16,-vfp3d16sp,-vfp3sp,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #6 = { nofree nosync nounwind willreturn }
attributes #7 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #8 = { nounwind readonly willreturn }
attributes #9 = { nounwind readnone willreturn }
attributes #10 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!23, !24, !25, !26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "data_flow_test.c", directory: "/home/zrz0517/study/chain_attestation/OP-DFI/arm_control")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !4, line: 46, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "/usr/lib/gcc-cross/arm-linux-gnueabihf/9/../../../../arm-linux-gnueabihf/include/ctype.h", directory: "")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18}
!7 = !DIEnumerator(name: "_ISupper", value: 256)
!8 = !DIEnumerator(name: "_ISlower", value: 512)
!9 = !DIEnumerator(name: "_ISalpha", value: 1024)
!10 = !DIEnumerator(name: "_ISdigit", value: 2048)
!11 = !DIEnumerator(name: "_ISxdigit", value: 4096)
!12 = !DIEnumerator(name: "_ISspace", value: 8192)
!13 = !DIEnumerator(name: "_ISprint", value: 16384)
!14 = !DIEnumerator(name: "_ISgraph", value: 32768)
!15 = !DIEnumerator(name: "_ISblank", value: 1)
!16 = !DIEnumerator(name: "_IScntrl", value: 2)
!17 = !DIEnumerator(name: "_ISpunct", value: 4)
!18 = !DIEnumerator(name: "_ISalnum", value: 8)
!19 = !{!20, !21, !22}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!23 = !{i32 7, !"Dwarf Version", i32 4}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{i32 1, !"min_enum_size", i32 4}
!27 = !{i32 1, !"Virtual Function Elim", i32 0}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{i32 1, !"ThinLTO", i32 0}
!30 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!31 = !{!"clang version 13.0.1 (https://github.com/llvm/llvm-project 75e33f71c2dae584b13a7d1186ae0a038ba98838)"}
!32 = distinct !DISubprogram(name: "op_move_arm", scope: !1, file: !1, line: 31, type: !33, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !37)
!33 = !DISubroutineType(types: !34)
!34 = !{!20, !20, !35}
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 32)
!36 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!37 = !{}
!38 = !DILocalVariable(name: "n", arg: 1, scope: !32, file: !1, line: 31, type: !20)
!39 = !DILocation(line: 31, column: 21, scope: !32)
!40 = !DILocalVariable(name: "param", arg: 2, scope: !32, file: !1, line: 31, type: !35)
!41 = !DILocation(line: 31, column: 30, scope: !32)
!42 = !DILocation(line: 32, column: 62, scope: !32)
!43 = !DILocation(line: 32, column: 65, scope: !32)
!44 = !DILocation(line: 32, column: 73, scope: !32)
!45 = !DILocation(line: 32, column: 5, scope: !32)
!46 = !DILocation(line: 34, column: 5, scope: !32)
!47 = distinct !DISubprogram(name: "get_op_func", scope: !1, file: !1, line: 38, type: !48, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !37)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !20}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 32)
!51 = !DILocalVariable(name: "op", arg: 1, scope: !47, file: !1, line: 38, type: !20)
!52 = !DILocation(line: 38, column: 23, scope: !47)
!53 = !DILocation(line: 39, column: 11, scope: !47)
!54 = !DILocation(line: 41, column: 5, scope: !47)
!55 = distinct !DISubprogram(name: "status_OK", scope: !1, file: !1, line: 45, type: !56, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !37)
!56 = !DISubroutineType(types: !57)
!57 = !{!20, !20}
!58 = !DILocalVariable(name: "st", arg: 1, scope: !55, file: !1, line: 45, type: !20)
!59 = !DILocation(line: 45, column: 19, scope: !55)
!60 = !DILocation(line: 46, column: 12, scope: !55)
!61 = !DILocation(line: 46, column: 15, scope: !55)
!62 = !DILocation(line: 46, column: 5, scope: !55)
!63 = distinct !DISubprogram(name: "read_char_from_file", scope: !1, file: !1, line: 49, type: !64, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !37)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !66, !35, !68}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 32)
!67 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !69, line: 46, baseType: !5)
!69 = !DIFile(filename: "toolchain/llvm-project/build/lib/clang/13.0.1/include/stddef.h", directory: "/home/zrz0517/study/chain_attestation/OP-DFI")
!70 = !DILocalVariable(name: "filename", arg: 1, scope: !63, file: !1, line: 49, type: !66)
!71 = !DILocation(line: 49, column: 39, scope: !63)
!72 = !DILocalVariable(name: "buffer", arg: 2, scope: !63, file: !1, line: 49, type: !35)
!73 = !DILocation(line: 49, column: 55, scope: !63)
!74 = !DILocalVariable(name: "buffer_size", arg: 3, scope: !63, file: !1, line: 49, type: !68)
!75 = !DILocation(line: 49, column: 70, scope: !63)
!76 = !DILocalVariable(name: "file", scope: !63, file: !1, line: 52, type: !77)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 32)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !79, line: 7, baseType: !80)
!79 = !DIFile(filename: "/usr/lib/gcc-cross/arm-linux-gnueabihf/9/../../../../arm-linux-gnueabihf/include/bits/types/FILE.h", directory: "")
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !81, line: 49, size: 1216, elements: !82)
!81 = !DIFile(filename: "/usr/lib/gcc-cross/arm-linux-gnueabihf/9/../../../../arm-linux-gnueabihf/include/bits/types/struct_FILE.h", directory: "")
!82 = !{!83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !98, !100, !101, !102, !106, !107, !109, !113, !116, !120, !123, !126, !127, !129, !130, !131}
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !80, file: !81, line: 51, baseType: !20, size: 32)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !80, file: !81, line: 54, baseType: !35, size: 32, offset: 32)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !80, file: !81, line: 55, baseType: !35, size: 32, offset: 64)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !80, file: !81, line: 56, baseType: !35, size: 32, offset: 96)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !80, file: !81, line: 57, baseType: !35, size: 32, offset: 128)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !80, file: !81, line: 58, baseType: !35, size: 32, offset: 160)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !80, file: !81, line: 59, baseType: !35, size: 32, offset: 192)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !80, file: !81, line: 60, baseType: !35, size: 32, offset: 224)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !80, file: !81, line: 61, baseType: !35, size: 32, offset: 256)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !80, file: !81, line: 64, baseType: !35, size: 32, offset: 288)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !80, file: !81, line: 65, baseType: !35, size: 32, offset: 320)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !80, file: !81, line: 66, baseType: !35, size: 32, offset: 352)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !80, file: !81, line: 68, baseType: !96, size: 32, offset: 384)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 32)
!97 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !81, line: 36, flags: DIFlagFwdDecl)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !80, file: !81, line: 70, baseType: !99, size: 32, offset: 416)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !80, file: !81, line: 72, baseType: !20, size: 32, offset: 448)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !80, file: !81, line: 73, baseType: !20, size: 32, offset: 480)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !80, file: !81, line: 74, baseType: !103, size: 32, offset: 512)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !104, line: 152, baseType: !105)
!104 = !DIFile(filename: "/usr/lib/gcc-cross/arm-linux-gnueabihf/9/../../../../arm-linux-gnueabihf/include/bits/types.h", directory: "")
!105 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !80, file: !81, line: 77, baseType: !22, size: 16, offset: 544)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !80, file: !81, line: 78, baseType: !108, size: 8, offset: 560)
!108 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !80, file: !81, line: 79, baseType: !110, size: 8, offset: 568)
!110 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 8, elements: !111)
!111 = !{!112}
!112 = !DISubrange(count: 1)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !80, file: !81, line: 81, baseType: !114, size: 32, offset: 576)
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 32)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !81, line: 43, baseType: null)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !80, file: !81, line: 89, baseType: !117, size: 64, offset: 640)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !104, line: 153, baseType: !118)
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !104, line: 47, baseType: !119)
!119 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !80, file: !81, line: 91, baseType: !121, size: 32, offset: 704)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 32)
!122 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !81, line: 37, flags: DIFlagFwdDecl)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !80, file: !81, line: 92, baseType: !124, size: 32, offset: 736)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 32)
!125 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !81, line: 38, flags: DIFlagFwdDecl)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !80, file: !81, line: 93, baseType: !99, size: 32, offset: 768)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !80, file: !81, line: 94, baseType: !128, size: 32, offset: 800)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !80, file: !81, line: 95, baseType: !68, size: 32, offset: 832)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !80, file: !81, line: 96, baseType: !20, size: 32, offset: 864)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !80, file: !81, line: 98, baseType: !132, size: 320, offset: 896)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 320, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 40)
!135 = !DILocation(line: 52, column: 11, scope: !63)
!136 = !DILocation(line: 52, column: 24, scope: !63)
!137 = !DILocation(line: 52, column: 18, scope: !63)
!138 = !DILocalVariable(name: "bytes_read", scope: !63, file: !1, line: 55, type: !68)
!139 = !DILocation(line: 55, column: 12, scope: !63)
!140 = !DILocation(line: 55, column: 31, scope: !63)
!141 = !DILocation(line: 55, column: 53, scope: !63)
!142 = !DILocation(line: 55, column: 65, scope: !63)
!143 = !DILocation(line: 55, column: 70, scope: !63)
!144 = !DILocation(line: 55, column: 25, scope: !63)
!145 = !DILocation(line: 56, column: 40, scope: !63)
!146 = !DILocation(line: 56, column: 52, scope: !63)
!147 = !DILocation(line: 56, column: 5, scope: !63)
!148 = !DILocation(line: 58, column: 5, scope: !63)
!149 = !DILocation(line: 58, column: 15, scope: !63)
!150 = !DILocation(line: 60, column: 12, scope: !63)
!151 = !DILocation(line: 60, column: 5, scope: !63)
!152 = !DILocation(line: 61, column: 5, scope: !63)
!153 = distinct !DISubprogram(name: "get_input", scope: !1, file: !1, line: 63, type: !154, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !37)
!154 = !DISubroutineType(types: !155)
!155 = !{null}
!156 = !DILocalVariable(name: "peripheral_input", scope: !153, file: !1, line: 65, type: !110)
!157 = !DILocation(line: 65, column: 11, scope: !153)
!158 = !DILocation(line: 66, column: 51, scope: !153)
!159 = !DILocation(line: 66, column: 5, scope: !153)
!160 = !DILocation(line: 68, column: 5, scope: !153)
!161 = distinct !DISubprogram(name: "read_command", scope: !1, file: !1, line: 74, type: !162, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !37)
!162 = !DISubroutineType(types: !163)
!163 = !{!20, !164}
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 32)
!165 = !DIDerivedType(tag: DW_TAG_typedef, name: "cmd_t", file: !1, line: 22, baseType: !166)
!166 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 18, size: 96, elements: !167)
!167 = !{!168, !169, !170}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "p_size", scope: !166, file: !1, line: 19, baseType: !20, size: 32)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "op", scope: !166, file: !1, line: 20, baseType: !20, size: 32, offset: 32)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "param", scope: !166, file: !1, line: 21, baseType: !110, size: 8, offset: 64)
!171 = !DILocalVariable(name: "cmd", arg: 1, scope: !161, file: !1, line: 74, type: !164)
!172 = !DILocation(line: 74, column: 25, scope: !161)
!173 = !DILocalVariable(name: "line", scope: !161, file: !1, line: 75, type: !174)
!174 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 2048, elements: !175)
!175 = !{!176}
!176 = !DISubrange(count: 256)
!177 = !DILocation(line: 75, column: 10, scope: !161)
!178 = !DILocation(line: 76, column: 5, scope: !161)
!179 = !DILocation(line: 77, column: 16, scope: !180)
!180 = distinct !DILexicalBlock(scope: !161, file: !1, line: 77, column: 9)
!181 = !DILocation(line: 77, column: 36, scope: !180)
!182 = !DILocation(line: 77, column: 10, scope: !180)
!183 = !DILocation(line: 77, column: 9, scope: !161)
!184 = !DILocation(line: 78, column: 9, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !1, line: 77, column: 44)
!186 = !DILocalVariable(name: "L", scope: !161, file: !1, line: 82, type: !68)
!187 = !DILocation(line: 82, column: 12, scope: !161)
!188 = !DILocation(line: 82, column: 23, scope: !161)
!189 = !DILocation(line: 82, column: 16, scope: !161)
!190 = !DILocation(line: 83, column: 9, scope: !191)
!191 = distinct !DILexicalBlock(scope: !161, file: !1, line: 83, column: 9)
!192 = !DILocation(line: 83, column: 11, scope: !191)
!193 = !DILocation(line: 83, column: 15, scope: !191)
!194 = !DILocation(line: 83, column: 23, scope: !191)
!195 = !DILocation(line: 83, column: 24, scope: !191)
!196 = !DILocation(line: 83, column: 18, scope: !191)
!197 = !DILocation(line: 83, column: 28, scope: !191)
!198 = !DILocation(line: 83, column: 9, scope: !161)
!199 = !DILocation(line: 83, column: 42, scope: !191)
!200 = !DILocation(line: 83, column: 37, scope: !191)
!201 = !DILocation(line: 83, column: 47, scope: !191)
!202 = !DILocalVariable(name: "p", scope: !161, file: !1, line: 86, type: !35)
!203 = !DILocation(line: 86, column: 11, scope: !161)
!204 = !DILocation(line: 86, column: 15, scope: !161)
!205 = !DILocation(line: 87, column: 5, scope: !161)
!206 = !DILocation(line: 87, column: 13, scope: !161)
!207 = !DILocation(line: 87, column: 12, scope: !161)
!208 = !DILocation(line: 87, column: 15, scope: !161)
!209 = !DILocation(line: 87, column: 18, scope: !161)
!210 = !DILocation(line: 0, scope: !161)
!211 = !DILocation(line: 87, column: 46, scope: !161)
!212 = distinct !{!212, !205, !213, !214}
!213 = !DILocation(line: 87, column: 48, scope: !161)
!214 = !{!"llvm.loop.mustprogress"}
!215 = !DILocation(line: 89, column: 17, scope: !216)
!216 = distinct !DILexicalBlock(scope: !161, file: !1, line: 89, column: 9)
!217 = !DILocation(line: 89, column: 9, scope: !216)
!218 = !DILocation(line: 89, column: 31, scope: !216)
!219 = !DILocation(line: 89, column: 9, scope: !161)
!220 = !DILocation(line: 90, column: 9, scope: !221)
!221 = distinct !DILexicalBlock(scope: !216, file: !1, line: 89, column: 37)
!222 = !DILocation(line: 90, column: 14, scope: !221)
!223 = !DILocation(line: 90, column: 17, scope: !221)
!224 = !DILocation(line: 91, column: 9, scope: !221)
!225 = !DILocation(line: 95, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !161, file: !1, line: 95, column: 9)
!227 = !DILocation(line: 95, column: 9, scope: !226)
!228 = !DILocation(line: 95, column: 31, scope: !226)
!229 = !DILocation(line: 95, column: 9, scope: !161)
!230 = !DILocation(line: 96, column: 11, scope: !231)
!231 = distinct !DILexicalBlock(scope: !226, file: !1, line: 95, column: 37)
!232 = !DILocation(line: 97, column: 9, scope: !231)
!233 = !DILocation(line: 97, column: 17, scope: !231)
!234 = !DILocation(line: 97, column: 16, scope: !231)
!235 = !DILocation(line: 97, column: 19, scope: !231)
!236 = !DILocation(line: 97, column: 22, scope: !231)
!237 = !DILocation(line: 0, scope: !231)
!238 = !DILocation(line: 97, column: 50, scope: !231)
!239 = distinct !{!239, !232, !240, !214}
!240 = !DILocation(line: 97, column: 52, scope: !231)
!241 = !DILocation(line: 98, column: 9, scope: !231)
!242 = !DILocation(line: 98, column: 14, scope: !231)
!243 = !DILocation(line: 98, column: 17, scope: !231)
!244 = !DILocation(line: 99, column: 9, scope: !231)
!245 = !DILocation(line: 100, column: 14, scope: !246)
!246 = distinct !DILexicalBlock(scope: !231, file: !1, line: 100, column: 13)
!247 = !DILocation(line: 100, column: 13, scope: !246)
!248 = !DILocation(line: 100, column: 16, scope: !246)
!249 = !DILocation(line: 100, column: 13, scope: !231)
!250 = !DILocation(line: 102, column: 13, scope: !251)
!251 = distinct !DILexicalBlock(scope: !246, file: !1, line: 100, column: 25)
!252 = !DILocation(line: 102, column: 18, scope: !251)
!253 = !DILocation(line: 102, column: 25, scope: !251)
!254 = !DILocation(line: 103, column: 13, scope: !251)
!255 = !DILocation(line: 103, column: 18, scope: !251)
!256 = !DILocation(line: 103, column: 27, scope: !251)
!257 = !DILocation(line: 104, column: 9, scope: !251)
!258 = !DILocation(line: 105, column: 21, scope: !259)
!259 = distinct !DILexicalBlock(scope: !246, file: !1, line: 104, column: 16)
!260 = !DILocation(line: 105, column: 26, scope: !259)
!261 = !DILocation(line: 105, column: 33, scope: !259)
!262 = !DILocation(line: 105, column: 13, scope: !259)
!263 = !DILocation(line: 106, column: 13, scope: !259)
!264 = !DILocation(line: 106, column: 18, scope: !259)
!265 = !DILocation(line: 106, column: 44, scope: !259)
!266 = !DILocation(line: 107, column: 39, scope: !259)
!267 = !DILocation(line: 107, column: 44, scope: !259)
!268 = !DILocation(line: 107, column: 32, scope: !259)
!269 = !DILocation(line: 107, column: 13, scope: !259)
!270 = !DILocation(line: 107, column: 18, scope: !259)
!271 = !DILocation(line: 107, column: 25, scope: !259)
!272 = !DILocation(line: 109, column: 9, scope: !231)
!273 = !DILocation(line: 113, column: 13, scope: !161)
!274 = !DILocation(line: 113, column: 18, scope: !161)
!275 = !DILocation(line: 113, column: 25, scope: !161)
!276 = !DILocation(line: 113, column: 5, scope: !161)
!277 = !DILocation(line: 114, column: 5, scope: !161)
!278 = !DILocation(line: 114, column: 10, scope: !161)
!279 = !DILocation(line: 114, column: 36, scope: !161)
!280 = !DILocation(line: 115, column: 5, scope: !161)
!281 = !DILocation(line: 115, column: 10, scope: !161)
!282 = !DILocation(line: 115, column: 13, scope: !161)
!283 = !DILocation(line: 116, column: 31, scope: !161)
!284 = !DILocation(line: 116, column: 36, scope: !161)
!285 = !DILocation(line: 116, column: 24, scope: !161)
!286 = !DILocation(line: 116, column: 5, scope: !161)
!287 = !DILocation(line: 116, column: 10, scope: !161)
!288 = !DILocation(line: 116, column: 17, scope: !161)
!289 = !DILocation(line: 117, column: 5, scope: !161)
!290 = !DILocation(line: 118, column: 1, scope: !161)
!291 = distinct !DISubprogram(name: "main_looper", scope: !1, file: !1, line: 121, type: !154, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !37)
!292 = !DILocalVariable(name: "dynamic_size", scope: !291, file: !1, line: 122, type: !293)
!293 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !20)
!294 = !DILocation(line: 122, column: 18, scope: !291)
!295 = !DILocation(line: 123, column: 25, scope: !291)
!296 = !DILocation(line: 123, column: 5, scope: !291)
!297 = !DILocalVariable(name: "__vla_expr0", scope: !291, type: !5, flags: DIFlagArtificial)
!298 = !DILocation(line: 0, scope: !291)
!299 = !DILocalVariable(name: "force_fp_dummy", scope: !291, file: !1, line: 123, type: !300)
!300 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, elements: !301)
!301 = !{!302}
!302 = !DISubrange(count: !297)
!303 = !DILocation(line: 123, column: 10, scope: !291)
!304 = !DILocation(line: 124, column: 5, scope: !291)
!305 = !DILocation(line: 124, column: 23, scope: !291)
!306 = !DILocalVariable(name: "st", scope: !291, file: !1, line: 126, type: !20)
!307 = !DILocation(line: 126, column: 9, scope: !291)
!308 = !DILocalVariable(name: "cmd", scope: !291, file: !1, line: 127, type: !165)
!309 = !DILocation(line: 127, column: 59, scope: !291)
!310 = !DILocation(line: 127, column: 5, scope: !291)
!311 = !DILocalVariable(name: "op_func", scope: !291, file: !1, line: 130, type: !50)
!312 = !DILocation(line: 130, column: 11, scope: !291)
!313 = !DILocation(line: 137, column: 5, scope: !291)
!314 = !DILocation(line: 138, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !316, file: !1, line: 138, column: 13)
!316 = distinct !DILexicalBlock(scope: !291, file: !1, line: 137, column: 15)
!317 = !DILocation(line: 138, column: 16, scope: !315)
!318 = !DILocation(line: 138, column: 13, scope: !316)
!319 = !DILocation(line: 139, column: 13, scope: !320)
!320 = distinct !DILexicalBlock(scope: !315, file: !1, line: 138, column: 37)
!321 = !DILocation(line: 140, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !320, file: !1, line: 140, column: 17)
!323 = !DILocation(line: 140, column: 19, scope: !322)
!324 = !DILocation(line: 140, column: 17, scope: !320)
!325 = !DILocation(line: 143, column: 43, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !1, line: 140, column: 23)
!327 = !DILocation(line: 143, column: 27, scope: !326)
!328 = !DILocation(line: 143, column: 25, scope: !326)
!329 = !DILocation(line: 145, column: 23, scope: !326)
!330 = !DILocation(line: 145, column: 36, scope: !326)
!331 = !DILocation(line: 145, column: 48, scope: !326)
!332 = !DILocation(line: 145, column: 44, scope: !326)
!333 = !DILocation(line: 145, column: 21, scope: !326)
!334 = !DILocation(line: 147, column: 13, scope: !326)
!335 = !DILocation(line: 148, column: 73, scope: !336)
!336 = distinct !DILexicalBlock(scope: !322, file: !1, line: 147, column: 20)
!337 = !DILocation(line: 148, column: 17, scope: !336)
!338 = !DILocation(line: 150, column: 9, scope: !320)
!339 = !DILocation(line: 151, column: 13, scope: !340)
!340 = distinct !DILexicalBlock(scope: !315, file: !1, line: 150, column: 16)
!341 = !DILocation(line: 152, column: 13, scope: !340)
!342 = !DILocation(line: 154, column: 9, scope: !316)
!343 = distinct !{!343, !313, !344}
!344 = !DILocation(line: 155, column: 5, scope: !291)
!345 = !DILocation(line: 156, column: 1, scope: !291)
!346 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 159, type: !347, scopeLine: 159, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !37)
!347 = !DISubroutineType(types: !348)
!348 = !{!20}
!349 = !DILocation(line: 160, column: 5, scope: !346)
!350 = !DILocation(line: 161, column: 5, scope: !346)
!351 = !DILocation(line: 162, column: 5, scope: !346)
!352 = !DILocation(line: 163, column: 5, scope: !346)

^0 = module: (path: "./output/data_flow_test.bc", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: "fopen") ; guid = 102569007029827440
^2 = gv: (name: ".str.1", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 500182115457502981
^3 = gv: (name: "llvm.stacksave") ; guid = 1313581558989159003
^4 = gv: (name: ".str.14", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 1846066540475046767
^5 = gv: (name: ".str.5", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 2115968675049085097
^6 = gv: (name: "llvm.stackrestore") ; guid = 2404869886179177375
^7 = gv: (name: "strlen") ; guid = 2965136410638013299
^8 = gv: (name: ".str.3", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 3601303935482161126
^9 = gv: (name: ".str.11", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 4157048165046449886
^10 = gv: (name: "read_char_from_file", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 26, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0), calls: ((callee: ^1), (callee: ^23), (callee: ^19), (callee: ^20)), refs: (^24, ^8)))) ; guid = 4417644117629010034
^11 = gv: (name: "get_op_func", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 4, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0), refs: (^21)))) ; guid = 5467431079780873858
^12 = gv: (name: ".str.12", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 5699702069754900426
^13 = gv: (name: "stdin") ; guid = 5774343503046077500
^14 = gv: (name: ".str.10", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 6199528746918925265
^15 = gv: (name: "__ctype_b_loc") ; guid = 6376367842311244127
^16 = gv: (name: ".str.8", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 6435754768360986860
^17 = gv: (name: "llvm.var.annotation") ; guid = 6917762043274391322
^18 = gv: (name: "usleep") ; guid = 7300840900939145593
^19 = gv: (name: "printf") ; guid = 7383291119112528047
^20 = gv: (name: "fclose") ; guid = 7595247395871723947
^21 = gv: (name: "op_move_arm", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 14, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0), calls: ((callee: ^19)), refs: (^2, ^31)))) ; guid = 7697239168869176665
^22 = gv: (name: "llvm.global.annotations", summaries: (variable: (module: ^0, flags: (linkage: appending, visibility: default, notEligibleToImport: 1, live: 1, dsoLocal: 0, canAutoHide: 0), varFlags: (readonly: 0, writeonly: 0, constant: 0), refs: (^14, ^27, ^35)))) ; guid = 8068736094482566281
^23 = gv: (name: "fread") ; guid = 8080939378378095266
^24 = gv: (name: ".str.2", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 8196850189159621489
^25 = gv: (name: ".str.6", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 8283583101066155849
^26 = gv: (name: "fgets") ; guid = 8544452511183996312
^27 = gv: (name: ".str.15", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 11960577142986946671
^28 = gv: (name: "strncmp") ; guid = 12388248239029446842
^29 = gv: (name: ".str.4", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 13289432945774041266
^30 = gv: (name: "llvm.dbg.declare") ; guid = 13513223491971101989
^31 = gv: (name: ".str", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 13821955117909752149
^32 = gv: (name: ".str.7", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 14355041571956398595
^33 = gv: (name: "read_command", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 156, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0), calls: ((callee: ^19), (callee: ^26), (callee: ^7), (callee: ^15), (callee: ^28), (callee: ^40)), refs: (^5, ^13, ^25, ^32, ^16)))) ; guid = 14475096203849336048
^34 = gv: (name: "status_OK", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 6, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0)))) ; guid = 15420900748835435650
^35 = gv: (name: "main", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 6, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0), calls: ((callee: ^19), (callee: ^36)), refs: (^37, ^4)))) ; guid = 15822663052811949562
^36 = gv: (name: "main_looper", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 49, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0), calls: ((callee: ^33), (callee: ^39), (callee: ^11), (callee: ^19), (callee: ^18)), refs: (^14, ^38, ^9, ^12)))) ; guid = 15960582651314042526
^37 = gv: (name: ".str.13", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 16065146200406411870
^38 = gv: (name: ".str.9", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 17852936217015732489
^39 = gv: (name: "get_input", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 4, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0), calls: ((callee: ^10)), refs: (^29)))) ; guid = 17856973652559884792
^40 = gv: (name: "strncpy") ; guid = 18199890986370063047
^41 = flags: 8
^42 = blockcount: 43
