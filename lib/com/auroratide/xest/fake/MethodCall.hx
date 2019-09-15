package com.auroratide.xest.fake;

import com.auroratide.xest.stub.OngoingStubbing;
import haxe.macro.Expr;

abstract MethodCall<T>(ExprOf<T>) from ExprOf<T> to ExprOf<T> {
  public var fake(get, never):ExprOf<Fake>;
  public var method(get, never):String;
  public var args(get, never):Array<Expr>;

  public inline function stub():ExprOf<OngoingStubbing<T>> {
    return macro $fake.xest.stubs.get($v{method}).with();
  }

  private function get_fake():ExprOf<Fake> {
    return switch(this.expr) {
      case ECall(field, _): return switch(field.expr) {
        case EField(f, _): f;
        case _: null;
      };
      case _: null;
    };
  }

  private function get_method():String {
    return switch(this.expr) {
      case ECall(field, _): return switch(field.expr) {
        case EField(_, m): m;
        case _: null;
      };
      case _: null;
    };
  }

  private function get_args():Array<Expr> {
    return switch(this.expr) {
      case ECall(_, a): a;
      case _: [];
    };
  }
}