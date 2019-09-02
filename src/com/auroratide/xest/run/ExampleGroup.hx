package com.auroratide.xest.run;

using Lambda;

final class ExampleGroup {
  public final name:String;
  private final groups:Array<ExampleGroup> = [];
  private final examples:Array<Example> = [];
  private final hooks:Array<Hook> = [];

  public function new(name:String) {
    this.name = name;
  }

  public function run() {
    for(example in examples) {
      hooks.iter(h -> switch(h) {
        case BeforeEach(f): f();
        case _:
      });
      example.run();
      hooks.iter(h -> switch(h) {
        case AfterEach(f): f();
        case _:
      });
    }
    
    for(group in groups) {
      group.run();
    }
  }

  public function example(value:Example) {
    examples.push(value);
  }

  public function group(value:ExampleGroup) {
    hooks.iter(h -> value.hook(h));
    groups.push(value);
  }

  public function hook(h:Hook) {
    hooks.push(h);
    groups.iter(g -> g.hook(h));
  }
}