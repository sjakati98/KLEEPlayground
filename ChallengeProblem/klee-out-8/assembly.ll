; ModuleID = 'right_answer.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"input\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"param\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str3 = private unnamed_addr constant [15 x i8] c"right_answer.c\00", align 1
@__PRETTY_FUNCTION__.funky_math = private unnamed_addr constant [25 x i8] c"int funky_math(int, int)\00", align 1
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
  %1 = alloca i32, align 4
  %input = alloca float, align 4
  %param = alloca float, align 4
  store i32 0, i32* %1
  %2 = bitcast float* %input to i8*, !dbg !134
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0)), !dbg !134
  %3 = bitcast float* %param to i8*, !dbg !135
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0)), !dbg !135
  %4 = load float* %input, align 4, !dbg !136
  %5 = fpext float %4 to double, !dbg !136
  %6 = load float* %param, align 4, !dbg !136
  %7 = fpext float %6 to double, !dbg !136
  %8 = call i32 (double, double, ...)* bitcast (i32 (i32, i32)* @funky_math to i32 (double, double, ...)*)(double %5, double %7), !dbg !136
  ret i32 %8, !dbg !136
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: nounwind uwtable
define i32 @funky_math(i32 %input, i32 %param) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %result = alloca float, align 4
  %i = alloca i32, align 4
  store i32 %input, i32* %1, align 4
  store i32 %param, i32* %2, align 4
  store float 0.000000e+00, float* %result, align 4, !dbg !137
  store i32 0, i32* %i, align 4, !dbg !138
  br label %3, !dbg !138

; <label>:3                                       ; preds = %9, %0
  %4 = load i32* %i, align 4, !dbg !138
  %5 = load i32* %2, align 4, !dbg !138
  %int_cast_to_i64 = zext i32 2 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !138
  %6 = sdiv i32 %5, 2, !dbg !138
  %7 = icmp slt i32 %4, %6, !dbg !138
  %8 = load float* %result, align 4, !dbg !140
  br i1 %7, label %9, label %19, !dbg !138

; <label>:9                                       ; preds = %3
  %10 = load i32* %1, align 4, !dbg !140
  %11 = sitofp i32 %10 to float, !dbg !140
  %12 = fadd float %8, %11, !dbg !140
  %13 = load i32* %i, align 4, !dbg !140
  %int_cast_to_i641 = zext i32 2 to i64
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !140
  %14 = shl i32 %13, 2, !dbg !140
  %15 = sitofp i32 %14 to float, !dbg !140
  %16 = fadd float %12, %15, !dbg !140
  store float %16, float* %result, align 4, !dbg !140
  %17 = load i32* %i, align 4, !dbg !138
  %18 = add nsw i32 %17, 1, !dbg !138
  store i32 %18, i32* %i, align 4, !dbg !138
  br label %3, !dbg !138

; <label>:19                                      ; preds = %3
  %20 = fpext float %8 to double, !dbg !141
  %21 = fcmp oeq double %20, 7.310000e+01, !dbg !141
  br i1 %21, label %22, label %24, !dbg !141

; <label>:22                                      ; preds = %19
  %23 = call i32 (i8*, i8*, i32, i8*, ...)* bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8]* @.str3, i32 0, i32 0), i32 18, i8* getel
  br label %24, !dbg !143

; <label>:24                                      ; preds = %22, %19
  %25 = load float* %result, align 4, !dbg !144
  %26 = fptosi float %25 to i32, !dbg !144
  ret i32 %26, !dbg !144
}

; Function Attrs: noreturn
declare i32 @__assert_fail(...) #3

; Function Attrs: nounwind uwtable
define i64 @klee_choose(i64 %n) #4 {
  %x = alloca i64, align 8
  %1 = bitcast i64* %x to i8*, !dbg !145
  call void @klee_make_symbolic(i8* %1, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str4, i64 0, i64 0)) #7, !dbg !145
  %2 = load i64* %x, align 8, !dbg !146, !tbaa !148
  %3 = icmp ult i64 %2, %n, !dbg !146
  br i1 %3, label %5, label %4, !dbg !146

; <label>:4                                       ; preds = %0
  call void @klee_silent_exit(i32 0) #8, !dbg !152
  unreachable, !dbg !152

; <label>:5                                       ; preds = %0
  ret i64 %2, !dbg !153
}

; Function Attrs: noreturn
declare void @klee_silent_exit(i32) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #4 {
  %1 = icmp eq i64 %z, 0, !dbg !154
  br i1 %1, label %2, label %3, !dbg !154

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([60 x i8]* @.str15, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str26, i64 0, i64 0)) #8, !dbg !156
  unreachable, !dbg !156

; <label>:3                                       ; preds = %0
  ret void, !dbg !157
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #5

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !158
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #7, !dbg !158
  %2 = load i32* %x, align 4, !dbg !159, !tbaa !160
  ret i32 %2, !dbg !159
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #4 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !162
  br i1 %1, label %3, label %2, !dbg !162

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str37, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #8, !dbg !164
  unreachable, !dbg !164

; <label>:3                                       ; preds = %0
  ret void, !dbg !166
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !167
  br i1 %1, label %3, label %2, !dbg !167

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([51 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #8, !dbg !169
  unreachable, !dbg !169

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !170
  %5 = icmp eq i32 %4, %end, !dbg !170
  br i1 %5, label %21, label %6, !dbg !170

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !172
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #7, !dbg !172
  %8 = icmp eq i32 %start, 0, !dbg !174
  %9 = load i32* %x, align 4, !dbg !176, !tbaa !160
  br i1 %8, label %10, label %13, !dbg !174

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !176
  %12 = zext i1 %11 to i64, !dbg !176
  call void @klee_assume(i64 %12) #7, !dbg !176
  br label %19, !dbg !178

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !179
  %15 = zext i1 %14 to i64, !dbg !179
  call void @klee_assume(i64 %15) #7, !dbg !179
  %16 = load i32* %x, align 4, !dbg !181, !tbaa !160
  %17 = icmp slt i32 %16, %end, !dbg !181
  %18 = zext i1 %17 to i64, !dbg !181
  call void @klee_assume(i64 %18) #7, !dbg !181
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !182, !tbaa !160
  br label %21, !dbg !182

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !183
}

declare void @klee_assume(i64) #6

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !184
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !184

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !185
  %wide.load = load <16 x i8>* %3, align 1, !dbg !185
  %next.gep.sum279 = or i64 %index, 16, !dbg !185
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !185
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !185
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !185
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !185
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !185
  %next.gep103.sum296 = or i64 %index, 16, !dbg !185
  %7 = getelementptr i8* %destaddr, i64 %next.gep103.sum296, !dbg !185
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !185
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !185
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !186

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
  %10 = add i64 %.01, -1, !dbg !184
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !185
  %12 = load i8* %src.03, align 1, !dbg !185, !tbaa !189
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !185
  store i8 %12, i8* %dest.02, align 1, !dbg !185, !tbaa !189
  %14 = icmp eq i64 %10, 0, !dbg !184
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !184, !llvm.loop !190

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !191
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #4 {
  %1 = icmp eq i8* %src, %dst, !dbg !192
  br i1 %1, label %.loopexit, label %2, !dbg !192

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !194
  br i1 %3, label %.preheader, label %18, !dbg !194

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !196
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !196

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
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !196
  %wide.load = load <16 x i8>* %6, align 1, !dbg !196
  %next.gep.sum586 = or i64 %index, 16, !dbg !196
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !196
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !196
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !196
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !196
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !196
  %next.gep110.sum603 = or i64 %index, 16, !dbg !196
  %10 = getelementptr i8* %dst, i64 %next.gep110.sum603, !dbg !196
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !196
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !196
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !198

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
  %13 = add i64 %.02, -1, !dbg !196
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !196
  %15 = load i8* %b.04, align 1, !dbg !196, !tbaa !189
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !196
  store i8 %15, i8* %a.03, align 1, !dbg !196, !tbaa !189
  %17 = icmp eq i64 %13, 0, !dbg !196
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !196, !llvm.loop !199

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !200
  %20 = icmp eq i64 %count, 0, !dbg !202
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !202

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !203
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !200
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
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !202
  %24 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !202
  %25 = bitcast i8* %24 to <16 x i8>*, !dbg !202
  %wide.load434 = load <16 x i8>* %25, align 1, !dbg !202
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !202
  %.sum505 = add i64 %.sum440, -31, !dbg !202
  %26 = getelementptr i8* %src, i64 %.sum505, !dbg !202
  %27 = bitcast i8* %26 to <16 x i8>*, !dbg !202
  %wide.load435 = load <16 x i8>* %27, align 1, !dbg !202
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !202
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !202
  %next.gep333.sum = add i64 %.sum472, -15, !dbg !202
  %28 = getelementptr i8* %dst, i64 %next.gep333.sum, !dbg !202
  %29 = bitcast i8* %28 to <16 x i8>*, !dbg !202
  store <16 x i8> %reverse437, <16 x i8>* %29, align 1, !dbg !202
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !202
  %.sum507 = add i64 %.sum472, -31, !dbg !202
  %30 = getelementptr i8* %dst, i64 %.sum507, !dbg !202
  %31 = bitcast i8* %30 to <16 x i8>*, !dbg !202
  store <16 x i8> %reverse438, <16 x i8>* %31, align 1, !dbg !202
  %index.next234 = add i64 %index212, 32
  %32 = icmp eq i64 %index.next234, %n.vec215
  br i1 %32, label %middle.block210, label %vector.body209, !llvm.loop !204

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
  %33 = add i64 %.16, -1, !dbg !202
  %34 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !202
  %35 = load i8* %b.18, align 1, !dbg !202, !tbaa !189
  %36 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !202
  store i8 %35, i8* %a.17, align 1, !dbg !202, !tbaa !189
  %37 = icmp eq i64 %33, 0, !dbg !202
  br i1 %37, label %.loopexit, label %scalar.ph211, !dbg !202, !llvm.loop !205

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !206
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !207
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !207

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !208
  %wide.load = load <16 x i8>* %3, align 1, !dbg !208
  %next.gep.sum280 = or i64 %index, 16, !dbg !208
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !208
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !208
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !208
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !208
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !208
  %next.gep104.sum297 = or i64 %index, 16, !dbg !208
  %7 = getelementptr i8* %destaddr, i64 %next.gep104.sum297, !dbg !208
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !208
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !208
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !209

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
  %10 = add i64 %.01, -1, !dbg !207
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !208
  %12 = load i8* %src.03, align 1, !dbg !208, !tbaa !189
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !208
  store i8 %12, i8* %dest.02, align 1, !dbg !208, !tbaa !189
  %14 = icmp eq i64 %10, 0, !dbg !207
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !207, !llvm.loop !210

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !207

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !211
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #4 {
  %1 = icmp eq i64 %count, 0, !dbg !212
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !212

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !213
  br label %3, !dbg !212

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !212
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !213
  store volatile i8 %2, i8* %a.02, align 1, !dbg !213, !tbaa !189
  %6 = icmp eq i64 %4, 0, !dbg !212
  br i1 %6, label %._crit_edge, label %3, !dbg !212

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !214
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false
attributes #4 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin nounwind }
attributes #8 = { nobuiltin noreturn nounwind }

!llvm.dbg.cu = !{!0, !12, !24, !34, !47, !58, !70, !88, !102, !116}
!llvm.module.flags = !{!131, !132}
!llvm.ident = !{!133, !133, !133, !133, !133, !133, !133, !133, !133, !133}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ 
!1 = metadata !{metadata !"right_answer.c", metadata !"/home/klee/KLEEPlayground/ChallengeProblem"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 5, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 5} ; [ DW_TAG_subprogram ] [li
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/klee/KLEEPlayground/ChallengeProblem/right_answer.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"funky_math", metadata !"funky_math", metadata !"", i32 13, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @funky_math, null, null, metadata !2, i32 
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8, metadata !8, metadata !8}
!12 = metadata !{i32 786449, metadata !13, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !14, metadata !2, metadata !2, metadata !""} ; [
!13 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_choose.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786478, metadata !13, metadata !16, metadata !"klee_choose", metadata !"klee_choose", metadata !"", i32 12, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i64)* @klee_choose, null, null, metadata !21, i32
!16 = metadata !{i32 786473, metadata !13}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_choose.c]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19}
!19 = metadata !{i32 786454, metadata !13, null, metadata !"uintptr_t", i32 122, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [uintptr_t] [line 122, size 0, align 0, offset 0] [from long unsigned int]
!20 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!21 = metadata !{metadata !22, metadata !23}
!22 = metadata !{i32 786689, metadata !15, metadata !"n", metadata !16, i32 16777228, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 12]
!23 = metadata !{i32 786688, metadata !15, metadata !"x", metadata !16, i32 13, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 13]
!24 = metadata !{i32 786449, metadata !25, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !26, metadata !2, metadata !2, metadata !""} ; [
!25 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786478, metadata !25, metadata !28, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!28 = metadata !{i32 786473, metadata !25}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{null, metadata !31}
!31 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786689, metadata !27, metadata !"z", metadata !28, i32 16777228, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!34 = metadata !{i32 786449, metadata !35, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !36, metadata !2, metadata !2, metadata !""} ; [
!35 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_int.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786478, metadata !35, metadata !38, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !39, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !44, i32 13} ; [ 
!38 = metadata !{i32 786473, metadata !35}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_int.c]
!39 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{metadata !8, metadata !41}
!41 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!42 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!43 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!44 = metadata !{metadata !45, metadata !46}
!45 = metadata !{i32 786689, metadata !37, metadata !"name", metadata !38, i32 16777229, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!46 = metadata !{i32 786688, metadata !37, metadata !"x", metadata !38, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!47 = metadata !{i32 786449, metadata !48, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !49, metadata !2, metadata !2, metadata !""} ; [
!48 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!49 = metadata !{metadata !50}
!50 = metadata !{i32 786478, metadata !48, metadata !51, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !52, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!51 = metadata !{i32 786473, metadata !48}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!52 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{null, metadata !54, metadata !54}
!54 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!55 = metadata !{metadata !56, metadata !57}
!56 = metadata !{i32 786689, metadata !50, metadata !"bitWidth", metadata !51, i32 16777236, metadata !54, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!57 = metadata !{i32 786689, metadata !50, metadata !"shift", metadata !51, i32 33554452, metadata !54, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!58 = metadata !{i32 786449, metadata !59, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !60, metadata !2, metadata !2, metadata !""} ; [
!59 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_range.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786478, metadata !59, metadata !62, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !63, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!62 = metadata !{i32 786473, metadata !59}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!63 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{metadata !8, metadata !8, metadata !8, metadata !41}
!65 = metadata !{metadata !66, metadata !67, metadata !68, metadata !69}
!66 = metadata !{i32 786689, metadata !61, metadata !"start", metadata !62, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!67 = metadata !{i32 786689, metadata !61, metadata !"end", metadata !62, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!68 = metadata !{i32 786689, metadata !61, metadata !"name", metadata !62, i32 50331661, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!69 = metadata !{i32 786688, metadata !61, metadata !"x", metadata !62, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!70 = metadata !{i32 786449, metadata !71, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !72, metadata !2, metadata !2, metadata !""} ; [
!71 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memcpy.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!72 = metadata !{metadata !73}
!73 = metadata !{i32 786478, metadata !71, metadata !74, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !75, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !81, i32 12} 
!74 = metadata !{i32 786473, metadata !71}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memcpy.c]
!75 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = metadata !{metadata !77, metadata !77, metadata !78, metadata !80}
!77 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!78 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !79} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!79 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = metadata !{i32 786454, metadata !71, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!81 = metadata !{metadata !82, metadata !83, metadata !84, metadata !85, metadata !87}
!82 = metadata !{i32 786689, metadata !73, metadata !"destaddr", metadata !74, i32 16777228, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!83 = metadata !{i32 786689, metadata !73, metadata !"srcaddr", metadata !74, i32 33554444, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!84 = metadata !{i32 786689, metadata !73, metadata !"len", metadata !74, i32 50331660, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!85 = metadata !{i32 786688, metadata !73, metadata !"dest", metadata !74, i32 13, metadata !86, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!86 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !43} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!87 = metadata !{i32 786688, metadata !73, metadata !"src", metadata !74, i32 14, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!88 = metadata !{i32 786449, metadata !89, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !90, metadata !2, metadata !2, metadata !""} ; [
!89 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memmove.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 786478, metadata !89, metadata !92, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !93, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !96, i32 1
!92 = metadata !{i32 786473, metadata !89}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!93 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !94, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = metadata !{metadata !77, metadata !77, metadata !78, metadata !95}
!95 = metadata !{i32 786454, metadata !89, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!96 = metadata !{metadata !97, metadata !98, metadata !99, metadata !100, metadata !101}
!97 = metadata !{i32 786689, metadata !91, metadata !"dst", metadata !92, i32 16777228, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!98 = metadata !{i32 786689, metadata !91, metadata !"src", metadata !92, i32 33554444, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!99 = metadata !{i32 786689, metadata !91, metadata !"count", metadata !92, i32 50331660, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!100 = metadata !{i32 786688, metadata !91, metadata !"a", metadata !92, i32 13, metadata !86, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!101 = metadata !{i32 786688, metadata !91, metadata !"b", metadata !92, i32 14, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!102 = metadata !{i32 786449, metadata !103, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !104, metadata !2, metadata !2, metadata !""} 
!103 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/mempcpy.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786478, metadata !103, metadata !106, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !107, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !110, 
!106 = metadata !{i32 786473, metadata !103}      ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/mempcpy.c]
!107 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = metadata !{metadata !77, metadata !77, metadata !78, metadata !109}
!109 = metadata !{i32 786454, metadata !103, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!110 = metadata !{metadata !111, metadata !112, metadata !113, metadata !114, metadata !115}
!111 = metadata !{i32 786689, metadata !105, metadata !"destaddr", metadata !106, i32 16777227, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!112 = metadata !{i32 786689, metadata !105, metadata !"srcaddr", metadata !106, i32 33554443, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!113 = metadata !{i32 786689, metadata !105, metadata !"len", metadata !106, i32 50331659, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!114 = metadata !{i32 786688, metadata !105, metadata !"dest", metadata !106, i32 12, metadata !86, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!115 = metadata !{i32 786688, metadata !105, metadata !"src", metadata !106, i32 13, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!116 = metadata !{i32 786449, metadata !117, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !118, metadata !2, metadata !2, metadata !""} 
!117 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memset.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!118 = metadata !{metadata !119}
!119 = metadata !{i32 786478, metadata !117, metadata !120, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !121, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !124, i32
!120 = metadata !{i32 786473, metadata !117}      ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memset.c]
!121 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !122, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!122 = metadata !{metadata !77, metadata !77, metadata !8, metadata !123}
!123 = metadata !{i32 786454, metadata !117, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!124 = metadata !{metadata !125, metadata !126, metadata !127, metadata !128}
!125 = metadata !{i32 786689, metadata !119, metadata !"dst", metadata !120, i32 16777227, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!126 = metadata !{i32 786689, metadata !119, metadata !"s", metadata !120, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!127 = metadata !{i32 786689, metadata !119, metadata !"count", metadata !120, i32 50331659, metadata !123, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!128 = metadata !{i32 786688, metadata !119, metadata !"a", metadata !120, i32 12, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!129 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !130} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!130 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!131 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!132 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!133 = metadata !{metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"}
!134 = metadata !{i32 7, i32 0, metadata !4, null}
!135 = metadata !{i32 8, i32 0, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!136 = metadata !{i32 9, i32 0, metadata !4, null}
!137 = metadata !{i32 14, i32 0, metadata !9, null}
!138 = metadata !{i32 15, i32 0, metadata !139, null}
!139 = metadata !{i32 786443, metadata !1, metadata !9, i32 15, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/KLEEPlayground/ChallengeProblem/right_answer.c]
!140 = metadata !{i32 16, i32 0, metadata !139, null}
!141 = metadata !{i32 17, i32 0, metadata !142, null}
!142 = metadata !{i32 786443, metadata !1, metadata !9, i32 17, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/KLEEPlayground/ChallengeProblem/right_answer.c]
!143 = metadata !{i32 18, i32 0, metadata !142, null}
!144 = metadata !{i32 19, i32 0, metadata !9, null}
!145 = metadata !{i32 14, i32 0, metadata !15, null}
!146 = metadata !{i32 17, i32 0, metadata !147, null}
!147 = metadata !{i32 786443, metadata !13, metadata !15, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_choose.c]
!148 = metadata !{metadata !149, metadata !149, i64 0}
!149 = metadata !{metadata !"long", metadata !150, i64 0}
!150 = metadata !{metadata !"omnipotent char", metadata !151, i64 0}
!151 = metadata !{metadata !"Simple C/C++ TBAA"}
!152 = metadata !{i32 18, i32 0, metadata !147, null}
!153 = metadata !{i32 19, i32 0, metadata !15, null}
!154 = metadata !{i32 13, i32 0, metadata !155, null}
!155 = metadata !{i32 786443, metadata !25, metadata !27, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c]
!156 = metadata !{i32 14, i32 0, metadata !155, null}
!157 = metadata !{i32 15, i32 0, metadata !27, null}
!158 = metadata !{i32 15, i32 0, metadata !37, null}
!159 = metadata !{i32 16, i32 0, metadata !37, null}
!160 = metadata !{metadata !161, metadata !161, i64 0}
!161 = metadata !{metadata !"int", metadata !150, i64 0}
!162 = metadata !{i32 21, i32 0, metadata !163, null}
!163 = metadata !{i32 786443, metadata !48, metadata !50, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!164 = metadata !{i32 27, i32 0, metadata !165, null}
!165 = metadata !{i32 786443, metadata !48, metadata !163, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!166 = metadata !{i32 29, i32 0, metadata !50, null}
!167 = metadata !{i32 16, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !59, metadata !61, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!169 = metadata !{i32 17, i32 0, metadata !168, null}
!170 = metadata !{i32 19, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !59, metadata !61, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!172 = metadata !{i32 22, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !59, metadata !171, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!174 = metadata !{i32 25, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !59, metadata !173, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!176 = metadata !{i32 26, i32 0, metadata !177, null}
!177 = metadata !{i32 786443, metadata !59, metadata !175, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!178 = metadata !{i32 27, i32 0, metadata !177, null}
!179 = metadata !{i32 28, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !59, metadata !175, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!181 = metadata !{i32 29, i32 0, metadata !180, null}
!182 = metadata !{i32 32, i32 0, metadata !173, null}
!183 = metadata !{i32 34, i32 0, metadata !61, null}
!184 = metadata !{i32 16, i32 0, metadata !73, null}
!185 = metadata !{i32 17, i32 0, metadata !73, null}
!186 = metadata !{metadata !186, metadata !187, metadata !188}
!187 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!188 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!189 = metadata !{metadata !150, metadata !150, i64 0}
!190 = metadata !{metadata !190, metadata !187, metadata !188}
!191 = metadata !{i32 18, i32 0, metadata !73, null}
!192 = metadata !{i32 16, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !89, metadata !91, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!194 = metadata !{i32 19, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !89, metadata !91, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!196 = metadata !{i32 20, i32 0, metadata !197, null}
!197 = metadata !{i32 786443, metadata !89, metadata !195, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!198 = metadata !{metadata !198, metadata !187, metadata !188}
!199 = metadata !{metadata !199, metadata !187, metadata !188}
!200 = metadata !{i32 22, i32 0, metadata !201, null}
!201 = metadata !{i32 786443, metadata !89, metadata !195, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!202 = metadata !{i32 24, i32 0, metadata !201, null}
!203 = metadata !{i32 23, i32 0, metadata !201, null}
!204 = metadata !{metadata !204, metadata !187, metadata !188}
!205 = metadata !{metadata !205, metadata !187, metadata !188}
!206 = metadata !{i32 28, i32 0, metadata !91, null}
!207 = metadata !{i32 15, i32 0, metadata !105, null}
!208 = metadata !{i32 16, i32 0, metadata !105, null}
!209 = metadata !{metadata !209, metadata !187, metadata !188}
!210 = metadata !{metadata !210, metadata !187, metadata !188}
!211 = metadata !{i32 17, i32 0, metadata !105, null}
!212 = metadata !{i32 13, i32 0, metadata !119, null}
!213 = metadata !{i32 14, i32 0, metadata !119, null}
!214 = metadata !{i32 15, i32 0, metadata !119, null}
