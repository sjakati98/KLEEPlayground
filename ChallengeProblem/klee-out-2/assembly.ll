; ModuleID = 'function.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"input\00", align 1
@.str1 = private unnamed_addr constant [14 x i8] c"param * input\00", align 1
@.str2 = private unnamed_addr constant [11 x i8] c"function.c\00", align 1
@__PRETTY_FUNCTION__.f = private unnamed_addr constant [16 x i8] c"int f(int, int)\00", align 1
@.str3 = private unnamed_addr constant [12 x i8] c"klee_choose\00", align 1
@.str14 = private unnamed_addr constant [60 x i8] c"/home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str12 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str25 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str36 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str147 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str258 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [51 x i8] c"/home/klee/klee_src/runtime/Intrinsic/klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %input = alloca i32, align 4
  %param = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = bitcast i32* %input to i8*, !dbg !135
  call void @klee_make_symbolic(i8* %4, i64 4, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0)), !dbg !135
  store i32 2, i32* %param, align 4, !dbg !136
  %5 = load i32* %input, align 4, !dbg !137
  %6 = load i32* %param, align 4, !dbg !137
  %7 = call i32 @f(i32 %5, i32 %6), !dbg !137
  store i32 %7, i32* %result, align 4, !dbg !137
  %8 = load i32* %result, align 4, !dbg !138
  ret i32 %8, !dbg !138
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

declare void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: nounwind uwtable
define i32 @f(i32 %input, i32 %param) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %input, i32* %2, align 4
  store i32 %param, i32* %3, align 4
  %4 = load i32* %2, align 4, !dbg !139
  %5 = icmp slt i32 %4, 0, !dbg !139
  br i1 %5, label %6, label %10, !dbg !139

; <label>:6                                       ; preds = %0
  %7 = load i32* %3, align 4, !dbg !141
  %8 = load i32* %2, align 4, !dbg !141
  %9 = mul nsw i32 %7, %8, !dbg !141
  store i32 %9, i32* %1, !dbg !141
  br label %26, !dbg !141

; <label>:10                                      ; preds = %0
  %11 = load i32* %2, align 4, !dbg !142
  %12 = icmp sgt i32 %11, 0, !dbg !142
  br i1 %12, label %13, label %15, !dbg !142

; <label>:13                                      ; preds = %10
  %14 = load i32* %2, align 4, !dbg !144
  store i32 %14, i32* %1, !dbg !144
  br label %26, !dbg !144

; <label>:15                                      ; preds = %10
  %16 = load i32* %3, align 4, !dbg !145
  %17 = load i32* %2, align 4, !dbg !145
  %18 = mul nsw i32 %16, %17, !dbg !145
  %19 = icmp ne i32 %18, 0, !dbg !145
  br i1 %19, label %22, label %20, !dbg !145

; <label>:20                                      ; preds = %15
  %21 = call i32 (i8*, i8*, i32, i8*, ...)* bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0), i32 21, i8* gete
  br label %22, !dbg !145

; <label>:22                                      ; preds = %15, %20
  %23 = load i32* %3, align 4, !dbg !146
  %24 = load i32* %2, align 4, !dbg !146
  %25 = mul nsw i32 %23, %24, !dbg !146
  store i32 %25, i32* %1, !dbg !146
  br label %26, !dbg !146

; <label>:26                                      ; preds = %22, %13, %6
  %27 = load i32* %1, !dbg !147
  ret i32 %27, !dbg !147
}

; Function Attrs: noreturn
declare i32 @__assert_fail(...) #3

; Function Attrs: nounwind uwtable
define i64 @klee_choose(i64 %n) #4 {
  %x = alloca i64, align 8
  %1 = bitcast i64* %x to i8*, !dbg !148
  call void @klee_make_symbolic(i8* %1, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str3, i64 0, i64 0)) #7, !dbg !148
  %2 = load i64* %x, align 8, !dbg !149, !tbaa !151
  %3 = icmp ult i64 %2, %n, !dbg !149
  br i1 %3, label %5, label %4, !dbg !149

; <label>:4                                       ; preds = %0
  call void @klee_silent_exit(i32 0) #8, !dbg !155
  unreachable, !dbg !155

; <label>:5                                       ; preds = %0
  ret i64 %2, !dbg !156
}

; Function Attrs: noreturn
declare void @klee_silent_exit(i32) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #4 {
  %1 = icmp eq i64 %z, 0, !dbg !157
  br i1 %1, label %2, label %3, !dbg !157

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([60 x i8]* @.str14, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str25, i64 0, i64 0)) #8, !dbg !159
  unreachable, !dbg !159

; <label>:3                                       ; preds = %0
  ret void, !dbg !160
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #5

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !161
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #7, !dbg !161
  %2 = load i32* %x, align 4, !dbg !162, !tbaa !163
  ret i32 %2, !dbg !162
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #4 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !165
  br i1 %1, label %3, label %2, !dbg !165

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str36, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str147, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str258, i64 0, i64 0)) #8, !dbg !167
  unreachable, !dbg !167

; <label>:3                                       ; preds = %0
  ret void, !dbg !169
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !170
  br i1 %1, label %3, label %2, !dbg !170

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([51 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #8, !dbg !172
  unreachable, !dbg !172

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !173
  %5 = icmp eq i32 %4, %end, !dbg !173
  br i1 %5, label %21, label %6, !dbg !173

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !175
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #7, !dbg !175
  %8 = icmp eq i32 %start, 0, !dbg !177
  %9 = load i32* %x, align 4, !dbg !179, !tbaa !163
  br i1 %8, label %10, label %13, !dbg !177

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !179
  %12 = zext i1 %11 to i64, !dbg !179
  call void @klee_assume(i64 %12) #7, !dbg !179
  br label %19, !dbg !181

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !182
  %15 = zext i1 %14 to i64, !dbg !182
  call void @klee_assume(i64 %15) #7, !dbg !182
  %16 = load i32* %x, align 4, !dbg !184, !tbaa !163
  %17 = icmp slt i32 %16, %end, !dbg !184
  %18 = zext i1 %17 to i64, !dbg !184
  call void @klee_assume(i64 %18) #7, !dbg !184
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !185, !tbaa !163
  br label %21, !dbg !185

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !186
}

declare void @klee_assume(i64) #6

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !187
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !187

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !188
  %wide.load = load <16 x i8>* %3, align 1, !dbg !188
  %next.gep.sum279 = or i64 %index, 16, !dbg !188
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !188
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !188
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !188
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !188
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !188
  %next.gep103.sum296 = or i64 %index, 16, !dbg !188
  %7 = getelementptr i8* %destaddr, i64 %next.gep103.sum296, !dbg !188
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !188
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !188
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !189

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
  %10 = add i64 %.01, -1, !dbg !187
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !188
  %12 = load i8* %src.03, align 1, !dbg !188, !tbaa !192
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !188
  store i8 %12, i8* %dest.02, align 1, !dbg !188, !tbaa !192
  %14 = icmp eq i64 %10, 0, !dbg !187
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !187, !llvm.loop !193

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !194
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #4 {
  %1 = icmp eq i8* %src, %dst, !dbg !195
  br i1 %1, label %.loopexit, label %2, !dbg !195

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !197
  br i1 %3, label %.preheader, label %18, !dbg !197

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !199
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !199

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
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !199
  %wide.load = load <16 x i8>* %6, align 1, !dbg !199
  %next.gep.sum586 = or i64 %index, 16, !dbg !199
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !199
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !199
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !199
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !199
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !199
  %next.gep110.sum603 = or i64 %index, 16, !dbg !199
  %10 = getelementptr i8* %dst, i64 %next.gep110.sum603, !dbg !199
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !199
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !199
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !201

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
  %13 = add i64 %.02, -1, !dbg !199
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !199
  %15 = load i8* %b.04, align 1, !dbg !199, !tbaa !192
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !199
  store i8 %15, i8* %a.03, align 1, !dbg !199, !tbaa !192
  %17 = icmp eq i64 %13, 0, !dbg !199
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !199, !llvm.loop !202

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !203
  %20 = icmp eq i64 %count, 0, !dbg !205
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !205

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !206
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !203
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
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !205
  %24 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !205
  %25 = bitcast i8* %24 to <16 x i8>*, !dbg !205
  %wide.load434 = load <16 x i8>* %25, align 1, !dbg !205
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !205
  %.sum505 = add i64 %.sum440, -31, !dbg !205
  %26 = getelementptr i8* %src, i64 %.sum505, !dbg !205
  %27 = bitcast i8* %26 to <16 x i8>*, !dbg !205
  %wide.load435 = load <16 x i8>* %27, align 1, !dbg !205
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !205
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !205
  %next.gep333.sum = add i64 %.sum472, -15, !dbg !205
  %28 = getelementptr i8* %dst, i64 %next.gep333.sum, !dbg !205
  %29 = bitcast i8* %28 to <16 x i8>*, !dbg !205
  store <16 x i8> %reverse437, <16 x i8>* %29, align 1, !dbg !205
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !205
  %.sum507 = add i64 %.sum472, -31, !dbg !205
  %30 = getelementptr i8* %dst, i64 %.sum507, !dbg !205
  %31 = bitcast i8* %30 to <16 x i8>*, !dbg !205
  store <16 x i8> %reverse438, <16 x i8>* %31, align 1, !dbg !205
  %index.next234 = add i64 %index212, 32
  %32 = icmp eq i64 %index.next234, %n.vec215
  br i1 %32, label %middle.block210, label %vector.body209, !llvm.loop !207

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
  %33 = add i64 %.16, -1, !dbg !205
  %34 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !205
  %35 = load i8* %b.18, align 1, !dbg !205, !tbaa !192
  %36 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !205
  store i8 %35, i8* %a.17, align 1, !dbg !205, !tbaa !192
  %37 = icmp eq i64 %33, 0, !dbg !205
  br i1 %37, label %.loopexit, label %scalar.ph211, !dbg !205, !llvm.loop !208

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !209
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !210
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !210

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !211
  %wide.load = load <16 x i8>* %3, align 1, !dbg !211
  %next.gep.sum280 = or i64 %index, 16, !dbg !211
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !211
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !211
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !211
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !211
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !211
  %next.gep104.sum297 = or i64 %index, 16, !dbg !211
  %7 = getelementptr i8* %destaddr, i64 %next.gep104.sum297, !dbg !211
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !211
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !211
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !212

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
  %10 = add i64 %.01, -1, !dbg !210
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !211
  %12 = load i8* %src.03, align 1, !dbg !211, !tbaa !192
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !211
  store i8 %12, i8* %dest.02, align 1, !dbg !211, !tbaa !192
  %14 = icmp eq i64 %10, 0, !dbg !210
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !210, !llvm.loop !213

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !210

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !214
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #4 {
  %1 = icmp eq i64 %count, 0, !dbg !215
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !215

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !216
  br label %3, !dbg !215

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !215
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !216
  store volatile i8 %2, i8* %a.02, align 1, !dbg !216, !tbaa !192
  %6 = icmp eq i64 %4, 0, !dbg !215
  br i1 %6, label %._crit_edge, label %3, !dbg !215

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !217
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

!llvm.dbg.cu = !{!0, !15, !27, !37, !49, !60, !72, !89, !103, !117}
!llvm.module.flags = !{!132, !133}
!llvm.ident = !{!134, !134, !134, !134, !134, !134, !134, !134, !134, !134}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ 
!1 = metadata !{metadata !"function.c", metadata !"/home/klee/KLEEPlayground/ChallengeProblem"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !12}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 6, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !2, i32 6} ; [ DW_TAG_subpr
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/klee/KLEEPlayground/ChallengeProblem/function.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !9}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"f", metadata !"f", metadata !"", i32 15, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @f, null, null, metadata !2, i32 15} ; [ DW_TAG_subprogram 
!13 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = metadata !{metadata !8, metadata !8, metadata !8}
!15 = metadata !{i32 786449, metadata !16, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !17, metadata !2, metadata !2, metadata !""} ; [
!16 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_choose.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786478, metadata !16, metadata !19, metadata !"klee_choose", metadata !"klee_choose", metadata !"", i32 12, metadata !20, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i64)* @klee_choose, null, null, metadata !24, i32
!19 = metadata !{i32 786473, metadata !16}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_choose.c]
!20 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !21, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = metadata !{metadata !22, metadata !22}
!22 = metadata !{i32 786454, metadata !16, null, metadata !"uintptr_t", i32 122, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ] [uintptr_t] [line 122, size 0, align 0, offset 0] [from long unsigned int]
!23 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!24 = metadata !{metadata !25, metadata !26}
!25 = metadata !{i32 786689, metadata !18, metadata !"n", metadata !19, i32 16777228, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 12]
!26 = metadata !{i32 786688, metadata !18, metadata !"x", metadata !19, i32 13, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 13]
!27 = metadata !{i32 786449, metadata !28, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !29, metadata !2, metadata !2, metadata !""} ; [
!28 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 786478, metadata !28, metadata !31, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !32, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!31 = metadata !{i32 786473, metadata !28}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c]
!32 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !33, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = metadata !{null, metadata !34}
!34 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786689, metadata !30, metadata !"z", metadata !31, i32 16777228, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!37 = metadata !{i32 786449, metadata !38, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !39, metadata !2, metadata !2, metadata !""} ; [
!38 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_int.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786478, metadata !38, metadata !41, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !42, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !46, i32 13} ; [ 
!41 = metadata !{i32 786473, metadata !38}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_int.c]
!42 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!43 = metadata !{metadata !8, metadata !44}
!44 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !45} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!45 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!46 = metadata !{metadata !47, metadata !48}
!47 = metadata !{i32 786689, metadata !40, metadata !"name", metadata !41, i32 16777229, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!48 = metadata !{i32 786688, metadata !40, metadata !"x", metadata !41, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!49 = metadata !{i32 786449, metadata !50, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !51, metadata !2, metadata !2, metadata !""} ; [
!50 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!51 = metadata !{metadata !52}
!52 = metadata !{i32 786478, metadata !50, metadata !53, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !54, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!53 = metadata !{i32 786473, metadata !50}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!54 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !55, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = metadata !{null, metadata !56, metadata !56}
!56 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!57 = metadata !{metadata !58, metadata !59}
!58 = metadata !{i32 786689, metadata !52, metadata !"bitWidth", metadata !53, i32 16777236, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!59 = metadata !{i32 786689, metadata !52, metadata !"shift", metadata !53, i32 33554452, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!60 = metadata !{i32 786449, metadata !61, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !62, metadata !2, metadata !2, metadata !""} ; [
!61 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/klee_range.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!62 = metadata !{metadata !63}
!63 = metadata !{i32 786478, metadata !61, metadata !64, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!64 = metadata !{i32 786473, metadata !61}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!65 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{metadata !8, metadata !8, metadata !8, metadata !44}
!67 = metadata !{metadata !68, metadata !69, metadata !70, metadata !71}
!68 = metadata !{i32 786689, metadata !63, metadata !"start", metadata !64, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!69 = metadata !{i32 786689, metadata !63, metadata !"end", metadata !64, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!70 = metadata !{i32 786689, metadata !63, metadata !"name", metadata !64, i32 50331661, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!71 = metadata !{i32 786688, metadata !63, metadata !"x", metadata !64, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!72 = metadata !{i32 786449, metadata !73, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !74, metadata !2, metadata !2, metadata !""} ; [
!73 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memcpy.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!74 = metadata !{metadata !75}
!75 = metadata !{i32 786478, metadata !73, metadata !76, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !83, i32 12} 
!76 = metadata !{i32 786473, metadata !73}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memcpy.c]
!77 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !78, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = metadata !{metadata !79, metadata !79, metadata !80, metadata !82}
!79 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!80 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !81} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!81 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!82 = metadata !{i32 786454, metadata !73, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!83 = metadata !{metadata !84, metadata !85, metadata !86, metadata !87, metadata !88}
!84 = metadata !{i32 786689, metadata !75, metadata !"destaddr", metadata !76, i32 16777228, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!85 = metadata !{i32 786689, metadata !75, metadata !"srcaddr", metadata !76, i32 33554444, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!86 = metadata !{i32 786689, metadata !75, metadata !"len", metadata !76, i32 50331660, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!87 = metadata !{i32 786688, metadata !75, metadata !"dest", metadata !76, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!88 = metadata !{i32 786688, metadata !75, metadata !"src", metadata !76, i32 14, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!89 = metadata !{i32 786449, metadata !90, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !91, metadata !2, metadata !2, metadata !""} ; [
!90 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memmove.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!91 = metadata !{metadata !92}
!92 = metadata !{i32 786478, metadata !90, metadata !93, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !94, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !97, i32 1
!93 = metadata !{i32 786473, metadata !90}        ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!94 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !95, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!95 = metadata !{metadata !79, metadata !79, metadata !80, metadata !96}
!96 = metadata !{i32 786454, metadata !90, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!97 = metadata !{metadata !98, metadata !99, metadata !100, metadata !101, metadata !102}
!98 = metadata !{i32 786689, metadata !92, metadata !"dst", metadata !93, i32 16777228, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!99 = metadata !{i32 786689, metadata !92, metadata !"src", metadata !93, i32 33554444, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!100 = metadata !{i32 786689, metadata !92, metadata !"count", metadata !93, i32 50331660, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!101 = metadata !{i32 786688, metadata !92, metadata !"a", metadata !93, i32 13, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!102 = metadata !{i32 786688, metadata !92, metadata !"b", metadata !93, i32 14, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!103 = metadata !{i32 786449, metadata !104, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !105, metadata !2, metadata !2, metadata !""} 
!104 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/mempcpy.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!105 = metadata !{metadata !106}
!106 = metadata !{i32 786478, metadata !104, metadata !107, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !108, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !111, 
!107 = metadata !{i32 786473, metadata !104}      ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/mempcpy.c]
!108 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !109, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!109 = metadata !{metadata !79, metadata !79, metadata !80, metadata !110}
!110 = metadata !{i32 786454, metadata !104, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!111 = metadata !{metadata !112, metadata !113, metadata !114, metadata !115, metadata !116}
!112 = metadata !{i32 786689, metadata !106, metadata !"destaddr", metadata !107, i32 16777227, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!113 = metadata !{i32 786689, metadata !106, metadata !"srcaddr", metadata !107, i32 33554443, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!114 = metadata !{i32 786689, metadata !106, metadata !"len", metadata !107, i32 50331659, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!115 = metadata !{i32 786688, metadata !106, metadata !"dest", metadata !107, i32 12, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!116 = metadata !{i32 786688, metadata !106, metadata !"src", metadata !107, i32 13, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!117 = metadata !{i32 786449, metadata !118, i32 1, metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !119, metadata !2, metadata !2, metadata !""} 
!118 = metadata !{metadata !"/home/klee/klee_src/runtime/Intrinsic/memset.c", metadata !"/home/klee/klee_build/klee/runtime/Intrinsic"}
!119 = metadata !{metadata !120}
!120 = metadata !{i32 786478, metadata !118, metadata !121, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !122, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !125, i32
!121 = metadata !{i32 786473, metadata !118}      ; [ DW_TAG_file_type ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memset.c]
!122 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !123, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!123 = metadata !{metadata !79, metadata !79, metadata !8, metadata !124}
!124 = metadata !{i32 786454, metadata !118, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!125 = metadata !{metadata !126, metadata !127, metadata !128, metadata !129}
!126 = metadata !{i32 786689, metadata !120, metadata !"dst", metadata !121, i32 16777227, metadata !79, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!127 = metadata !{i32 786689, metadata !120, metadata !"s", metadata !121, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!128 = metadata !{i32 786689, metadata !120, metadata !"count", metadata !121, i32 50331659, metadata !124, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!129 = metadata !{i32 786688, metadata !120, metadata !"a", metadata !121, i32 12, metadata !130, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!130 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !131} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!131 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!132 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!133 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!134 = metadata !{metadata !"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"}
!135 = metadata !{i32 8, i32 0, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!136 = metadata !{i32 9, i32 0, metadata !4, null}
!137 = metadata !{i32 10, i32 0, metadata !4, null}
!138 = metadata !{i32 11, i32 0, metadata !4, null}
!139 = metadata !{i32 17, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !12, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/KLEEPlayground/ChallengeProblem/function.c]
!141 = metadata !{i32 18, i32 0, metadata !140, null}
!142 = metadata !{i32 19, i32 0, metadata !143, null}
!143 = metadata !{i32 786443, metadata !1, metadata !140, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/KLEEPlayground/ChallengeProblem/function.c]
!144 = metadata !{i32 20, i32 0, metadata !143, null}
!145 = metadata !{i32 21, i32 0, metadata !12, null}
!146 = metadata !{i32 22, i32 0, metadata !12, null}
!147 = metadata !{i32 23, i32 0, metadata !12, null}
!148 = metadata !{i32 14, i32 0, metadata !18, null}
!149 = metadata !{i32 17, i32 0, metadata !150, null}
!150 = metadata !{i32 786443, metadata !16, metadata !18, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_choose.c]
!151 = metadata !{metadata !152, metadata !152, i64 0}
!152 = metadata !{metadata !"long", metadata !153, i64 0}
!153 = metadata !{metadata !"omnipotent char", metadata !154, i64 0}
!154 = metadata !{metadata !"Simple C/C++ TBAA"}
!155 = metadata !{i32 18, i32 0, metadata !150, null}
!156 = metadata !{i32 19, i32 0, metadata !18, null}
!157 = metadata !{i32 13, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !28, metadata !30, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_div_zero_check.c]
!159 = metadata !{i32 14, i32 0, metadata !158, null}
!160 = metadata !{i32 15, i32 0, metadata !30, null}
!161 = metadata !{i32 15, i32 0, metadata !40, null}
!162 = metadata !{i32 16, i32 0, metadata !40, null}
!163 = metadata !{metadata !164, metadata !164, i64 0}
!164 = metadata !{metadata !"int", metadata !153, i64 0}
!165 = metadata !{i32 21, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !50, metadata !52, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!167 = metadata !{i32 27, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !50, metadata !166, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_overshift_check.c]
!169 = metadata !{i32 29, i32 0, metadata !52, null}
!170 = metadata !{i32 16, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !61, metadata !63, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!172 = metadata !{i32 17, i32 0, metadata !171, null}
!173 = metadata !{i32 19, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !61, metadata !63, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!175 = metadata !{i32 22, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !61, metadata !174, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!177 = metadata !{i32 25, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !61, metadata !176, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!179 = metadata !{i32 26, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !61, metadata !178, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!181 = metadata !{i32 27, i32 0, metadata !180, null}
!182 = metadata !{i32 28, i32 0, metadata !183, null}
!183 = metadata !{i32 786443, metadata !61, metadata !178, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/klee_range.c]
!184 = metadata !{i32 29, i32 0, metadata !183, null}
!185 = metadata !{i32 32, i32 0, metadata !176, null}
!186 = metadata !{i32 34, i32 0, metadata !63, null}
!187 = metadata !{i32 16, i32 0, metadata !75, null}
!188 = metadata !{i32 17, i32 0, metadata !75, null}
!189 = metadata !{metadata !189, metadata !190, metadata !191}
!190 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!191 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!192 = metadata !{metadata !153, metadata !153, i64 0}
!193 = metadata !{metadata !193, metadata !190, metadata !191}
!194 = metadata !{i32 18, i32 0, metadata !75, null}
!195 = metadata !{i32 16, i32 0, metadata !196, null}
!196 = metadata !{i32 786443, metadata !90, metadata !92, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!197 = metadata !{i32 19, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !90, metadata !92, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!199 = metadata !{i32 20, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !90, metadata !198, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!201 = metadata !{metadata !201, metadata !190, metadata !191}
!202 = metadata !{metadata !202, metadata !190, metadata !191}
!203 = metadata !{i32 22, i32 0, metadata !204, null}
!204 = metadata !{i32 786443, metadata !90, metadata !198, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/klee/klee_build/klee/runtime/Intrinsic//home/klee/klee_src/runtime/Intrinsic/memmove.c]
!205 = metadata !{i32 24, i32 0, metadata !204, null}
!206 = metadata !{i32 23, i32 0, metadata !204, null}
!207 = metadata !{metadata !207, metadata !190, metadata !191}
!208 = metadata !{metadata !208, metadata !190, metadata !191}
!209 = metadata !{i32 28, i32 0, metadata !92, null}
!210 = metadata !{i32 15, i32 0, metadata !106, null}
!211 = metadata !{i32 16, i32 0, metadata !106, null}
!212 = metadata !{metadata !212, metadata !190, metadata !191}
!213 = metadata !{metadata !213, metadata !190, metadata !191}
!214 = metadata !{i32 17, i32 0, metadata !106, null}
!215 = metadata !{i32 13, i32 0, metadata !120, null}
!216 = metadata !{i32 14, i32 0, metadata !120, null}
!217 = metadata !{i32 15, i32 0, metadata !120, null}
