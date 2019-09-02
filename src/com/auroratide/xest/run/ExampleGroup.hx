package com.auroratide.xest.run;

using Lambda;

final class ExampleGroup {
  public var name:String;
  private final groups:Array<ExampleGroup> = [];
  private final examples:Array<Example> = [];
  private final hooks:Array<Hook> = [];

  public function new(name:String) {
    this.name = name;
  }

  public function run():ResultSet {
    final results = examples.map(example -> {
      hooks.iter(h -> switch(h) {
        case BeforeEach(f): f();
        case _:
      });

      final result = example.run();

      hooks.iter(h -> switch(h) {
        case AfterEach(f): f();
        case _:
      });

      return result;
    });

    final sets = groups.map(g -> g.run());
    
    return new ResultSet(name, results, sets);
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