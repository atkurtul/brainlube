# brainlube: a Brainfuck Compiler
inspired by [bfc](https://github.com/Wilfred/bfc)

Currently only compiles to llvm ir

Requires llvm-11 and clang
```
sudo apt install libllvm11 clang
```

You can test the compiler with

```
git clone https://github.com/atkurtul/brainlube
cd brainlube
cargo build --release
cp ./target/release/brainlube .
brainlube <brainfuck source file> -o <llvm-ir file>
clang <llvm-ir file> -o <binary file>
./<binary file>
```

or simply run the `compile_tests.sh` script to compile every sample program in the tests directory.
<br/><br/>
tests are taken from [brainfuck](https://github.com/fabianishere/brainfuck)

---
# Instructions translate to

# +
```
define void @plus(i32* nocapture readonly %0, [30000 x i8]* nocapture %1) local_unnamed_addr #1 {
  %3 = load i32, i32* %0, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr [30000 x i8], [30000 x i8]* %1, i64 0, i64 %4
  %6 = load i8, i8* %5, align 1
  %7 = add i8 %6, 1
  store i8 %7, i8* %5, align 1
  ret void
}
```
# -
```
define void @minus(i32* nocapture readonly %0, [30000 x i8]* nocapture %1) local_unnamed_addr #1 {
  %3 = load i32, i32* %0, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr [30000 x i8], [30000 x i8]* %1, i64 0, i64 %4
  %6 = load i8, i8* %5, align 1
  %7 = add i8 %6, -1
  store i8 %7, i8* %5, align 1
  ret void
}
```
# .
```
define void @dot(i32* nocapture readonly %0, [30000 x i8]* nocapture readonly %1) local_unnamed_addr {
  %3 = load i32, i32* %0, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr [30000 x i8], [30000 x i8]* %1, i64 0, i64 %4
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  tail call void @putchar(i32 %7)
  ret void
}
```
# ,
```
define void @comma(i32* nocapture readonly %0, [30000 x i8]* nocapture %1) local_unnamed_addr #0 {
  %3 = load i32, i32* %0, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr [30000 x i8], [30000 x i8]* %1, i64 0, i64 %4
  %6 = tail call i32 @getchar()
  %7 = trunc i32 %6 to i8
  store i8 %7, i8* %5, align 1
  ret void
}
```
# >
```
define void @right_chevron(i32* nocapture %0, [30000 x i8]* nocapture readnone %1) local_unnamed_addr #1 {
  %3 = load i32, i32* %0, align 4
  %4 = add i32 %3, 1
  store i32 %4, i32* %0, align 4
  ret void
}
```
# <
```
define void @left_chevron(i32* nocapture %0, [30000 x i8]* nocapture readnone %1) local_unnamed_addr #1 {
  %3 = load i32, i32* %0, align 4
  %4 = add i32 %3, -1
  store i32 %4, i32* %0, align 4
  ret void
}
```


# Bonus `?` debug instruction extension 
* prints the value of cell pointer
* is always inline

```
define void @debug(i32* %0, [30000 x i8]* %1) {
  %3 = load i32, i32* %0, align 4
  call void @putchar(i32 %3)
  ret void
}
```
