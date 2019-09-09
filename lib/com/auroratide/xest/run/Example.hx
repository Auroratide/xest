package com.auroratide.xest.run;

class Example {
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
    } catch(e:Dynamic) {
      Failure(name, e);
    }
  }
}