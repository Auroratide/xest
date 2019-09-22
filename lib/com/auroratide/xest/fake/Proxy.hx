package com.auroratide.xest.fake;

import com.auroratide.xest.stub.ArgumentList;
import com.auroratide.xest.stub.Stubs;
import com.auroratide.xest.verify.Calls;

class Proxy {
  public final stubs:Stubs = new Stubs();
  public final calls:Calls = new Calls();

  public function new() {}

  public function call<T>(method:String, args:ArgumentList):T {
    calls.record(method);
    return stubs.get(method).next(args);
  }
}