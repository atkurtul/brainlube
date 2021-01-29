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
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  %4 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %tail38, label %head

head:                                             ; preds = %tail37, %0
  %6 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %tail5, label %head1

head1:                                            ; preds = %tail4, %head
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  %8 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %tail, label %head2

head2:                                            ; preds = %head2, %head1
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %10 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %11 = icmp ne i8 %10, 0
  br i1 %11, label %head2, label %tail

tail:                                             ; preds = %head2, %head1
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  %12 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %tail4, label %head3

head3:                                            ; preds = %head3, %tail
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %14 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %15 = icmp ne i8 %14, 0
  br i1 %15, label %head3, label %tail4

tail4:                                            ; preds = %head3, %tail
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  %16 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %17 = icmp ne i8 %16, 0
  br i1 %17, label %head1, label %tail5

tail5:                                            ; preds = %tail4, %head
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @dot(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  %18 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %tail37, label %head6

head6:                                            ; preds = %tail36, %tail5
  %20 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %tail8, label %head7

head7:                                            ; preds = %head7, %head6
  call void @minus(i32* %2, [30000 x i8]* %1)
  %22 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %23 = icmp ne i8 %22, 0
  br i1 %23, label %head7, label %tail8

tail8:                                            ; preds = %head7, %head6
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  %24 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %tail10, label %head9

head9:                                            ; preds = %head9, %tail8
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %26 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %27 = icmp ne i8 %26, 0
  br i1 %27, label %head9, label %tail10

tail10:                                           ; preds = %head9, %tail8
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  %28 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %29 = icmp eq i8 %28, 0
  br i1 %29, label %tail12, label %head11

head11:                                           ; preds = %head11, %tail10
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %30 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %31 = icmp ne i8 %30, 0
  br i1 %31, label %head11, label %tail12

tail12:                                           ; preds = %head11, %tail10
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  %32 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %tail36, label %head13

head13:                                           ; preds = %tail35, %tail12
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %34 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %tail35, label %head14

head14:                                           ; preds = %tail34, %head13
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %36 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %tail34, label %head15

head15:                                           ; preds = %tail33, %head14
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %38 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %tail33, label %head16

head16:                                           ; preds = %tail32, %head15
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %40 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %41 = icmp eq i8 %40, 0
  br i1 %41, label %tail32, label %head17

head17:                                           ; preds = %tail31, %head16
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %42 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %tail31, label %head18

head18:                                           ; preds = %tail30, %head17
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %44 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %45 = icmp eq i8 %44, 0
  br i1 %45, label %tail30, label %head19

head19:                                           ; preds = %tail29, %head18
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %46 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %47 = icmp eq i8 %46, 0
  br i1 %47, label %tail29, label %head20

head20:                                           ; preds = %tail28, %head19
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %48 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %tail28, label %head21

head21:                                           ; preds = %tail27, %head20
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %50 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %tail27, label %head22

head22:                                           ; preds = %tail26, %head21
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  %52 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %53 = icmp eq i8 %52, 0
  br i1 %53, label %tail24, label %head23

head23:                                           ; preds = %head23, %head22
  call void @minus(i32* %2, [30000 x i8]* %1)
  %54 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %55 = icmp ne i8 %54, 0
  br i1 %55, label %head23, label %tail24

tail24:                                           ; preds = %head23, %head22
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %56 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %tail26, label %head25

head25:                                           ; preds = %head25, %tail24
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @minus(i32* %2, [30000 x i8]* %1)
  %58 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %59 = icmp ne i8 %58, 0
  br i1 %59, label %head25, label %tail26

tail26:                                           ; preds = %head25, %tail24
  %60 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %61 = icmp ne i8 %60, 0
  br i1 %61, label %head22, label %tail27

tail27:                                           ; preds = %tail26, %head21
  %62 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %63 = icmp ne i8 %62, 0
  br i1 %63, label %head21, label %tail28

tail28:                                           ; preds = %tail27, %head20
  %64 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %65 = icmp ne i8 %64, 0
  br i1 %65, label %head20, label %tail29

tail29:                                           ; preds = %tail28, %head19
  %66 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %67 = icmp ne i8 %66, 0
  br i1 %67, label %head19, label %tail30

tail30:                                           ; preds = %tail29, %head18
  %68 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %69 = icmp ne i8 %68, 0
  br i1 %69, label %head18, label %tail31

tail31:                                           ; preds = %tail30, %head17
  %70 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %71 = icmp ne i8 %70, 0
  br i1 %71, label %head17, label %tail32

tail32:                                           ; preds = %tail31, %head16
  %72 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %73 = icmp ne i8 %72, 0
  br i1 %73, label %head16, label %tail33

tail33:                                           ; preds = %tail32, %head15
  %74 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %75 = icmp ne i8 %74, 0
  br i1 %75, label %head15, label %tail34

tail34:                                           ; preds = %tail33, %head14
  %76 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %77 = icmp ne i8 %76, 0
  br i1 %77, label %head14, label %tail35

tail35:                                           ; preds = %tail34, %head13
  %78 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %79 = icmp ne i8 %78, 0
  br i1 %79, label %head13, label %tail36

tail36:                                           ; preds = %tail35, %tail12
  call void @plus(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  call void @right_chevron(i32* %2, [30000 x i8]* %1)
  %80 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %81 = icmp ne i8 %80, 0
  br i1 %81, label %head6, label %tail37

tail37:                                           ; preds = %tail36, %tail5
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  call void @left_chevron(i32* %2, [30000 x i8]* %1)
  %82 = call i8 @load_cell(i32* %2, [30000 x i8]* %1)
  %83 = icmp ne i8 %82, 0
  br i1 %83, label %head, label %tail38

tail38:                                           ; preds = %tail37, %0
  ret void
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #0

attributes #0 = { argmemonly nounwind willreturn writeonly }
