; ModuleID = 'main'
source_filename = "main"

declare void @putchar(i32)

declare i32 @getchar()

define void @plus(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  %4 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %3
  %5 = load i8, i8* %4, align 1
  %6 = add i8 %5, 1
  store i8 %6, i8* %4, align 1
  ret void
}

define void @minus(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  %4 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %3
  %5 = load i8, i8* %4, align 1
  %6 = sub i8 %5, 1
  store i8 %6, i8* %4, align 1
  ret void
}

define void @dot(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  %4 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %3
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  call void @putchar(i32 %6)
  ret void
}

define void @comma(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  %4 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %3
  %5 = load i8, i8* %4, align 1
  %6 = call i32 @getchar()
  %7 = trunc i32 %6 to i8
  store i8 %7, i8* %4, align 1
  ret void
}

define void @right_chevron(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  %4 = add i32 %3, 1
  store i32 %4, i32* %0, align 4
  ret void
}

define void @left_chevron(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  %4 = sub i32 %3, 1
  store i32 %4, i32* %0, align 4
  ret void
}

define i8 @load_cell(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  %4 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %3
  %5 = load i8, i8* %4, align 1
  ret i8 %5
}

define void @debug(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  call void @putchar(i32 %3)
  ret void
}

define void @main() {
  %1 = alloca [30000 x i8], align 1
  %2 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  %3 = bitcast [30000 x i8]* %1 to i8*
  call void @llvm.memset.p0i8.i32(i8* %3, i8 0, i32 30000, i1 false)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  %4 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %tail, label %head

head:                                             ; preds = %head, %0
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %6 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %7 = icmp ne i8 %6, 0
  br i1 %7, label %head, label %tail

tail:                                             ; preds = %head, %0
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  ret void
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #0

attributes #0 = { argmemonly nounwind willreturn writeonly }
