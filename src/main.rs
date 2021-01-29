#![allow(warnings)]
mod llvm;

#[derive(Debug, Clone, Copy)]
pub enum Tok {
  Plus,
  Minus,
  Dot,
  Comma,
  RightChevron,
  LeftChevron,
  Debug,
  LeftBracket(u8),
  RightBracket(u8),
  Halt,
}

fn parse(src: &str) -> Vec<Tok> {
  let mut tok = vec![];
  let mut stack = vec![];
  for c in src.chars() {
    match c {
      '>' => tok.push(Tok::RightChevron),
      '<' => tok.push(Tok::LeftChevron),
      '+' => tok.push(Tok::Plus),
      '-' => tok.push(Tok::Minus),
      '.' => tok.push(Tok::Dot),
      ',' => tok.push(Tok::Comma),
      '?' => tok.push(Tok::Debug),
      '[' => {
        stack.push(tok.len());
        tok.push(Tok::LeftBracket(0));
      }
      ']' => {
        let len = stack.pop().unwrap();
        let delta = (tok.len() - len) as u8;
        tok[len] = Tok::LeftBracket(delta);
        tok.push(Tok::RightBracket(delta));
      }
      _ => (),
    }
  }
  assert!(stack.is_empty());
  tok.push(Tok::Halt);
  tok
}

fn exec(mut src: *const Tok, mut data: *mut u8) {
  extern "C" {
    fn getchar() -> i32;
    fn putchar(c: i32);
  }
  unsafe {
    loop {
      match *src {
        Tok::RightChevron => data = data.offset(1),
        Tok::LeftChevron => data = data.offset(-1),
        Tok::Plus => *data += 1,
        Tok::Minus => *data -= 1,
        Tok::Dot => putchar(*data as i32),
        Tok::Comma => *data = getchar() as u8,
        Tok::LeftBracket(d) => {
          if *data == 0 {
            src = src.offset(d as _);
            continue;
          }
        }
        Tok::RightBracket(d) => {
          if *data != 0 {
            src = src.offset(-(d as isize));
            continue;
          }
        }
        Tok::Debug => (),
        Tok::Halt => return,
      }
      src = src.offset(1);
    }
  }
}

use libc::exit;
use llvm::*;

trait LlvmCast {
  fn val(self) -> ValueRef;
  fn ty() -> TypeRef;
}

impl LlvmCast for i32 {
  fn val(self) -> ValueRef {
    Self::ty().const_int(self as _, 0)
  }
  fn ty() -> TypeRef {
    int_32_type()
  }
}

impl LlvmCast for i8 {
  fn val(self) -> ValueRef {
    Self::ty().const_int(self as _, 0)
  }
  fn ty() -> TypeRef {
    int_8_type()
  }
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
  let nil = "\0".as_ptr() as _;
  let ctx = context_create();
  let mdl = module_create_with_name_in_context(mkstr!("main"), ctx);
  let bld = create_builder();

  let args = [
    i32::ty().pointer_type(0),
    int_8_type().array_type(30000).pointer_type(0),
  ];
  let inst_ty = void_type().function_type(args.as_ptr() as _, args.len() as _, 0);

  let putchar = mdl.add_function(
    mkstr!("putchar"),
    void_type().function_type(&mut i32::ty().0, 1, 0),
    );
  let getchar = mdl.add_function(mkstr!("getchar"), 
                  i32::ty().function_type(0 as _, 0, 0));

  let plus = mdl.add_function(mkstr!("plus"), inst_ty);
  {
    bld.position_builder_at_end(ctx.append_basic_block_in_context(plus, nil));
    let rsp = plus.get_param(0);
    let stack = plus.get_param(1);
    let (p_cell, cell) = load_cell(bld, rsp, stack);
    bld.build_store(bld.build_add(cell, 1i8.val(), nil), p_cell);
    bld.build_ret_void();
  }

  let minus = mdl.add_function(mkstr!("minus"), inst_ty);
  {
    bld.position_builder_at_end(ctx.append_basic_block_in_context(minus, nil));
    let rsp = minus.get_param(0);
    let stack = minus.get_param(1);
    let (p_cell, cell) = load_cell(bld, rsp, stack);
    bld.build_store(bld.build_sub(cell, 1i8.val(), nil), p_cell);
    bld.build_ret_void();
  }

  let dot = mdl.add_function(mkstr!("dot"), inst_ty);
  {
    bld.position_builder_at_end(ctx.append_basic_block_in_context(dot, nil));
    let rsp = dot.get_param(0);
    let stack = dot.get_param(1);
    let (_, cell) = load_cell(bld, rsp, stack);
    bld.build_call(putchar, [bld.build_int_cast(cell, i32::ty(), nil)].as_ptr() as _, 1, nil);
    bld.build_ret_void();
  }

  let comma = mdl.add_function(mkstr!("comma"), inst_ty);
  {
    bld.position_builder_at_end(ctx.append_basic_block_in_context(comma, nil));
    let rsp = comma.get_param(0);
    let stack = comma.get_param(1);

    let (p_cell, _) = load_cell(bld, rsp, stack);
    let val = bld.build_int_cast(bld.build_call(getchar, 0 as _, 0, nil), i8::ty(), nil);
    bld.build_store(val, p_cell);
    bld.build_ret_void();
  }

  let right_chevron = mdl.add_function(mkstr!("right_chevron"), inst_ty);
  {
    let rsp = right_chevron.get_param(0);
    bld.position_builder_at_end(ctx.append_basic_block_in_context(right_chevron, nil));
    bld.build_store(bld.build_add(bld.build_load(rsp, nil), 1.val(), nil), rsp);
    bld.build_ret_void();
  }

  let left_chevron = mdl.add_function(mkstr!("left_chevron"), inst_ty);
  {
    let rsp = left_chevron.get_param(0);
    bld.position_builder_at_end(ctx.append_basic_block_in_context(left_chevron, nil));
    bld.build_store(bld.build_sub(bld.build_load(rsp, nil), 1.val(), nil), rsp);
    bld.build_ret_void();
  }

  let loadcell = mdl.add_function(mkstr!("load_cell"), 
                  i8::ty().function_type(args.as_ptr() as _, args.len() as _, 0));
  {
    bld.position_builder_at_end(ctx.append_basic_block_in_context(loadcell, nil));
    let rsp = loadcell.get_param(0);
    let stack = loadcell.get_param(1);
    let (_, cell) = load_cell(bld, rsp, stack);
    bld.build_ret(cell);
  }

  let debug = mdl.add_function(mkstr!("debug"), inst_ty);
  {
    bld.position_builder_at_end(ctx.append_basic_block_in_context(debug, nil));
    let rsp = debug.get_param(0);
    bld.build_call(putchar, [bld.build_load(rsp, nil)].as_ptr() as _, 1, nil);
    bld.build_ret_void();
  }

  let fty = void_type().function_type(0 as _, 0, 0);
  let func = mdl.add_function(mkstr!("main"), fty);
  let bb = ctx.append_basic_block_in_context(func, nil);
  bld.position_builder_at_end(bb);
  let stack = bld.build_alloca(int_8_type().array_type(30000), nil);
  let rsp = bld.build_alloca(i32::ty(), nil);
  bld.build_store(0.val(), rsp);
  {
    let stacki8 = bld.build_pointer_cast(stack, i8::ty().pointer_type(0), nil);
    bld.build_mem_set(stacki8, 0i8.val(), 30000.val(), 0);
  }
  let args = [rsp, stack];
  let mut bbs = vec![];
  for inst in src.iter() {
    match inst {

      Tok::RightChevron => {
        bld.build_call(right_chevron, args.as_ptr() as _ , args.len() as _, nil);
      }

      Tok::LeftChevron => {
        bld.build_call(left_chevron, args.as_ptr() as _ , args.len() as _, nil);
      }

      Tok::Plus => {
        bld.build_call(plus, args.as_ptr() as _ , args.len() as _, nil);
      }

      Tok::Minus => {
        bld.build_call(minus, args.as_ptr() as _ , args.len() as _, nil);
      }

      Tok::Dot => {
        bld.build_call(dot, args.as_ptr() as _ , args.len() as _, nil);
      }

      Tok::Comma => {
        bld.build_call(comma, args.as_ptr() as _ , args.len() as _, nil);
      }

      Tok::Debug => {
        bld.build_call(debug, args.as_ptr() as _ , args.len() as _, nil);
      }

      Tok::LeftBracket(_) => {
        let head = ctx.append_basic_block_in_context(func, mkstr!("head"));
        let tail = ctx.create_basic_block_in_context(mkstr!("tail"));
        bbs.push((head, tail));

        let cell = bld.build_call(loadcell, args.as_ptr() as _ , args.len() as _, nil);
        let pred = bld.build_i_cmp(LLVMIntPredicate::LLVMIntEQ, cell, 0i8.val(), nil);
        bld.build_cond_br(pred, tail, head);
        bld.position_builder_at_end(head);
      }

      Tok::RightBracket(_) => {
        let (head, tail) = bbs.pop().unwrap();

        let cell = bld.build_call(loadcell, args.as_ptr() as _ , args.len() as _, nil);
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
  if err != 0 as _{
    unsafe { 
      eprintln!("{:?}", std::ffi::CStr::from_ptr(err));
    }
  }
  mdl.dispose_module();
  ctx.context_dispose();
}

fn print_usage_and_exit<T>() -> T {
  println!("Usage:\n\tbrainlube <file> -o <outfile>");
  unsafe { libc::exit(1); }
}

fn main() {
  let mut args: Vec<String> = std::env::args().skip(1).collect();

  let file;
  let out;

  if args.len() == 1 {
    file = args.pop().unwrap();
    out = format!("{}.ll", file);
  } else if args.len() == 3 {
    let i = args.iter().enumerate().find(|(i, s)| s == &"-o").unwrap_or_else(|| print_usage_and_exit()).0;
    out = args.remove(i+1);
    args.remove(i);
    file = args.pop().unwrap();
  } else {
    print_usage_and_exit::<()>();
    panic!()
  }
  let src = std::fs::read_to_string(&file).unwrap();
  let prog = parse(&src);
  compile(&prog, &out);
}
