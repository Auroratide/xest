package com.auroratide.xest;

import com.auroratide.xest.assert.Assertion;
import com.auroratide.xest.run.Example;
import com.auroratide.xest.run.ExampleGroup;

using Lambda;

class Xest {
  private var __group:ExampleGroup = new ExampleGroup("");

  private final function run() {
    __group.run();
  }

  private final function example(name:String, f:() -> Void) {
    __group.examples.push(new Example(name, f));
  }

  private final function describe(name:String, f:() -> Void) {
    final formerGroup = __group;
    __group = new ExampleGroup(name);

    f();

    formerGroup.groups.push(__group);
    __group = formerGroup;
  }

  private final function beforeEach(f:() -> Void) {
    __group.beforeEach(f);
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