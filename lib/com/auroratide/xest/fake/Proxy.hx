package com.auroratide.xest.fake;

import com.auroratide.xest.stub.Stubs;

class Proxy {
  public final stubs:Stubs = new Stubs();

  public function new() {}

  public function call<T>(method:String):T {
    return stubs.get(method).next();
  }
}