package com.auroratide.xest.verify;

class Calls {
  private final methods:Map<String, Int> = [];

  public function new() {}

  public function record(method:String) {
    if(!methods.exists(method))
      methods[method] = 0;
    methods[method] += 1;
  }

  public function timesCalled(method:String):Int {
    return methods.exists(method) ? methods[method] : 0;
  }
}