package com.auroratide.xest;

import haxe.macro.Expr;
import com.auroratide.xest.run.Example;
import com.auroratide.xest.run.ExampleGroup;
import com.auroratide.xest.run.Reporter;

using haxe.macro.Tools;

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

  private final function before(f:() -> Void) {
    __group.hook(BeforeEach(f));
  }

  private final function after(f:() -> Void) {
    __group.hook(AfterEach(f));
  }

  private macro function expect(context, e:ExprOf<Bool>):Expr {
    return switch(e.expr) {
      case EBinop(OpEq, lhs, rhs):
        macro if(!$e) throw 'Expected ${lhs.toString()} to equal ${rhs.toString()}';
      case _:
        macro if(!$e) throw 'Expected ${e.toString()} to be true';
    }
  }

  private final inline function it(name:String, f:() -> Void)
    example(name, f);

  private final inline function test(name:String, f:() -> Void)
    example(name, f);

  private final function beforeEach(f:() -> Void)
    before(f);
  
  private final function afterEach(f:() -> Void)
    after(f);

  public static function start(suites:Array<Xest>) {
    final reporter = new Reporter();
    suites.iter(s -> s.run(reporter));
  }
}