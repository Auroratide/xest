package com.auroratide.xest;

import com.auroratide.xest.assert.Assertion;
import com.auroratide.xest.run.Example;

using Lambda;

class Xest {
  private final __examples:Array<Example> = [];

  private final function run() {
    for(example in __examples) {
      try {
        example.run();
        Sys.println('\u001B[32m✓\u001B[0m ${example.name}');
      } catch(e:Dynamic) {
        Sys.println('\u001B[31m✗ ${example.name}\u001B[0m');
      }
    }
  }

  private final function example(name:String, f:() -> Void) {
    __examples.push(new Example(name, f));
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