; ModuleID = 'external_function.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.values = private unnamed_addr constant [8 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9], align 16
@.str = private unnamed_addr constant [5 x i8] c"elem\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"input\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"external_function.c\00", align 1
@__PRETTY_FUNCTION__.primary_function_1 = private unnamed_addr constant [35 x i8] c"int primary_function_1(int *, int)\00", align 1
@__PRETTY_FUNCTION__.primary_function_2 = private unnamed_addr constant [31 x i8] c"int primary_function_2(char *)\00", align 1
@.str4 = private unnamed_addr constant [12 x i8] c"klee_choose\00", align 1
@.str15 = private unnamed_addr constant [60 x i8] c"/home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str12 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str26 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str37 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [51 x i8] c"/home/klee/klee_src/runtime/Intrinsic/klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %values = alloca [8 x i32], align 16
  %elem = alloca i32, align 4
  %input = alloca [4 x i8], align 1
  %1 = bitcast [8 x i32]* %values to i8*, !dbg !141
  %2 = call i8* @memcpy(i8* %1, i8* bitcast ([8 x i32]* @main.values to i8*), i64 32)
  %3 = bitcast i32* %elem to i8*, !dbg !142
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0)), !dbg !142
  %4 = getelementptr inbounds [4 x i8]* %input, i32 0, i64 3, !dbg !143
  store i8 0, i8* %4, align 1, !dbg !143
  %5 = bitcast [4 x i8]* %input to i8*, !dbg !144
  call void @klee_make_symbolic(i8* %5, i64 4, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0)), !dbg !144
  %6 = getelementptr inbounds [8 x i32]* %values, i32 0, i32 0, !dbg !145
  %7 = load i32* %elem, align 4, !dbg !145
  %8 = call i32 @primary_function_1(i32* %6, i32 %7), !dbg !145
  %9 = getelementptr inbounds [4 x i8]* %input, i32 0, i32 0, !dbg !146
  %10 = call i32 @primary_function_2(i8* %9), !dbg !146
  ret i32 0, !dbg !147
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

declare void @klee_make_symbolic(i8*, i64, i8*) #3

; Function Attrs: nounwind uwtable
define i32 @primary_function_1(i32* %values, i32 %elem) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %search_result = alloca i32, align 4
  store i32* %values, i32** %2, align 8
  store i32 %elem, i32* %3, align 4
  %4 = load i32** %2, align 8, !dbg !148
  %5 = load i32* %3, align 4, !dbg !148
  %6 = call i32 @external_function(i32* %4, i32 0, i32 8, i32 %5), !dbg !148
  store i32 %6, i32* %search_result, align 4, !dbg !148
  %7 = load i32* %search_result, align 4, !dbg !149
  %8 = icmp eq i32 %7, 0, !dbg !149
  br i1 %8, label %9, label %11, !dbg !149

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, i8*, i32, i8*, ...)* bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 41, i8* getel
  store i32 0, i32* %1, !dbg !153
  br label %13, !dbg !153

; <label>:11                                      ; preds = %0
  %12 = load i32* %search_result, align 4, !dbg !154
  store i32 %12, i32* %1, !dbg !154
  br label %13, !dbg !154

; <label>:13                                      ; preds = %11, %9
  %14 = load i32* %1, !dbg !155
  ret i32 %14, !dbg !155
}

; Function Attrs: nounwind uwtable
define i32 @primary_function_2(i8* %input) #0 {
  %1 = alloca i8*, align 8
  %result = alloca i32, align 4
  store i8* %input, i8** %1, align 8
  %2 = load i8** %1, align 8, !dbg !156
  %3 = call i32 @atoi(i8* %2) #9, !dbg !156
  store i32 %3, i32* %result, align 4, !dbg !156
  %4 = load i32* %result, align 4, !dbg !157
  %5 = icmp eq i32 %4, 42, !dbg !157
  br i1 %5, label %6, label %8, !dbg !157

; <label>:6                                       ; preds = %0
  %7 = call i32 (i8*, i8*, i32, i8*, ...)* bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8]* @.str3, i32 0, i32 0), i32 58, i8* getele
  br label %8, !dbg !159

; <label>:8                                       ; preds = %6, %0
  %9 = load i32* %result, align 4, !dbg !160
  ret i32 %9, !dbg !160
}

; Function Attrs: nounwind uwtable
define i32 @external_function(i32* %values, i32 %l, i32 %r, i32 %elem) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %mid = alloca i32, align 4
  store i32* %values, i32** %2, align 8
  store i32 %l, i32* %3, align 4
  store i32 %r, i32* %4, align 4
  store i32 %elem, i32* %5, align 4
  %6 = load i32* %3, align 4, !dbg !161
  %7 = load i32* %4, align 4, !dbg !161
  %8 = icmp sgt i32 %6, %7, !dbg !161
  br i1 %8, label %9, label %10, !dbg !161

; <label>:9                                       ; preds = %0
  store i32 -1, i32* %1, !dbg !163
  br label %48, !dbg !163

; <label>:10                                      ; preds = %0
  %11 = load i32* %3, align 4, !dbg !164
  %12 = load i32* %3, align 4, !dbg !164
  %13 = load i32* %4, align 4, !dbg !164
  %14 = sub nsw i32 %12, %13, !dbg !164
  %int_cast_to_i64 = zext i32 2 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !164
  %15 = sdiv i32 %14, 2, !dbg !164
  %16 = add nsw i32 %11, %15, !dbg !164
  store i32 %16, i32* %mid, align 4, !dbg !164
  %17 = load i32* %5, align 4, !dbg !166
  %18 = load i32* %mid, align 4, !dbg !166
  %19 = sext i32 %18 to i64, !dbg !166
  %20 = load i32** %2, align 8, !dbg !166
  %21 = getelementptr inbounds i32* %20, i64 %19, !dbg !166
  %22 = load i32* %21, align 4, !dbg !166
  %23 = icmp slt i32 %17, %22, !dbg !166
  br i1 %23, label %24, label %31, !dbg !166

; <label>:24                                      ; preds = %10
  %25 = load i32** %2, align 8, !dbg !168
  %26 = load i32* %3, align 4, !dbg !168
  %27 = load i32* %mid, align 4, !dbg !168
  %28 = sub nsw i32 %27, 1, !dbg !168
  %29 = load i32* %5, align 4, !dbg !168
  %30 = call i32 @external_function(i32* %25, i32 %26, i32 %28, i32 %29), !dbg !168
  store i32 %30, i32* %1, !dbg !168
  br label %48, !dbg !168

; <label>:31                                      ; preds = %10
  %32 = load i32* %5, align 4, !dbg !169
  %33 = load i32* %mid, align 4, !dbg !169
  %34 = sext i32 %33 to i64, !dbg !169
  %35 = load i32** %2, align 8, !dbg !169
  %36 = getelementptr inbounds i32* %35, i64 %34, !dbg !169
  %37 = load i32* %36, align 4, !dbg !169
  %38 = icmp sgt i32 %32, %37, !dbg !169
  br i1 %38, label %39, label %46, !dbg !169

; <label>:39                                      ; preds = %31
  %40 = load i32** %2, align 8, !dbg !171
  %41 = load i32* %mid, align 4, !dbg !171
  %42 = add nsw i32 %41, 1, !dbg !171
  %43 = load i32* %4, align 4, !dbg !171
  %44 = load i32* %5, align 4, !dbg !171
  %45 = call i32 @external_function(i32* %40, i32 %42, i32 %43, i32 %44), !dbg !171
  store i32 %45, i32* %1, !dbg !171
  br label %48, !dbg !171

; <label>:46                                      ; preds = %31
  %47 = load i32* %mid, align 4, !dbg !172
  store i32 %47, i32* %1, !dbg !172
  br label %48, !dbg !172

; <label>:48                                      ; preds = %46, %39, %24, %9
  %49 = load i32* %1, !dbg !173
  ret i32 %49, !dbg !173
}

; Function Attrs: noreturn
declare i32 @__assert_fail(...) #4

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #5

; Function Attrs: nounwind uwtable
define i64 @klee_choose(i64 %n) #6 {
  %x = alloca i64, align 8
  %1 = bitcast i64* %x to i8*, !dbg !174
  call void @klee_make_symbolic(i8* %1, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str4, i64 0, i64 0)) #10, !dbg !174
  %2 = load i64* %x, align 8, !dbg !175, !tbaa !177
  %3 = icmp ult i64 %2, %n, !dbg !175
  br i1 %3, label %5, label %4, !dbg !175

; <label>:4                                       ; preds = %0
  call void @klee_silent_exit(i32 0) #11, !dbg !181
  unreachable, !dbg !181

; <label>:5                                       ; preds = %0
  ret i64 %2, !dbg !182
}

; Function Attrs: noreturn
declare void @klee_silent_exit(i32) #7

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #6 {
  %1 = icmp eq i64 %z, 0, !dbg !183
  br i1 %1, label %2, label %3, !dbg !183

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([60 x i8]* @.str15, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str26, i64 0, i64 0)) #11, !dbg !185
  unreachable, !dbg !185

; <label>:3                                       ; preds = %0
  ret void, !dbg !186
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #7

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #6 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !187
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #10, !dbg !187
  %2 = load i32* %x, align 4, !dbg !188, !tbaa !189
  ret i32 %2, !dbg !188
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #6 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !191
  br i1 %1, label %3, label %2, !dbg !191

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str37, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #11, !dbg !193
  unreachable, !dbg !193

; <label>:3                                       ; preds = %0
  ret void, !dbg !195
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #6 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !196
  br i1 %1, label %3, label %2, !dbg !196

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([51 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #11, !dbg !198
  unreachable, !dbg !198

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !199
  %5 = icmp eq i32 %4, %end, !dbg !199
  br i1 %5, label %21, label %6, !dbg !199

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !201
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #10, !dbg !201
  %8 = icmp eq i32 %start, 0, !dbg !203
  %9 = load i32* %x, align 4, !dbg !205, !tbaa !189
  br i1 %8, label %10, label %13, !dbg !203

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !205
  %12 = zext i1 %11 to i64, !dbg !205
  call void @klee_assume(i64 %12) #10, !dbg !205
  br label %19, !dbg !207

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !208
  %15 = zext i1 %14 to i64, !dbg !208
  call void @klee_assume(i64 %15) #10, !dbg !208
  %16 = load i32* %x, align 4, !dbg !210, !tbaa !189
  %17 = icmp slt i32 %16, %end, !dbg !210
  %18 = zext i1 %17 to i64, !dbg !210
  call void @klee_assume(i64 %18) #10, !dbg !210
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !211, !tbaa !189
  br label %21, !dbg !211

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !212
}

declare void @klee_assume(i64) #8

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #6 {
  %1 = icmp eq i64 %len, 0, !dbg !213
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !213

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep4 = getelementptr i8* %srcaddr, i64 %2
  %scevgep = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep4, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end6 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep103 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !214
  %wide.load = load <16 x i8>* %3, align 1, !dbg !214
  %next.gep.sum279 = or i64 %index, 16, !dbg !214
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !214
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !214
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !214
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !214
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !214
  %next.gep103.sum296 = or i64 %index, 16, !dbg !214
  %7 = getelementptr i8* %destaddr, i64 %next.gep103.sum296, !dbg !214
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !214
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !214
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !215

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val5 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end6, %vector.body ]
  %resume.val7 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val5, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val7, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !213
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !214
  %12 = load i8* %src.03, align 1, !dbg !214, !tbaa !218
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !214
  store i8 %12, i8* %dest.02, align 1, !dbg !214, !tbaa !218
  %14 = icmp eq i64 %10, 0, !dbg !213
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !213, !llvm.loop !219

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !220
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #6 {
  %1 = icmp eq i8* %src, %dst, !dbg !221
  br i1 %1, label %.loopexit, label %2, !dbg !221

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !223
  br i1 %3, label %.preheader, label %18, !dbg !223

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !225
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !225

.lr.ph.preheader:                                 ; preds = %.preheader
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %5 = add i64 %count, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep11 = getelementptr i8* %src, i64 %5
  %scevgep = getelementptr i8* %dst, i64 %5
  %bound1 = icmp uge i8* %scevgep, %src
  %bound0 = icmp uge i8* %scevgep11, %dst
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %src, i64 %n.vec
  %ptr.ind.end13 = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep110 = getelementptr i8* %dst, i64 %index
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !225
  %wide.load = load <16 x i8>* %6, align 1, !dbg !225
  %next.gep.sum586 = or i64 %index, 16, !dbg !225
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !225
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !225
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !225
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !225
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !225
  %next.gep110.sum603 = or i64 %index, 16, !dbg !225
  %10 = getelementptr i8* %dst, i64 %next.gep110.sum603, !dbg !225
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !225
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !225
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !227

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %src, %.lr.ph.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val12 = phi i8* [ %dst, %.lr.ph.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end13, %vector.body ]
  %resume.val14 = phi i64 [ %count, %.lr.ph.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %b.04 = phi i8* [ %14, %.lr.ph ], [ %resume.val, %middle.block ]
  %a.03 = phi i8* [ %16, %.lr.ph ], [ %resume.val12, %middle.block ]
  %.02 = phi i64 [ %13, %.lr.ph ], [ %resume.val14, %middle.block ]
  %13 = add i64 %.02, -1, !dbg !225
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !225
  %15 = load i8* %b.04, align 1, !dbg !225, !tbaa !218
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !225
  store i8 %15, i8* %a.03, align 1, !dbg !225, !tbaa !218
  %17 = icmp eq i64 %13, 0, !dbg !225
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !225, !llvm.loop !228

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !229
  %20 = icmp eq i64 %count, 0, !dbg !231
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !231

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !232
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !229
  %n.vec215 = and i64 %count, -32
  %cmp.zero217 = icmp eq i64 %n.vec215, 0
  %23 = add i64 %count, -1
  br i1 %cmp.zero217, label %middle.block210, label %vector.memcheck224

vector.memcheck224:                               ; preds = %.lr.ph9
  %scevgep219 = getelementptr i8* %src, i64 %23
  %scevgep218 = getelementptr i8* %dst, i64 %23
  %bound1221 = icmp ule i8* %scevgep219, %dst
  %bound0220 = icmp ule i8* %scevgep218, %src
  %memcheck.conflict223 = and i1 %bound0220, %bound1221
  %.sum = sub i64 %19, %n.vec215
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %.sum
  %.sum439 = sub i64 %19, %n.vec215
  %rev.ptr.ind.end229 = getelementptr i8* %dst, i64 %.sum439
  %rev.ind.end231 = sub i64 %count, %n.vec215
  br i1 %memcheck.conflict223, label %middle.block210, label %vector.body209

vector.body209:                                   ; preds = %vector.body209, %vector.memcheck224
  %index212 = phi i64 [ %index.next234, %vector.body209 ], [ 0, %vector.memcheck224 ]
  %.sum440 = sub i64 %19, %index212
  %.sum472 = sub i64 %19, %index212
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !231
  %24 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !231
  %25 = bitcast i8* %24 to <16 x i8>*, !dbg !231
  %wide.load434 = load <16 x i8>* %25, align 1, !dbg !231
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !231
  %.sum505 = add i64 %.sum440, -31, !dbg !231
  %26 = getelementptr i8* %src, i64 %.sum505, !dbg !231
  %27 = bitcast i8* %26 to <16 x i8>*, !dbg !231
  %wide.load435 = load <16 x i8>* %27, align 1, !dbg !231
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !231
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !231
  %next.gep333.sum = add i64 %.sum472, -15, !dbg !231
  %28 = getelementptr i8* %dst, i64 %next.gep333.sum, !dbg !231
  %29 = bitcast i8* %28 to <16 x i8>*, !dbg !231
  store <16 x i8> %reverse437, <16 x i8>* %29, align 1, !dbg !231
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !231
  %.sum507 = add i64 %.sum472, -31, !dbg !231
  %30 = getelementptr i8* %dst, i64 %.sum507, !dbg !231
  %31 = bitcast i8* %30 to <16 x i8>*, !dbg !231
  store <16 x i8> %reverse438, <16 x i8>* %31, align 1, !dbg !231
  %index.next234 = add i64 %index212, 32
  %32 = icmp eq i64 %index.next234, %n.vec215
  br i1 %32, label %middle.block210, label %vector.body209, !llvm.loop !233

middle.block210:                                  ; preds = %vector.body209, %vector.memcheck224, %.lr.ph9
  %resume.val225 = phi i8* [ %21, %.lr.ph9 ], [ %21, %vector.memcheck224 ], [ %rev.ptr.ind.end, %vector.body209 ]
  %resume.val227 = phi i8* [ %22, %.lr.ph9 ], [ %22, %vector.memcheck224 ], [ %rev.ptr.ind.end229, %vector.body209 ]
  %resume.val230 = phi i64 [ %count, %.lr.ph9 ], [ %count, %vector.memcheck224 ], [ %rev.ind.end231, %vector.body209 ]
  %new.indc.resume.val232 = phi i64 [ 0, %.lr.ph9 ], [ 0, %vector.memcheck224 ], [ %n.vec215, %vector.body209 ]
  %cmp.n233 = icmp eq i64 %new.indc.resume.val232, %count
  br i1 %cmp.n233, label %.loopexit, label %scalar.ph211

scalar.ph211:                                     ; preds = %scalar.ph211, %middle.block210
  %b.18 = phi i8* [ %34, %scalar.ph211 ], [ %resume.val225, %middle.block210 ]
  %a.17 = phi i8* [ %36, %scalar.ph211 ], [ %resume.val227, %middle.block210 ]
  %.16 = phi i64 [ %33, %scalar.ph211 ], [ %resume.val230, %middle.block210 ]
  %33 = add i64 %.16, -1, !dbg !231
  %34 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !231
  %35 = load i8* %b.18, align 1, !dbg !231, !tbaa !218
  %36 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !231
  store i8 %35, i8* %a.17, align 1, !dbg !231, !tbaa !218
  %37 = icmp eq i64 %33, 0, !dbg !231
  br i1 %37, label %.loopexit, label %scalar.ph211, !dbg !231, !llvm.loop !234

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !235
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #6 {
  %1 = icmp eq i64 %len, 0, !dbg !236
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !236

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep5 = getelementptr i8* %srcaddr, i64 %2
  %scevgep4 = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep4, %srcaddr
  %bound0 = icmp uge i8* %scevgep5, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end7 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep104 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !237
  %wide.load = load <16 x i8>* %3, align 1, !dbg !237
  %next.gep.sum280 = or i64 %index, 16, !dbg !237
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !237
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !237
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !237
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !237
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !237
  %next.gep104.sum297 = or i64 %index, 16, !dbg !237
  %7 = getelementptr i8* %destaddr, i64 %next.gep104.sum297, !dbg !237
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !237
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !237
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !238

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val6 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end7, %vector.body ]
  %resume.val8 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val6, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val8, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !236
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !237
  %12 = load i8* %src.03, align 1, !dbg !237, !tbaa !218
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !237
  store i8 %12, i8* %dest.02, align 1, !dbg !237, !tbaa !218
  %14 = icmp eq i64 %10, 0, !dbg !236
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !236, !llvm.loop !239

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !236

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !240
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #6 {
  %1 = icmp eq i64 %count, 0, !dbg !241
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !241

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !242
  br label %3, !dbg !241

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !241
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !242
  store volatile i8 %2, i8* %a.02, align 1, !dbg !242, !tbaa !218
  %6 = icmp eq i64 %4, 0, !dbg !241
  br i1 %6, label %._crit_edge, label %3, !dbg !241

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !243
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false
attributes #5 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-floa
attributes #6 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind readonly }
attributes #10 = { nobuiltin nounwind }
attributes #11 = { nobuiltin noreturn nounwind }

!llvm.dbg.cu = !{!0, !21, !33, !43, !55, !66, !78, !95, !109, !123}
!llvm.module.flags = !{!138, !139}
!llvm.ident = !{!140, !140, !140, !140, !140, !140, !140, !140, !140, !140}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ 
!1 = metadata !{metadata !"external_function.c", metadata !"/home/klee/KLEEPlayground/ChallengeProblem"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9, metadata !13, metadata !16}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 9, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 9} ; [ DW_TAG_subprogram ] [li
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/klee/KLEEPlayground/ChallengeProblem/external_function.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"external_function", metadata !"external_function", metadata !"", i32 22, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32*, i32, i32, i32)* @external_functio
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !12, metadata !8, metadata !8, metadata !8}
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"primary_function_1", metadata !"primary_function_1", metadata !"", i32 38, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32*, i32)* @primary_function_1, nul
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !8, metadata !12, metadata !8}
!16 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"primary_function_2", metadata !"primary_function_2", metadata !"", i32 48, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i8*)* @primary_function_2, null, nul
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !8, metadata !19}
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!20 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!21 = metadata !{i32 786449, metadata !22, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !23, metadata !2, metadata !2, metadata !""} ; [
!22 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_choose.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786478, metadata !22, metadata !25, metadata !"klee_choose", metadata !"klee_choose", metadata !"", i32 12, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i64)* @klee_choose, null, null, metadata !30, i32
!25 = metadata !{i32 786473, metadata !22}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_choose.c]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !28, metadata !28}
!28 = metadata !{i32 786454, metadata !22, null, metadata !"uintptr_t", i32 122, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [uintptr_t] [line 122, size 0, align 0, offset 0] [from long unsigned int]
!29 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!30 = metadata !{metadata !31, metadata !32}
!31 = metadata !{i32 786689, metadata !24, metadata !"n", metadata !25, i32 16777228, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 12]
!32 = metadata !{i32 786688, metadata !24, metadata !"x", metadata !25, i32 13, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 13]
!33 = metadata !{i32 786449, metadata !34, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !35, metadata !2, metadata !2, metadata !""} ; [
!34 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786478, metadata !34, metadata !37, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!37 = metadata !{i32 786473, metadata !34}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{null, metadata !40}
!40 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!41 = metadata !{metadata !42}
!42 = metadata !{i32 786689, metadata !36, metadata !"z", metadata !37, i32 16777228, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!43 = metadata !{i32 786449, metadata !44, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !45, metadata !2, metadata !2, metadata !""} ; [
!44 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_int.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786478, metadata !44, metadata !47, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !52, i32 13} ; [ 
!47 = metadata !{i32 786473, metadata !44}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_int.c]
!48 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{metadata !8, metadata !50}
!50 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!51 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!52 = metadata !{metadata !53, metadata !54}
!53 = metadata !{i32 786689, metadata !46, metadata !"name", metadata !47, i32 16777229, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!54 = metadata !{i32 786688, metadata !46, metadata !"x", metadata !47, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!55 = metadata !{i32 786449, metadata !56, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !57, metadata !2, metadata !2, metadata !""} ; [
!56 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!57 = metadata !{metadata !58}
!58 = metadata !{i32 786478, metadata !56, metadata !59, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !60, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!59 = metadata !{i32 786473, metadata !56}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!60 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !61, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!61 = metadata !{null, metadata !62, metadata !62}
!62 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!63 = metadata !{metadata !64, metadata !65}
!64 = metadata !{i32 786689, metadata !58, metadata !"bitWidth", metadata !59, i32 16777236, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!65 = metadata !{i32 786689, metadata !58, metadata !"shift", metadata !59, i32 33554452, metadata !62, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!66 = metadata !{i32 786449, metadata !67, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !68, metadata !2, metadata !2, metadata !""} ; [
!67 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_range.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!68 = metadata !{metadata !69}
!69 = metadata !{i32 786478, metadata !67, metadata !70, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !71, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!70 = metadata !{i32 786473, metadata !67}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!71 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !72, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = metadata !{metadata !8, metadata !8, metadata !8, metadata !50}
!73 = metadata !{metadata !74, metadata !75, metadata !76, metadata !77}
!74 = metadata !{i32 786689, metadata !69, metadata !"start", metadata !70, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!75 = metadata !{i32 786689, metadata !69, metadata !"end", metadata !70, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!76 = metadata !{i32 786689, metadata !69, metadata !"name", metadata !70, i32 50331661, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!77 = metadata !{i32 786688, metadata !69, metadata !"x", metadata !70, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!78 = metadata !{i32 786449, metadata !79, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !80, metadata !2, metadata !2, metadata !""} ; [
!79 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memcpy.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!80 = metadata !{metadata !81}
!81 = metadata !{i32 786478, metadata !79, metadata !82, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !83, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !89, i32 12} 
!82 = metadata !{i32 786473, metadata !79}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memcpy.c]
!83 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !84, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = metadata !{metadata !85, metadata !85, metadata !86, metadata !88}
!85 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!86 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !87} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!87 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!88 = metadata !{i32 786454, metadata !79, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!89 = metadata !{metadata !90, metadata !91, metadata !92, metadata !93, metadata !94}
!90 = metadata !{i32 786689, metadata !81, metadata !"destaddr", metadata !82, i32 16777228, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!91 = metadata !{i32 786689, metadata !81, metadata !"srcaddr", metadata !82, i32 33554444, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!92 = metadata !{i32 786689, metadata !81, metadata !"len", metadata !82, i32 50331660, metadata !88, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!93 = metadata !{i32 786688, metadata !81, metadata !"dest", metadata !82, i32 13, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!94 = metadata !{i32 786688, metadata !81, metadata !"src", metadata !82, i32 14, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!95 = metadata !{i32 786449, metadata !96, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !97, metadata !2, metadata !2, metadata !""} ; [
!96 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memmove.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!97 = metadata !{metadata !98}
!98 = metadata !{i32 786478, metadata !96, metadata !99, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !100, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !103, i32
!99 = metadata !{i32 786473, metadata !96}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!100 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{metadata !85, metadata !85, metadata !86, metadata !102}
!102 = metadata !{i32 786454, metadata !96, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!103 = metadata !{metadata !104, metadata !105, metadata !106, metadata !107, metadata !108}
!104 = metadata !{i32 786689, metadata !98, metadata !"dst", metadata !99, i32 16777228, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!105 = metadata !{i32 786689, metadata !98, metadata !"src", metadata !99, i32 33554444, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!106 = metadata !{i32 786689, metadata !98, metadata !"count", metadata !99, i32 50331660, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!107 = metadata !{i32 786688, metadata !98, metadata !"a", metadata !99, i32 13, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!108 = metadata !{i32 786688, metadata !98, metadata !"b", metadata !99, i32 14, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!109 = metadata !{i32 786449, metadata !110, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !111, metadata !2, metadata !2, metadata !""} 
!110 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/mempcpy.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!111 = metadata !{metadata !112}
!112 = metadata !{i32 786478, metadata !110, metadata !113, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !114, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !117, 
!113 = metadata !{i32 786473, metadata !110}      ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/mempcpy.c]
!114 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !115, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!115 = metadata !{metadata !85, metadata !85, metadata !86, metadata !116}
!116 = metadata !{i32 786454, metadata !110, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!117 = metadata !{metadata !118, metadata !119, metadata !120, metadata !121, metadata !122}
!118 = metadata !{i32 786689, metadata !112, metadata !"destaddr", metadata !113, i32 16777227, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!119 = metadata !{i32 786689, metadata !112, metadata !"srcaddr", metadata !113, i32 33554443, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!120 = metadata !{i32 786689, metadata !112, metadata !"len", metadata !113, i32 50331659, metadata !116, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!121 = metadata !{i32 786688, metadata !112, metadata !"dest", metadata !113, i32 12, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!122 = metadata !{i32 786688, metadata !112, metadata !"src", metadata !113, i32 13, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!123 = metadata !{i32 786449, metadata !124, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !125, metadata !2, metadata !2, metadata !""} 
!124 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memset.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!125 = metadata !{metadata !126}
!126 = metadata !{i32 786478, metadata !124, metadata !127, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !128, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !131, i32
!127 = metadata !{i32 786473, metadata !124}      ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memset.c]
!128 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !129, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!129 = metadata !{metadata !85, metadata !85, metadata !8, metadata !130}
!130 = metadata !{i32 786454, metadata !124, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!131 = metadata !{metadata !132, metadata !133, metadata !134, metadata !135}
!132 = metadata !{i32 786689, metadata !126, metadata !"dst", metadata !127, i32 16777227, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!133 = metadata !{i32 786689, metadata !126, metadata !"s", metadata !127, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!134 = metadata !{i32 786689, metadata !126, metadata !"count", metadata !127, i32 50331659, metadata !130, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!135 = metadata !{i32 786688, metadata !126, metadata !"a", metadata !127, i32 12, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!136 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !137} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!137 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!138 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!139 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!140 = metadata !{metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"}
!141 = metadata !{i32 10, i32 0, metadata !4, null}
!142 = metadata !{i32 14, i32 0, metadata !4, null}
!143 = metadata !{i32 15, i32 0, metadata !4, null}
!144 = metadata !{i32 16, i32 0, metadata !4, null}
!145 = metadata !{i32 17, i32 0, metadata !4, null}
!146 = metadata !{i32 18, i32 0, metadata !4, null}
!147 = metadata !{i32 20, i32 0, metadata !4, null}
!148 = metadata !{i32 39, i32 0, metadata !13, null}
!149 = metadata !{i32 40, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !1, metadata !13, i32 40, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/klee/KLEEPlayground/ChallengeProblem/external_function.c]
!151 = metadata !{i32 41, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !150, i32 40, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/klee/KLEEPlayground/ChallengeProblem/external_function.c]
!153 = metadata !{i32 42, i32 0, metadata !152, null}
!154 = metadata !{i32 45, i32 0, metadata !150, null}
!155 = metadata !{i32 46, i32 0, metadata !13, null}
!156 = metadata !{i32 56, i32 0, metadata !16, null}
!157 = metadata !{i32 57, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !1, metadata !16, i32 57, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/klee/KLEEPlayground/ChallengeProblem/external_function.c]
!159 = metadata !{i32 58, i32 0, metadata !158, null} ; [ DW_TAG_imported_module ]
!160 = metadata !{i32 59, i32 0, metadata !16, null}
!161 = metadata !{i32 24, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !1, metadata !9, i32 24, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/KLEEPlayground/ChallengeProblem/external_function.c]
!163 = metadata !{i32 25, i32 0, metadata !162, null}
!164 = metadata !{i32 27, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !1, metadata !162, i32 26, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/KLEEPlayground/ChallengeProblem/external_function.c]
!166 = metadata !{i32 28, i32 0, metadata !167, null}
!167 = metadata !{i32 786443, metadata !1, metadata !165, i32 28, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/klee/KLEEPlayground/ChallengeProblem/external_function.c]
!168 = metadata !{i32 29, i32 0, metadata !167, null}
!169 = metadata !{i32 30, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !1, metadata !167, i32 30, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/klee/KLEEPlayground/ChallengeProblem/external_function.c]
!171 = metadata !{i32 31, i32 0, metadata !170, null}
!172 = metadata !{i32 33, i32 0, metadata !170, null}
!173 = metadata !{i32 36, i32 0, metadata !9, null}
!174 = metadata !{i32 14, i32 0, metadata !24, null}
!175 = metadata !{i32 17, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !22, metadata !24, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_choose.c]
!177 = metadata !{metadata !178, metadata !178, i64 0}
!178 = metadata !{metadata !"long", metadata !179, i64 0}
!179 = metadata !{metadata !"omnipotent char", metadata !180, i64 0}
!180 = metadata !{metadata !"Simple C/C++ TBAA"}
!181 = metadata !{i32 18, i32 0, metadata !176, null}
!182 = metadata !{i32 19, i32 0, metadata !24, null}
!183 = metadata !{i32 13, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !34, metadata !36, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c]
!185 = metadata !{i32 14, i32 0, metadata !184, null}
!186 = metadata !{i32 15, i32 0, metadata !36, null}
!187 = metadata !{i32 15, i32 0, metadata !46, null}
!188 = metadata !{i32 16, i32 0, metadata !46, null}
!189 = metadata !{metadata !190, metadata !190, i64 0}
!190 = metadata !{metadata !"int", metadata !179, i64 0}
!191 = metadata !{i32 21, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !56, metadata !58, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!193 = metadata !{i32 27, i32 0, metadata !194, null}
!194 = metadata !{i32 786443, metadata !56, metadata !192, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!195 = metadata !{i32 29, i32 0, metadata !58, null}
!196 = metadata !{i32 16, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !67, metadata !69, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!198 = metadata !{i32 17, i32 0, metadata !197, null}
!199 = metadata !{i32 19, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !67, metadata !69, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!201 = metadata !{i32 22, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !67, metadata !200, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!203 = metadata !{i32 25, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !67, metadata !202, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!205 = metadata !{i32 26, i32 0, metadata !206, null}
!206 = metadata !{i32 786443, metadata !67, metadata !204, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!207 = metadata !{i32 27, i32 0, metadata !206, null}
!208 = metadata !{i32 28, i32 0, metadata !209, null}
!209 = metadata !{i32 786443, metadata !67, metadata !204, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!210 = metadata !{i32 29, i32 0, metadata !209, null}
!211 = metadata !{i32 32, i32 0, metadata !202, null}
!212 = metadata !{i32 34, i32 0, metadata !69, null}
!213 = metadata !{i32 16, i32 0, metadata !81, null}
!214 = metadata !{i32 17, i32 0, metadata !81, null}
!215 = metadata !{metadata !215, metadata !216, metadata !217}
!216 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!217 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!218 = metadata !{metadata !179, metadata !179, i64 0}
!219 = metadata !{metadata !219, metadata !216, metadata !217}
!220 = metadata !{i32 18, i32 0, metadata !81, null}
!221 = metadata !{i32 16, i32 0, metadata !222, null}
!222 = metadata !{i32 786443, metadata !96, metadata !98, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!223 = metadata !{i32 19, i32 0, metadata !224, null}
!224 = metadata !{i32 786443, metadata !96, metadata !98, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!225 = metadata !{i32 20, i32 0, metadata !226, null}
!226 = metadata !{i32 786443, metadata !96, metadata !224, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!227 = metadata !{metadata !227, metadata !216, metadata !217}
!228 = metadata !{metadata !228, metadata !216, metadata !217}
!229 = metadata !{i32 22, i32 0, metadata !230, null}
!230 = metadata !{i32 786443, metadata !96, metadata !224, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!231 = metadata !{i32 24, i32 0, metadata !230, null}
!232 = metadata !{i32 23, i32 0, metadata !230, null}
!233 = metadata !{metadata !233, metadata !216, metadata !217}
!234 = metadata !{metadata !234, metadata !216, metadata !217}
!235 = metadata !{i32 28, i32 0, metadata !98, null}
!236 = metadata !{i32 15, i32 0, metadata !112, null}
!237 = metadata !{i32 16, i32 0, metadata !112, null}
!238 = metadata !{metadata !238, metadata !216, metadata !217}
!239 = metadata !{metadata !239, metadata !216, metadata !217}
!240 = metadata !{i32 17, i32 0, metadata !112, null}
!241 = metadata !{i32 13, i32 0, metadata !126, null}
!242 = metadata !{i32 14, i32 0, metadata !126, null}
!243 = metadata !{i32 15, i32 0, metadata !126, null}
