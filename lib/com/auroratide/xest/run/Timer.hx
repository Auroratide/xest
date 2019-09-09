package com.auroratide.xest.run;

class Timer {
  public static function millis(f:() -> Void):Milliseconds {
    final start = haxe.Timer.stamp();
    f();
    return 1000 * (haxe.Timer.stamp() - start);
  }
}

abstract Milliseconds(Float) from Float to Float {
  public inline function toString():String {
    final n = Math.round(10 * this);
    return '${n / 10}ms';
  }

  @:op(A == B)
  public function equals(other:Float):Bool
    return this == other;

  @:op(A < B)
  public function lessThan(other:Float):Bool
    return this < other;

  @:op(A <= B)
  public function lessThanOrEqualTo(other:Float):Bool
    return this < other || this == other;
  
  @:op(A > B)
  public function greaterThan(other:Float):Bool
    return !(this <= other);
  
  @:op(A >= B)
  public function greaterThanOrEqualTo(other:Float):Bool
    return !(this < other);
  
  @:op(A + B)
  public function plus(other:Float):Milliseconds
    return this + other;
}