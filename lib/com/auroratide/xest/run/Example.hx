package com.auroratide.xest.run;

final class Example {
  public final name:String;
  private final test:() -> Void;

  public function new(name:String, test:() -> Void) {
    this.name = name;
    this.test = test;
  }

  public function run():Result {
    return try {
        test();
        Success(name);
      } catch(e:Dynamic) {
        Failure(name, e);
      }
  }
}