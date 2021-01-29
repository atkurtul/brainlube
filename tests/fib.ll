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
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 10)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  %4 = load i32, i32* %2, align 4
  %5 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %4
  %6 = load i8, i8* %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %tail38, label %head

head:                                             ; preds = %tail37, %0
  %8 = load i32, i32* %2, align 4
  %9 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %8
  %10 = load i8, i8* %9, align 1
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %tail5, label %head1

head1:                                            ; preds = %tail4, %head
  call void @Add(i32* %2, [30000 x i8]* %1, i8 5)
  %12 = load i32, i32* %2, align 4
  %13 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %12
  %14 = load i8, i8* %13, align 1
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %tail, label %head2

head2:                                            ; preds = %head2, %head1
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 8)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %16 = load i32, i32* %2, align 4
  %17 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %16
  %18 = load i8, i8* %17, align 1
  %19 = icmp ne i8 %18, 0
  br i1 %19, label %head2, label %tail

tail:                                             ; preds = %head2, %head1
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %20 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 6)
  %21 = load i32, i32* %2, align 4
  %22 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %21
  %23 = load i8, i8* %22, align 1
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %tail4, label %head3

head3:                                            ; preds = %head3, %tail
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -8)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %25 = load i32, i32* %2, align 4
  %26 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %25
  %27 = load i8, i8* %26, align 1
  %28 = icmp ne i8 %27, 0
  br i1 %28, label %head3, label %tail4

tail4:                                            ; preds = %head3, %tail
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -3)
  %29 = load i32, i32* %2, align 4
  %30 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %29
  %31 = load i8, i8* %30, align 1
  %32 = icmp ne i8 %31, 0
  br i1 %32, label %head1, label %tail5

tail5:                                            ; preds = %tail4, %head
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %33 = call i1 @Output(i32* %2, [30000 x i8]* %1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 2)
  %34 = load i32, i32* %2, align 4
  %35 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %34
  %36 = load i8, i8* %35, align 1
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %tail37, label %head6

head6:                                            ; preds = %tail36, %tail5
  %38 = load i32, i32* %2, align 4
  %39 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %38
  %40 = load i8, i8* %39, align 1
  %41 = icmp eq i8 %40, 0
  br i1 %41, label %tail8, label %head7

head7:                                            ; preds = %head7, %head6
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %42 = load i32, i32* %2, align 4
  %43 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %42
  %44 = load i8, i8* %43, align 1
  %45 = icmp ne i8 %44, 0
  br i1 %45, label %head7, label %tail8

tail8:                                            ; preds = %head7, %head6
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  %46 = load i32, i32* %2, align 4
  %47 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %46
  %48 = load i8, i8* %47, align 1
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %tail10, label %head9

head9:                                            ; preds = %head9, %tail8
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %50 = load i32, i32* %2, align 4
  %51 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %50
  %52 = load i8, i8* %51, align 1
  %53 = icmp ne i8 %52, 0
  br i1 %53, label %head9, label %tail10

tail10:                                           ; preds = %head9, %tail8
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 2)
  %54 = load i32, i32* %2, align 4
  %55 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %54
  %56 = load i8, i8* %55, align 1
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %tail12, label %head11

head11:                                           ; preds = %head11, %tail10
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -2)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %58 = load i32, i32* %2, align 4
  %59 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %58
  %60 = load i8, i8* %59, align 1
  %61 = icmp ne i8 %60, 0
  br i1 %61, label %head11, label %tail12

tail12:                                           ; preds = %head11, %tail10
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  %62 = load i32, i32* %2, align 4
  %63 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %62
  %64 = load i8, i8* %63, align 1
  %65 = icmp eq i8 %64, 0
  br i1 %65, label %tail36, label %head13

head13:                                           ; preds = %tail35, %tail12
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %66 = load i32, i32* %2, align 4
  %67 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %66
  %68 = load i8, i8* %67, align 1
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %tail35, label %head14

head14:                                           ; preds = %tail34, %head13
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %70 = load i32, i32* %2, align 4
  %71 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %70
  %72 = load i8, i8* %71, align 1
  %73 = icmp eq i8 %72, 0
  br i1 %73, label %tail34, label %head15

head15:                                           ; preds = %tail33, %head14
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %74 = load i32, i32* %2, align 4
  %75 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %74
  %76 = load i8, i8* %75, align 1
  %77 = icmp eq i8 %76, 0
  br i1 %77, label %tail33, label %head16

head16:                                           ; preds = %tail32, %head15
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %78 = load i32, i32* %2, align 4
  %79 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %78
  %80 = load i8, i8* %79, align 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %tail32, label %head17

head17:                                           ; preds = %tail31, %head16
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %82 = load i32, i32* %2, align 4
  %83 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %82
  %84 = load i8, i8* %83, align 1
  %85 = icmp eq i8 %84, 0
  br i1 %85, label %tail31, label %head18

head18:                                           ; preds = %tail30, %head17
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %86 = load i32, i32* %2, align 4
  %87 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %86
  %88 = load i8, i8* %87, align 1
  %89 = icmp eq i8 %88, 0
  br i1 %89, label %tail30, label %head19

head19:                                           ; preds = %tail29, %head18
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %90 = load i32, i32* %2, align 4
  %91 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %90
  %92 = load i8, i8* %91, align 1
  %93 = icmp eq i8 %92, 0
  br i1 %93, label %tail29, label %head20

head20:                                           ; preds = %tail28, %head19
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %94 = load i32, i32* %2, align 4
  %95 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %94
  %96 = load i8, i8* %95, align 1
  %97 = icmp eq i8 %96, 0
  br i1 %97, label %tail28, label %head21

head21:                                           ; preds = %tail27, %head20
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %98 = load i32, i32* %2, align 4
  %99 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %98
  %100 = load i8, i8* %99, align 1
  %101 = icmp eq i8 %100, 0
  br i1 %101, label %tail27, label %head22

head22:                                           ; preds = %tail26, %head21
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  %102 = load i32, i32* %2, align 4
  %103 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %102
  %104 = load i8, i8* %103, align 1
  %105 = icmp eq i8 %104, 0
  br i1 %105, label %tail24, label %head23

head23:                                           ; preds = %head23, %head22
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %106 = load i32, i32* %2, align 4
  %107 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %106
  %108 = load i8, i8* %107, align 1
  %109 = icmp ne i8 %108, 0
  br i1 %109, label %head23, label %tail24

tail24:                                           ; preds = %head23, %head22
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -3)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %110 = load i32, i32* %2, align 4
  %111 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %110
  %112 = load i8, i8* %111, align 1
  %113 = icmp eq i8 %112, 0
  br i1 %113, label %tail26, label %head25

head25:                                           ; preds = %head25, %tail24
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -1)
  call void @Add(i32* %2, [30000 x i8]* %1, i8 -1)
  %114 = load i32, i32* %2, align 4
  %115 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %114
  %116 = load i8, i8* %115, align 1
  %117 = icmp ne i8 %116, 0
  br i1 %117, label %head25, label %tail26

tail26:                                           ; preds = %head25, %tail24
  %118 = load i32, i32* %2, align 4
  %119 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %118
  %120 = load i8, i8* %119, align 1
  %121 = icmp ne i8 %120, 0
  br i1 %121, label %head22, label %tail27

tail27:                                           ; preds = %tail26, %head21
  %122 = load i32, i32* %2, align 4
  %123 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %122
  %124 = load i8, i8* %123, align 1
  %125 = icmp ne i8 %124, 0
  br i1 %125, label %head21, label %tail28

tail28:                                           ; preds = %tail27, %head20
  %126 = load i32, i32* %2, align 4
  %127 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %126
  %128 = load i8, i8* %127, align 1
  %129 = icmp ne i8 %128, 0
  br i1 %129, label %head20, label %tail29

tail29:                                           ; preds = %tail28, %head19
  %130 = load i32, i32* %2, align 4
  %131 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %130
  %132 = load i8, i8* %131, align 1
  %133 = icmp ne i8 %132, 0
  br i1 %133, label %head19, label %tail30

tail30:                                           ; preds = %tail29, %head18
  %134 = load i32, i32* %2, align 4
  %135 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %134
  %136 = load i8, i8* %135, align 1
  %137 = icmp ne i8 %136, 0
  br i1 %137, label %head18, label %tail31

tail31:                                           ; preds = %tail30, %head17
  %138 = load i32, i32* %2, align 4
  %139 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %138
  %140 = load i8, i8* %139, align 1
  %141 = icmp ne i8 %140, 0
  br i1 %141, label %head17, label %tail32

tail32:                                           ; preds = %tail31, %head16
  %142 = load i32, i32* %2, align 4
  %143 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %142
  %144 = load i8, i8* %143, align 1
  %145 = icmp ne i8 %144, 0
  br i1 %145, label %head16, label %tail33

tail33:                                           ; preds = %tail32, %head15
  %146 = load i32, i32* %2, align 4
  %147 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %146
  %148 = load i8, i8* %147, align 1
  %149 = icmp ne i8 %148, 0
  br i1 %149, label %head15, label %tail34

tail34:                                           ; preds = %tail33, %head14
  %150 = load i32, i32* %2, align 4
  %151 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %150
  %152 = load i8, i8* %151, align 1
  %153 = icmp ne i8 %152, 0
  br i1 %153, label %head14, label %tail35

tail35:                                           ; preds = %tail34, %head13
  %154 = load i32, i32* %2, align 4
  %155 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %154
  %156 = load i8, i8* %155, align 1
  %157 = icmp ne i8 %156, 0
  br i1 %157, label %head13, label %tail36

tail36:                                           ; preds = %tail35, %tail12
  call void @Add(i32* %2, [30000 x i8]* %1, i8 1)
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 3)
  %158 = load i32, i32* %2, align 4
  %159 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %158
  %160 = load i8, i8* %159, align 1
  %161 = icmp ne i8 %160, 0
  br i1 %161, label %head6, label %tail37

tail37:                                           ; preds = %tail36, %tail5
  call void @Mov(i32* %2, [30000 x i8]* %1, i32 -3)
  %162 = load i32, i32* %2, align 4
  %163 = getelementptr [30000 x i8], [30000 x i8]* %1, i32 0, i32 %162
  %164 = load i8, i8* %163, align 1
  %165 = icmp ne i8 %164, 0
  br i1 %165, label %head, label %tail38

tail38:                                           ; preds = %tail37, %0
  ret void
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #0

attributes #0 = { argmemonly nounwind willreturn writeonly }
