package com.auroratide.xest.expect;

import haxe.display.Position.Location;
import haxe.macro.Expr;
import haxe.macro.Context;
using haxe.macro.Tools;

abstract Expectation(ExprOf<Bool>) to ExprOf<Bool> {
  public inline function evaluate(location:Location) {
    final file = { expr: EConst(CString(location.file.toString())), pos: Context.currentPos() };
    final line = { expr: EConst(CInt('${location.range.start.line}')), pos: Context.currentPos() };

    return switch(this.expr) {
      case EBinop(OpEq, lhs, rhs):
        final block = [];
        block.push(macro final l = $lhs);
        block.push(macro final r = $rhs);
        block.push(macro if(!(l == r)) throw new com.auroratide.xest.expect.ExpectationFailure('Expected ${lhs.toString()} to equal ${rhs.toString()}\n\n' +
          'Expected: ' + r + '\n' +
          'Actual  : ' + l, $file, $line));
        return macro $b{block};
      case EBinop(OpNotEq, lhs, rhs):
        final block = [];
        block.push(macro final l = $lhs);
        block.push(macro final r = $rhs);
        block.push(macro if(!(l != r)) throw new com.auroratide.xest.expect.ExpectationFailure('Expected ${lhs.toString()} to equal ${rhs.toString()}\n\n' +
          'Expected: ' + r + '\n' +
          'Actual  : ' + l, $file, $line));
        return macro $b{block};
      case _:
        return macro if(!$this) throw new com.auroratide.xest.expect.ExpectationFailure('Expected ${this.toString()} to be true', $file, $line);
    }
  }
}