package com.auroratide.xest.run;

using Lambda;

final class ExampleGroup {
  public final name:String;
  public final groups:Array<ExampleGroup> = [];
  public final examples:Array<Example> = [];
  public final beforeHooks:Array<() -> Void>;

  public function new(name:String, beforeHooks:Array<() -> Void>) {
    this.name = name;
    this.beforeHooks = beforeHooks;
  }

  public function run() {
    for(example in examples) {
      beforeHooks.iter(f -> f());
      example.run();
    }
    
    for(group in groups) {
      group.run();
    }
  }

  public function beforeEach(f:() -> Void) {
    beforeHooks.push(f);
  }
}