package com.auroratide.xest;

import com.auroratide.xest.assert.Assertion;

using Lambda;

class Xest {
  private final __examples:Map<String, () -> Void> = [];

  private final function run() {
    __examples.iter(it -> it());
  }

  private final function example(name:String, f:() -> Void) {
    __examples[name] = f;
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