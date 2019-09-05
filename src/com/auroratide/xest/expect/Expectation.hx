package com.auroratide.xest.expect;

class Expectation<T> {
  private final actual:T;
  public var to(get, never):To<T>;

  public function new(actual:T) {
    this.actual = actual;
  }

  private function get_to():To<T>
    return new To<T>(actual);
}