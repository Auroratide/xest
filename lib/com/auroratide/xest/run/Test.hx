package com.auroratide.xest.run;

import haxe.CallStack;
import com.auroratide.xest.expect.ExpectationFailure;

class Test {
  public final name:String;
  private final test:() -> Void;

  public function new(name:String, test:() -> Void) {
    this.name = name;
    this.test = test;
  }

  public function run():Result {
    return try {
      final time = Timer.millis(test);
      Success(name, time);
    } catch(e:ExpectationFailure) {
      Failure(name, e);
    } catch(e:Dynamic) {
      Failure(name, new TestFailure(e, CallStack.exceptionStack()));
    }
  }
}