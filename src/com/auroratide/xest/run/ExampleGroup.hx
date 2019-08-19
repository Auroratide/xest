package com.auroratide.xest.run;

final class ExampleGroup {
  public final name:String;
  public final groups:Array<ExampleGroup> = [];
  public final examples:Array<Example> = [];
  private var beforeEachHook:() -> Void = () -> {};

  public function new(name:String) {
    this.name = name;
  }

  public function run() {
    for(example in examples) {
      beforeEachHook();
      example.run();
    }
    
    for(group in groups) {
      beforeEachHook();
      group.run();
    }
  }

  public function beforeEach(f:() -> Void) {
    beforeEachHook = f;
  }
}