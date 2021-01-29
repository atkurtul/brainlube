; ModuleID = 'main'
source_filename = "main"

declare void @putchar(i32)

declare i32 @getchar()

define void @Add(i32* %0, [30000 x i8]* %1, i8 %2) {
  %4 = load i32, i32* %0, align 4
  %5 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %4
  %6 = load i8, i8* %5, align 1
  %7 = add i8 %6, %2
  store i8 %7, i8* %5, align 1
  ret void
}

define void @Mov(i32* %0, [30000 x i8]* %1, i32 %2) {
  %4 = load i32, i32* %0, align 4
  %5 = add i32 %4, %2
  store i32 %5, i32* %0, align 4
  ret void
}

define i1 @Output(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  %4 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %3
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  call void @putchar(i32 %6)
  ret i1 true
}

define i1 @Input(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  %4 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %3
  %5 = load i8, i8* %4, align 1
  %6 = call i32 @getchar()
  %7 = trunc i32 %6 to i8
  store i8 %7, i8* %4, align 1
  ret i1 true
}

define i1 @LeftBrace(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  %4 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %3
  %5 = load i8, i8* %4, align 1
  %6 = icmp eq i8 %5, 0
  ret i1 %6
}

define i1 @RightBrace(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  %4 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %3
  %5 = load i8, i8* %4, align 1
  %6 = icmp ne i8 %5, 0
  ret i1 %6
}

define void @main() {
  %1 = alloca [30000 x i8], align 1
  %2 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  %3 = bitcast [30000 x i8]* %1 to i8*
  call void @llvm.memset.p0i8.i32(i8* %3, i8 0, i32 30000, i1 false)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 10)
  %4 = load i32, i32* %2, align 4
  %5 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %4
  %6 = load i8, i8* %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %tail, label %head

head:                                             ; preds = %head, %0
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 7)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 10)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -4)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %8 = load i32, i32* %2, align 4
  %9 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %8
  %10 = load i8, i8* %9, align 1
  %11 = icmp ne i8 %10, 0
  br i1 %11, label %head, label %tail

tail:                                             ; preds = %head, %0
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %12 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  %13 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 7)
  %14 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  %15 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %16 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %17 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -2)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 15)
  %18 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %19 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %20 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -6)
  %21 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -8)
  %22 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  %23 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %24 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  ret void
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #0

attributes #0 = { argmemonly nounwind willreturn writeonly }
