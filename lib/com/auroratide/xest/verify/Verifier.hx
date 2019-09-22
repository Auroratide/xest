package com.auroratide.xest.verify;

import com.auroratide.xest.fake.ArgumentList;

class Verifier {
  private final calls:Calls;
  private final method:String;
  private final args:ArgumentList;

  public function new(calls:Calls, method:String, args:ArgumentList) {
    this.calls = calls;
    this.method = method;
    this.args = args;
  }

  public function wasCalled() {
    if(calls.timesCalled(method, args) == 0)
      throw new VerificationFailure('Expected a call to $method, but received none');
  }
}