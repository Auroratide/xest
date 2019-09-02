package com.auroratide.xest.run;

using Lambda;

final class ExampleGroup {
  public final name:String;
  private final groups:Array<ExampleGroup> = [];
  private final examples:Array<Example> = [];
  private final beforeHooks:Array<() -> Void> = [];

  public function new(name:String) {
    this.name = name;
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

  public function example(value:Example) {
    examples.push(value);
  }

  public function group(value:ExampleGroup) {
    beforeHooks.iter(h -> value.beforeEach(h));
    groups.push(value);
  }

  public function beforeEach(f:() -> Void) {
    beforeHooks.push(f);
    groups.iter(g -> g.beforeEach(f));
  }
}