#![allow(warnings)]
mod llvm;
use libc::exit;
use llvm::*;

trait LllvmRustInt:  Into<i64> {
    fn val(self) -> ValueRef {
      Self::ty().const_int(self.into() as _, 0)
    }
    fn ty() -> TypeRef;
}

impl LllvmRustInt for i32 {
    fn ty() -> TypeRef {
        int_32_type()
    }
}

impl LllvmRustInt for i8 {
    fn ty() -> TypeRef {
        int_8_type()
    }
}

impl LllvmRustInt for bool {
  fn ty() -> TypeRef {
      int_1_type()
  }
}

#[derive(Debug, Clone, Copy)]
pub enum Tok {
    Add(i8),
    Mov(i32),
    Input,
    Output,
    LeftBracket,
    RightBracket,
    Halt,
}

macro_rules! mkstr {
    ($str:expr) => {
        format!("{}\0", $str).as_ptr() as _
    };
}

fn load_cell(bld: BuilderRef, p_rsp: ValueRef, p_stack: ValueRef) -> (ValueRef, ValueRef) {
    let nil = "\0".as_ptr() as _;
    let rsp = bld.build_load(p_rsp, nil);
    let idx = [0.val(), rsp];
    let p_cell = bld.build_gep(p_stack, idx.as_ptr() as _, idx.len() as _, nil);
    let cell = bld.build_load(p_cell, nil);
    (p_cell, cell)
}

fn compile(src: &[Tok], outfile: &str) {
    let nil = "\0".as_ptr() as *const i8;
    let ctx = context_create();
    let mdl = module_create_with_name_in_context(mkstr!("main"), ctx);
    let bld = create_builder();
    let putchar = mdl.add_function(
        mkstr!("putchar"),
        void_type().function_type(&mut i32::ty().0, 1, 0),
    );
    let pint = i32::ty().pointer_type(0);
    let parr = int_8_type().array_type(30000).pointer_type(0);
    let getchar = mdl.add_function(mkstr!("getchar"), i32::ty().function_type(0 as _, 0, 0));

    let inst = [pint, parr];
    let inst = int_1_type().function_type(inst.as_ptr() as _, inst.len() as _, 0);

    let add = [pint, parr, i8::ty()];
    let mov = [pint, parr, i32::ty()];

    let add = void_type().function_type(add.as_ptr() as _, add.len() as _, 0);
    let mov = void_type().function_type(mov.as_ptr() as _, mov.len() as _, 0);

    let Add = mdl.add_function(mkstr!("Add"), add);
    let Mov = mdl.add_function(mkstr!("Mov"), mov);

    let Output = mdl.add_function(mkstr!("Output"), inst);
    let Input = mdl.add_function(mkstr!("Input"),   inst);
    let LeftBrace = mdl.add_function(mkstr!("LeftBrace"), inst);
    let RightBrace = mdl.add_function(mkstr!("RightBrace"), inst);
    //Add
    {
        bld.position_builder_at_end(ctx.append_basic_block_in_context(Add, nil));
        let (p_cell, cell) = load_cell(bld, Add.get_param(0), Add.get_param(1));
        bld.build_store(bld.build_add(cell, Add.get_param(2), nil), p_cell);
        bld.build_ret_void();
    }
    //Mov
    {
        bld.position_builder_at_end(ctx.append_basic_block_in_context(Mov, nil));
        bld.build_store(
            bld.build_add(bld.build_load(Mov.get_param(0), nil), Mov.get_param(2), nil),
            Mov.get_param(0),
        );
        bld.build_ret_void();
    }
    //Output
    {
        bld.position_builder_at_end(ctx.append_basic_block_in_context(Output, nil));
        let (_, cell) = load_cell(bld, Output.get_param(0), Output.get_param(1));
        bld.build_call(
            putchar,
            [bld.build_int_cast(cell, i32::ty(), nil)].as_ptr() as _,
            1,
            nil,
        );
        bld.build_ret(true.val());
    }
    //Input
    {
        bld.position_builder_at_end(ctx.append_basic_block_in_context(Input, nil));
        let (p_cell, _) = load_cell(bld, Input.get_param(0), Input.get_param(1));
        let val = bld.build_int_cast(bld.build_call(getchar, 0 as _, 0, nil), i8::ty(), nil);
        bld.build_store(val, p_cell);
        bld.build_ret(true.val());
    }
    //LeftBrace
    {
        bld.position_builder_at_end(ctx.append_basic_block_in_context(LeftBrace, nil));
        let (_, cell) = load_cell(bld, LeftBrace.get_param(0), LeftBrace.get_param(1));
        let pred = bld.build_i_cmp(LLVMIntPredicate::LLVMIntEQ, cell, 0i8.val(), nil);
        bld.build_ret(pred);
    }
    //RightBrace
    {
        bld.position_builder_at_end(ctx.append_basic_block_in_context(RightBrace, nil));
        let (_, cell) = load_cell(bld, RightBrace.get_param(0), RightBrace.get_param(1));
        let pred = bld.build_i_cmp(LLVMIntPredicate::LLVMIntNE, cell, 0i8.val(), nil);
        bld.build_ret(pred);
    }

    let fty = void_type().function_type(0 as _, 0, 0);
    let func = mdl.add_function(mkstr!("main"), fty);
    bld.position_builder_at_end(ctx.append_basic_block_in_context(func, nil));
    let stack = bld.build_alloca(int_8_type().array_type(30000), nil);
    let rsp = bld.build_alloca(i32::ty(), nil);
    bld.build_store(0.val(), rsp);
    let stacki8 = bld.build_pointer_cast(stack, i8::ty().pointer_type(0), nil);
    bld.build_mem_set(stacki8, 0i8.val(), 30000.val(), 0);
    let mut bbs = vec![];
    let args = [rsp, stack];
    for inst in src {
        match inst {
            Tok::Add(i) => {
                let args = [rsp, stack, i.val()];
                bld.build_call(Add, args.as_ptr() as _, args.len() as _, nil);
            }

            Tok::Mov(i) => {
                let args = [rsp, stack, i.val()];
                bld.build_call(Mov, args.as_ptr() as _, args.len() as _, nil);
            }

            Tok::Input => {
                bld.build_call(Input, args.as_ptr() as _, args.len() as _, nil);
            }

            Tok::Output => {
                bld.build_call(Output, args.as_ptr() as _, args.len() as _, nil);
            }
            
            Tok::LeftBracket => {
                let head = ctx.append_basic_block_in_context(func, mkstr!("head"));
                let tail = ctx.create_basic_block_in_context(mkstr!("tail"));
                bbs.push((head, tail));

                let (_, cell) = load_cell(bld, rsp, stack);
                let pred = bld.build_i_cmp(LLVMIntPredicate::LLVMIntEQ, cell, 0i8.val(), nil);
                bld.build_cond_br(pred, tail, head);
                bld.position_builder_at_end(head);
            }

            Tok::RightBracket => {
                let (head, tail) = bbs.pop().unwrap();
                let (_, cell) = load_cell(bld, rsp, stack);
                let pred = bld.build_i_cmp(LLVMIntPredicate::LLVMIntNE, cell, 0i8.val(), nil);
                bld.build_cond_br(pred, head, tail);
                bld.insert_existing_basic_block_after_insert_block(tail);
                bld.position_builder_at_end(tail);
            }
            Tok::Halt => {
                bld.build_ret_void();
            }
        }
    }

    let mut err = 0 as _;

    mdl.print_module_to_file(mkstr!(outfile), &mut err);
    if err != 0 as _ {
        unsafe {
            eprintln!("{:?}", std::ffi::CStr::from_ptr(err));
        }
    }
    mdl.dispose_module();
    ctx.context_dispose();
}

fn parser(s: &str) -> Vec<Tok> {
    let mut tok = vec![];
    let mut i = 0;
    let mut add = 0;
    let mut mov = 0;
    for c in s.chars() {
        match c {
            '>' => {
                mov += 1;
                if add != 0 {
                    tok.push(Tok::Add(add));
                    add = 0;
                }
            }
            '<' => {
                mov -= 1;
                if add != 0 {
                    tok.push(Tok::Add(add));
                    add = 0;
                }
            }
            '+' => {
                add += 1;
                if mov != 0 {
                    tok.push(Tok::Mov(mov));
                    mov = 0;
                }
            }
            '-' => {
                add -= 1;
                if mov != 0 {
                    tok.push(Tok::Mov(mov));
                    mov = 0;
                }
            }
            '.' => {
                if mov != 0 {
                    tok.push(Tok::Mov(mov));
                } else if add != 0 {
                    tok.push(Tok::Add(add));
                }
                mov = 0;
                add = 0;
                tok.push(Tok::Output);
            }
            ',' => {
                if mov != 0 {
                    tok.push(Tok::Mov(mov));
                } else if add != 0 {
                    tok.push(Tok::Add(add));
                }
                mov = 0;
                add = 0;
                tok.push(Tok::Input);
            }
            '[' => {
                if mov != 0 {
                    tok.push(Tok::Mov(mov));
                } else if add != 0 {
                    tok.push(Tok::Add(add));
                }
                mov = 0;
                add = 0;
                tok.push(Tok::LeftBracket);
            }
            ']' => {
                if mov != 0 {
                    tok.push(Tok::Mov(mov));
                } else if add != 0 {
                    tok.push(Tok::Add(add));
                }
                mov = 0;
                add = 0;
                tok.push(Tok::RightBracket);
            }
            _ => (),
        }
    }
    tok.push(Tok::Halt);
    tok
}

fn print_usage_and_exit<T>() -> T {
    println!("Usage:\n\tbrainlube <file> -o <outfile>");
    unsafe {
        libc::exit(1);
    }
}

fn main() {
    let mut args: Vec<String> = std::env::args().skip(1).collect();

    let file;
    let out;

    if args.len() == 1 {
        file = args.pop().unwrap();
        out = format!("{}.ll", file);
    } else if args.len() == 3 {
        let i = args
            .iter()
            .enumerate()
            .find(|(i, s)| s == &"-o")
            .unwrap_or_else(|| print_usage_and_exit())
            .0;
        out = args.remove(i + 1);
        args.remove(i);
        file = args.pop().unwrap();
    } else {
        print_usage_and_exit::<()>();
        panic!()
    }
    let src = std::fs::read_to_string(&file).unwrap();
    let prog = parser(&src);
    compile(&prog, &out);
}
