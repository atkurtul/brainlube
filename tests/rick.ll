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
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %4 = load i32, i32* %2, align 4
  %5 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %4
  %6 = load i8, i8* %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %tail, label %head

head:                                             ; preds = %head, %0
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 52)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %8 = load i32, i32* %2, align 4
  %9 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %8
  %10 = load i8, i8* %9, align 1
  %11 = icmp ne i8 %10, 0
  br i1 %11, label %head, label %tail

tail:                                             ; preds = %head, %0
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %12 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %13 = load i32, i32* %2, align 4
  %14 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %13
  %15 = load i8, i8* %14, align 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %tail2, label %head1

head1:                                            ; preds = %head1, %tail
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 58)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %17 = load i32, i32* %2, align 4
  %18 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %17
  %19 = load i8, i8* %18, align 1
  %20 = icmp ne i8 %19, 0
  br i1 %20, label %head1, label %tail2

tail2:                                            ; preds = %head1, %tail
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %21 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %22 = load i32, i32* %2, align 4
  %23 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %22
  %24 = load i8, i8* %23, align 1
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %tail4, label %head3

head3:                                            ; preds = %head3, %tail2
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 58)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %26 = load i32, i32* %2, align 4
  %27 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %26
  %28 = load i8, i8* %27, align 1
  %29 = icmp ne i8 %28, 0
  br i1 %29, label %head3, label %tail4

tail4:                                            ; preds = %head3, %tail2
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %30 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %31 = load i32, i32* %2, align 4
  %32 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %31
  %33 = load i8, i8* %32, align 1
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %tail6, label %head5

head5:                                            ; preds = %head5, %tail4
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 56)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %35 = load i32, i32* %2, align 4
  %36 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %35
  %37 = load i8, i8* %36, align 1
  %38 = icmp ne i8 %37, 0
  br i1 %38, label %head5, label %tail6

tail6:                                            ; preds = %head5, %tail4
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %39 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 5)
  %40 = load i32, i32* %2, align 4
  %41 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %40
  %42 = load i8, i8* %41, align 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %tail8, label %head7

head7:                                            ; preds = %head7, %tail6
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 23)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %44 = load i32, i32* %2, align 4
  %45 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %44
  %46 = load i8, i8* %45, align 1
  %47 = icmp ne i8 %46, 0
  br i1 %47, label %head7, label %tail8

tail8:                                            ; preds = %head7, %tail6
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %48 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %49 = load i32, i32* %2, align 4
  %50 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %49
  %51 = load i8, i8* %50, align 1
  %52 = icmp eq i8 %51, 0
  br i1 %52, label %tail10, label %head9

head9:                                            ; preds = %head9, %tail8
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 29)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %53 = load i32, i32* %2, align 4
  %54 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %53
  %55 = load i8, i8* %54, align 1
  %56 = icmp ne i8 %55, 0
  br i1 %56, label %head9, label %tail10

tail10:                                           ; preds = %head9, %tail8
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %57 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 47)
  %58 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 47)
  %59 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 7)
  %60 = load i32, i32* %2, align 4
  %61 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %60
  %62 = load i8, i8* %61, align 1
  %63 = icmp eq i8 %62, 0
  br i1 %63, label %tail12, label %head11

head11:                                           ; preds = %head11, %tail10
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 17)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %64 = load i32, i32* %2, align 4
  %65 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %64
  %66 = load i8, i8* %65, align 1
  %67 = icmp ne i8 %66, 0
  br i1 %67, label %head11, label %tail12

tail12:                                           ; preds = %head11, %tail10
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %68 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 7)
  %69 = load i32, i32* %2, align 4
  %70 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %69
  %71 = load i8, i8* %70, align 1
  %72 = icmp eq i8 %71, 0
  br i1 %72, label %tail14, label %head13

head13:                                           ; preds = %head13, %tail12
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 17)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %73 = load i32, i32* %2, align 4
  %74 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %73
  %75 = load i8, i8* %74, align 1
  %76 = icmp ne i8 %75, 0
  br i1 %76, label %head13, label %tail14

tail14:                                           ; preds = %head13, %tail12
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %77 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 7)
  %78 = load i32, i32* %2, align 4
  %79 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %78
  %80 = load i8, i8* %79, align 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %tail16, label %head15

head15:                                           ; preds = %head15, %tail14
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 17)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %82 = load i32, i32* %2, align 4
  %83 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %82
  %84 = load i8, i8* %83, align 1
  %85 = icmp ne i8 %84, 0
  br i1 %85, label %head15, label %tail16

tail16:                                           ; preds = %head15, %tail14
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %86 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %87 = load i32, i32* %2, align 4
  %88 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %87
  %89 = load i8, i8* %88, align 1
  %90 = icmp eq i8 %89, 0
  br i1 %90, label %tail18, label %head17

head17:                                           ; preds = %head17, %tail16
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 23)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %91 = load i32, i32* %2, align 4
  %92 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %91
  %93 = load i8, i8* %92, align 1
  %94 = icmp ne i8 %93, 0
  br i1 %94, label %head17, label %tail18

tail18:                                           ; preds = %head17, %tail16
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %95 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 121)
  %96 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %97 = load i32, i32* %2, align 4
  %98 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %97
  %99 = load i8, i8* %98, align 1
  %100 = icmp eq i8 %99, 0
  br i1 %100, label %tail20, label %head19

head19:                                           ; preds = %head19, %tail18
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 37)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %101 = load i32, i32* %2, align 4
  %102 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %101
  %103 = load i8, i8* %102, align 1
  %104 = icmp ne i8 %103, 0
  br i1 %104, label %head19, label %tail20

tail20:                                           ; preds = %head19, %tail18
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %105 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %106 = load i32, i32* %2, align 4
  %107 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %106
  %108 = load i8, i8* %107, align 1
  %109 = icmp eq i8 %108, 0
  br i1 %109, label %tail22, label %head21

head21:                                           ; preds = %head21, %tail20
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 39)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %110 = load i32, i32* %2, align 4
  %111 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %110
  %112 = load i8, i8* %111, align 1
  %113 = icmp ne i8 %112, 0
  br i1 %113, label %head21, label %tail22

tail22:                                           ; preds = %head21, %tail20
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %114 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %115 = load i32, i32* %2, align 4
  %116 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %115
  %117 = load i8, i8* %116, align 1
  %118 = icmp eq i8 %117, 0
  br i1 %118, label %tail24, label %head23

head23:                                           ; preds = %head23, %tail22
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 58)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %119 = load i32, i32* %2, align 4
  %120 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %119
  %121 = load i8, i8* %120, align 1
  %122 = icmp ne i8 %121, 0
  br i1 %122, label %head23, label %tail24

tail24:                                           ; preds = %head23, %tail22
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %123 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %124 = load i32, i32* %2, align 4
  %125 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %124
  %126 = load i8, i8* %125, align 1
  %127 = icmp eq i8 %126, 0
  br i1 %127, label %tail26, label %head25

head25:                                           ; preds = %head25, %tail24
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 39)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %128 = load i32, i32* %2, align 4
  %129 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %128
  %130 = load i8, i8* %129, align 1
  %131 = icmp ne i8 %130, 0
  br i1 %131, label %head25, label %tail26

tail26:                                           ; preds = %head25, %tail24
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %132 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %133 = load i32, i32* %2, align 4
  %134 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %133
  %135 = load i8, i8* %134, align 1
  %136 = icmp eq i8 %135, 0
  br i1 %136, label %tail28, label %head27

head27:                                           ; preds = %head27, %tail26
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 49)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %137 = load i32, i32* %2, align 4
  %138 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %137
  %139 = load i8, i8* %138, align 1
  %140 = icmp ne i8 %139, 0
  br i1 %140, label %head27, label %tail28

tail28:                                           ; preds = %head27, %tail26
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %141 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 101)
  %142 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %143 = load i32, i32* %2, align 4
  %144 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %143
  %145 = load i8, i8* %144, align 1
  %146 = icmp eq i8 %145, 0
  br i1 %146, label %tail30, label %head29

head29:                                           ; preds = %head29, %tail28
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 23)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %147 = load i32, i32* %2, align 4
  %148 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %147
  %149 = load i8, i8* %148, align 1
  %150 = icmp ne i8 %149, 0
  br i1 %150, label %head29, label %tail30

tail30:                                           ; preds = %head29, %tail28
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %151 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %152 = load i32, i32* %2, align 4
  %153 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %152
  %154 = load i8, i8* %153, align 1
  %155 = icmp eq i8 %154, 0
  br i1 %155, label %tail32, label %head31

head31:                                           ; preds = %head31, %tail30
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 33)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %156 = load i32, i32* %2, align 4
  %157 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %156
  %158 = load i8, i8* %157, align 1
  %159 = icmp ne i8 %158, 0
  br i1 %159, label %head31, label %tail32

tail32:                                           ; preds = %head31, %tail30
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %160 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %161 = load i32, i32* %2, align 4
  %162 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %161
  %163 = load i8, i8* %162, align 1
  %164 = icmp eq i8 %163, 0
  br i1 %164, label %tail34, label %head33

head33:                                           ; preds = %head33, %tail32
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 37)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %165 = load i32, i32* %2, align 4
  %166 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %165
  %167 = load i8, i8* %166, align 1
  %168 = icmp ne i8 %167, 0
  br i1 %168, label %head33, label %tail34

tail34:                                           ; preds = %head33, %tail32
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %169 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 109)
  %170 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 47)
  %171 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 7)
  %172 = load i32, i32* %2, align 4
  %173 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %172
  %174 = load i8, i8* %173, align 1
  %175 = icmp eq i8 %174, 0
  br i1 %175, label %tail36, label %head35

head35:                                           ; preds = %head35, %tail34
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 17)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %176 = load i32, i32* %2, align 4
  %177 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %176
  %178 = load i8, i8* %177, align 1
  %179 = icmp ne i8 %178, 0
  br i1 %179, label %head35, label %tail36

tail36:                                           ; preds = %head35, %tail34
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %180 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 97)
  %181 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %182 = load i32, i32* %2, align 4
  %183 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %182
  %184 = load i8, i8* %183, align 1
  %185 = icmp eq i8 %184, 0
  br i1 %185, label %tail38, label %head37

head37:                                           ; preds = %head37, %tail36
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 58)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %186 = load i32, i32* %2, align 4
  %187 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %186
  %188 = load i8, i8* %187, align 1
  %189 = icmp ne i8 %188, 0
  br i1 %189, label %head37, label %tail38

tail38:                                           ; preds = %head37, %tail36
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %190 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %191 = load i32, i32* %2, align 4
  %192 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %191
  %193 = load i8, i8* %192, align 1
  %194 = icmp eq i8 %193, 0
  br i1 %194, label %tail40, label %head39

head39:                                           ; preds = %head39, %tail38
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 33)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %195 = load i32, i32* %2, align 4
  %196 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %195
  %197 = load i8, i8* %196, align 1
  %198 = icmp ne i8 %197, 0
  br i1 %198, label %head39, label %tail40

tail40:                                           ; preds = %head39, %tail38
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %199 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %200 = load i32, i32* %2, align 4
  %201 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %200
  %202 = load i8, i8* %201, align 1
  %203 = icmp eq i8 %202, 0
  br i1 %203, label %tail42, label %head41

head41:                                           ; preds = %head41, %tail40
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 52)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %204 = load i32, i32* %2, align 4
  %205 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %204
  %206 = load i8, i8* %205, align 1
  %207 = icmp ne i8 %206, 0
  br i1 %207, label %head41, label %tail42

tail42:                                           ; preds = %head41, %tail40
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %208 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %209 = load i32, i32* %2, align 4
  %210 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %209
  %211 = load i8, i8* %210, align 1
  %212 = icmp eq i8 %211, 0
  br i1 %212, label %tail44, label %head43

head43:                                           ; preds = %head43, %tail42
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 21)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %213 = load i32, i32* %2, align 4
  %214 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %213
  %215 = load i8, i8* %214, align 1
  %216 = icmp ne i8 %215, 0
  br i1 %216, label %head43, label %tail44

tail44:                                           ; preds = %head43, %tail42
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %217 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %218 = load i32, i32* %2, align 4
  %219 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %218
  %220 = load i8, i8* %219, align 1
  %221 = icmp eq i8 %220, 0
  br i1 %221, label %tail46, label %head45

head45:                                           ; preds = %head45, %tail44
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 59)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %222 = load i32, i32* %2, align 4
  %223 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %222
  %224 = load i8, i8* %223, align 1
  %225 = icmp ne i8 %224, 0
  br i1 %225, label %head45, label %tail46

tail46:                                           ; preds = %head45, %tail44
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %226 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 61)
  %227 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %228 = load i32, i32* %2, align 4
  %229 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %228
  %230 = load i8, i8* %229, align 1
  %231 = icmp eq i8 %230, 0
  br i1 %231, label %tail48, label %head47

head47:                                           ; preds = %head47, %tail46
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 50)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %232 = load i32, i32* %2, align 4
  %233 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %232
  %234 = load i8, i8* %233, align 1
  %235 = icmp ne i8 %234, 0
  br i1 %235, label %head47, label %tail48

tail48:                                           ; preds = %head47, %tail46
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %236 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %237 = load i32, i32* %2, align 4
  %238 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %237
  %239 = load i8, i8* %238, align 1
  %240 = icmp eq i8 %239, 0
  br i1 %240, label %tail50, label %head49

head49:                                           ; preds = %head49, %tail48
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 27)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %241 = load i32, i32* %2, align 4
  %242 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %241
  %243 = load i8, i8* %242, align 1
  %244 = icmp ne i8 %243, 0
  br i1 %244, label %head49, label %tail50

tail50:                                           ; preds = %head49, %tail48
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %245 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 7)
  %246 = load i32, i32* %2, align 4
  %247 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %246
  %248 = load i8, i8* %247, align 1
  %249 = icmp eq i8 %248, 0
  br i1 %249, label %tail52, label %head51

head51:                                           ; preds = %head51, %tail50
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 17)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %250 = load i32, i32* %2, align 4
  %251 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %250
  %252 = load i8, i8* %251, align 1
  %253 = icmp ne i8 %252, 0
  br i1 %253, label %head51, label %tail52

tail52:                                           ; preds = %head51, %tail50
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %254 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %255 = load i32, i32* %2, align 4
  %256 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %255
  %257 = load i8, i8* %256, align 1
  %258 = icmp eq i8 %257, 0
  br i1 %258, label %tail54, label %head53

head53:                                           ; preds = %head53, %tail52
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 26)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %259 = load i32, i32* %2, align 4
  %260 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %259
  %261 = load i8, i8* %260, align 1
  %262 = icmp ne i8 %261, 0
  br i1 %262, label %head53, label %tail54

tail54:                                           ; preds = %head53, %tail52
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %263 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 7)
  %264 = load i32, i32* %2, align 4
  %265 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %264
  %266 = load i8, i8* %265, align 1
  %267 = icmp eq i8 %266, 0
  br i1 %267, label %tail56, label %head55

head55:                                           ; preds = %head55, %tail54
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 17)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %268 = load i32, i32* %2, align 4
  %269 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %268
  %270 = load i8, i8* %269, align 1
  %271 = icmp ne i8 %270, 0
  br i1 %271, label %head55, label %tail56

tail56:                                           ; preds = %head55, %tail54
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %272 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %273 = load i32, i32* %2, align 4
  %274 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %273
  %275 = load i8, i8* %274, align 1
  %276 = icmp eq i8 %275, 0
  br i1 %276, label %tail58, label %head57

head57:                                           ; preds = %head57, %tail56
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 19)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %277 = load i32, i32* %2, align 4
  %278 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %277
  %279 = load i8, i8* %278, align 1
  %280 = icmp ne i8 %279, 0
  br i1 %280, label %head57, label %tail58

tail58:                                           ; preds = %head57, %tail56
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %281 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %282 = load i32, i32* %2, align 4
  %283 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %282
  %284 = load i8, i8* %283, align 1
  %285 = icmp eq i8 %284, 0
  br i1 %285, label %tail60, label %head59

head59:                                           ; preds = %head59, %tail58
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 29)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %286 = load i32, i32* %2, align 4
  %287 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %286
  %288 = load i8, i8* %287, align 1
  %289 = icmp ne i8 %288, 0
  br i1 %289, label %head59, label %tail60

tail60:                                           ; preds = %head59, %tail58
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %290 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 103)
  %291 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 2)
  %292 = load i32, i32* %2, align 4
  %293 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %292
  %294 = load i8, i8* %293, align 1
  %295 = icmp eq i8 %294, 0
  br i1 %295, label %tail62, label %head61

head61:                                           ; preds = %head61, %tail60
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 44)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %296 = load i32, i32* %2, align 4
  %297 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %296
  %298 = load i8, i8* %297, align 1
  %299 = icmp ne i8 %298, 0
  br i1 %299, label %head61, label %tail62

tail62:                                           ; preds = %head61, %tail60
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %300 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %301 = load i32, i32* %2, align 4
  %302 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %301
  %303 = load i8, i8* %302, align 1
  %304 = icmp eq i8 %303, 0
  br i1 %304, label %tail64, label %head63

head63:                                           ; preds = %head63, %tail62
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 33)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %305 = load i32, i32* %2, align 4
  %306 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %305
  %307 = load i8, i8* %306, align 1
  %308 = icmp ne i8 %307, 0
  br i1 %308, label %head63, label %tail64

tail64:                                           ; preds = %head63, %tail62
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %309 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 3)
  %310 = load i32, i32* %2, align 4
  %311 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %310
  %312 = load i8, i8* %311, align 1
  %313 = icmp eq i8 %312, 0
  br i1 %313, label %tail66, label %head65

head65:                                           ; preds = %head65, %tail64
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 27)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %314 = load i32, i32* %2, align 4
  %315 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %314
  %316 = load i8, i8* %315, align 1
  %317 = icmp ne i8 %316, 0
  br i1 %317, label %head65, label %tail66

tail66:                                           ; preds = %head65, %tail64
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %318 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  ret void
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #0

attributes #0 = { argmemonly nounwind willreturn writeonly }
