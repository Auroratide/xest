package com.auroratide.xest;

using Lambda;

class Xest {

  public function run() {}

  private final function example(name:String, f:() -> Void) {
    f();
  }

  public static function start(suites:Array<Xest>) {
    suites.iter(s -> s.run());
  }
}