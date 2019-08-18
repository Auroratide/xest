package com.auroratide.xest.run;

final class ExampleGroup {
  public final name:String;
  public final groups:Array<ExampleGroup> = [];
  public final examples:Array<Example> = [];

  public function new(name:String) {
    this.name = name;
  }

  public function run() {
    for(example in examples)
      example.run();
    
    for(group in groups)
      group.run();
  }
}