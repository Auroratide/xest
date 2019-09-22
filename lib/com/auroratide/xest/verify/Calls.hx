package com.auroratide.xest.verify;

import com.auroratide.xest.fake.ArgumentList;

class Calls {
  private final methods:Map<String, Array<ArgumentList>> = [];

  public function new() {}

  public function record(method:String, args:ArgumentList) {
    if(!methods.exists(method))
      methods[method] = [];
    methods[method].push(args);
  }

  public function timesCalled(method:String, args:ArgumentList):Int {
    return methods.exists(method) ? methods[method].filter(a -> a == args).length : 0;
  }
}