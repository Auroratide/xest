package com.auroratide.xest;

import com.auroratide.xest.assert.Assertion;

using Lambda;

class Xest {

  public function run() {}

  private final function example(name:String, f:() -> Void) {
    f();
  }

  private final function assert<T>(actual:T):Assertion<T> {
    return new Assertion<T>(actual);
  }

  private final inline function it(name:String, f:() -> Void)
    example(name, f);

  private final inline function test(name:String, f:() -> Void)
    example(name, f);

  public static function start(suites:Array<Xest>) {
    suites.iter(s -> s.run());
  }
}