package com.auroratide.xest.run;

using Lambda;

final class ExampleGroup {
  public final name:String;
  public final groups:Array<ExampleGroup> = [];
  public final examples:Array<Example> = [];
  private var beforeHooks:Array<() -> Void> = [];

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

  public function beforeEach(f:() -> Void) {
    beforeHooks.push(f);
  }

  public function propogate() {
    groups.iter(g -> {
      g.beforeHooks = beforeHooks.concat(g.beforeHooks);
      g.propogate();
    });
  }
}