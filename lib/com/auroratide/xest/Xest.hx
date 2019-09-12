package com.auroratide.xest;

import haxe.macro.Expr;
import haxe.macro.Context;
import com.auroratide.xest.expect.Expectation;
import com.auroratide.xest.run.Test;
import com.auroratide.xest.run.Group;
import com.auroratide.xest.run.Skipped;
import com.auroratide.xest.run.TestProvider;
import com.auroratide.xest.run.Reporter;

using Lambda;
using Type;

@:autoBuild(com.auroratide.xest.Registrar.register())
class Xest implements TestProvider {
  public static function main() {
    Type.createEmptyInstance(Type.resolveClass("com.auroratide.xest.Runner")).run();
  }

  private var __group:Group = new Group("");

  private var skip(get, never):TestProvider;
  private var ignore(get, never):TestProvider;
  private var disable(get, never):TestProvider;

  private final function run(reporter:Reporter) {
    final classpath = this.getClass().getClassName().split(".");
    __group.name = classpath[classpath.length - 1];
    reporter.report(__group.run());
  }

  public final function example(name:String, f:() -> Void) {
    __group.example(new Test(name, f));
  }

  private final function describe(name:String, f:() -> Void) {
    final formerGroup = __group;
    __group = new Group(name);

    f();

    formerGroup.group(__group);
    __group = formerGroup;
  }

  private final function before(f:() -> Void) {
    __group.hook(BeforeEach(f));
  }

  private final function after(f:() -> Void) {
    __group.hook(AfterEach(f));
  }

  private final macro function expect(context, e:Expectation):Expr {
    return e.evaluate();
  }

  public final inline function it(name:String, f:() -> Void)
    example(name, f);

  public final inline function test(name:String, f:() -> Void)
    example(name, f);

  private final function beforeEach(f:() -> Void)
    before(f);
  
  private final function afterEach(f:() -> Void)
    after(f);
  
  private final macro function assert(context, e:Expectation):Expr
    return macro expect($e);

  private final function get_skip():TestProvider {
    return new SkippingTestProvider(__group);
  }

  private final function get_ignore():TestProvider
    return skip;

  private final function get_disable():TestProvider
    return skip;

  public static function start(suites:Array<Xest>) {
    final reporter = new Reporter();
    suites.iter(s -> s.run(reporter));
  }
}

private class SkippingTestProvider implements TestProvider {
  private final group:Group;

  public function new(group:Group) {
    this.group = group;
  }

  public function example(name, f) {
    group.example(new Skipped(name, f));
  }

  public function it(name, f)
    return example(name, f);

  public function test(name, f)
    return example(name, f);
}