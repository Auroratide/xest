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
        macro 'Expected ${lhs.toString()} to equal ${rhs.toString()}\n\n' +
          'Expected: ' + $rhs + '\n' +
          'Actual  : ' + $lhs;
      case _:
        macro 'Expected ${this.toString()} to be true';
    }
  }
}