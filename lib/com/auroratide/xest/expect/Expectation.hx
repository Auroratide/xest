package com.auroratide.xest.expect;

import haxe.display.Position.Location;
import haxe.macro.Expr;
import haxe.macro.Context;
using haxe.macro.Tools;

abstract Expectation(ExprOf<Bool>) to ExprOf<Bool> {
  public inline function evaluate(location:Location) {
    final file = { expr: EConst(CString(location.file.toString())), pos: Context.currentPos() };
    final line = { expr: EConst(CInt('${location.range.start.line}')), pos: Context.currentPos() };
    return macro if(!$this) throw new com.auroratide.xest.expect.ExpectationFailure(${message()}, $file, $line);
  }

  public inline function message():ExprOf<String> {
    return switch(this.expr) {
      case EBinop(OpEq, lhs, rhs):
        macro 'Expected ${lhs.toString()} to equal ${rhs.toString()}\n\n' +
          'Expected: ' + $rhs + '\n' +
          'Actual  : ' + $lhs;
      case EBinop(OpNotEq, lhs, rhs):
        macro 'Expected ${lhs.toString()} to not equal ${rhs.toString()}\n\n' +
          'Expected: ' + $rhs + '\n' +
          'Actual  : ' + $lhs;
      case _:
        macro 'Expected ${this.toString()} to be true';
    }
  }
}