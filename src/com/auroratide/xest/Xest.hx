package com.auroratide.xest;

import com.auroratide.xest.assert.Assertion;
import com.auroratide.xest.run.Example;
import com.auroratide.xest.run.ExampleGroup;
import com.auroratide.xest.run.Reporter;

using Lambda;
using Type;

class Xest {
  private var __group:ExampleGroup = new ExampleGroup("");

  private final function run(reporter:Reporter) {
    final classpath = this.getClass().getClassName().split(".");
    __group.name = classpath[classpath.length - 1];
    reporter.report(__group.run());
  }

  private final function example(name:String, f:() -> Void) {
    __group.example(new Example(name, f));
  }

  private final function describe(name:String, f:() -> Void) {
    final formerGroup = __group;
    __group = new ExampleGroup(name);

    f();

    formerGroup.group(__group);
    __group = formerGroup;
  }

  private final function beforeEach(f:() -> Void) {
    __group.hook(BeforeEach(f));
  }

  private final function afterEach(f:() -> Void) {
    __group.hook(AfterEach(f));
  }

  private final function assert<T>(actual:T):Assertion<T> {
    return new Assertion<T>(actual);
  }

  private final inline function it(name:String, f:() -> Void)
    example(name, f);

  private final inline function test(name:String, f:() -> Void)
    example(name, f);

  public static function start(suites:Array<Xest>) {
    final reporter = new Reporter();
    suites.iter(s -> s.run(reporter));
  }
}