package com.auroratide.xest.assert;

class Assertion<T> {
  private final actual:T;

  public function new(actual:T) {
    this.actual = actual;
  }

  public final function is(expected:T) {
    if(actual != expected)
      throw 'Expected $expected but got $actual';
  }
}