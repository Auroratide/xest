package com.auroratide.xest.run;

final class Example {
  public final name:String;
  private final test:() -> Void;

  public function new(name:String, test:() -> Void) {
    this.name = name;
    this.test = test;
  }

  public function run() {
    try {
        test();
        Sys.println('\u001B[32m✓\u001B[0m $name');
      } catch(e:Dynamic) {
        Sys.println('\u001B[31m✗ $name\u001B[0m');
      }
  }
}