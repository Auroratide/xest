package com.auroratide.xest.expect;

import haxe.macro.Expr;
using haxe.macro.Tools;

abstract Expectation(ExprOf<Bool>) to ExprOf<Bool> {
  public inline function evaluate() {
    return macro if(!$this) throw ${message()};
  }

  public inline function message():ExprOf<String> {
    return switch(this.expr) {
      case EBinop(OpEq, lhs, rhs):
        expr('Expected ${lhs.toString()} to equal ${rhs.toString()}');
      case _:
        expr('Expected ${this.toString()} to be true');
    }
  }

  private inline function expr(s:String):ExprOf<String> {
    return {
      expr: EConst(CString(s)),
      pos: this.pos
    };
  }
}