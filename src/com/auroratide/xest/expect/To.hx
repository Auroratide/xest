package com.auroratide.xest.expect;

class To<T> {
  private final actual:T;

  public function new(actual:T) {
    this.actual = actual;
  }

  public final function be(expected:T) {
    if(actual != expected)
      throw 'Expected $expected but got $actual';
  }

  public final function equal<U:{ function equals(other:T):Bool; }>(expected:U) {
    if(!expected.equals(actual))
      throw 'Expected $expected to equal $actual, but it did not';
  }
}