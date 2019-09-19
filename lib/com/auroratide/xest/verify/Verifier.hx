package com.auroratide.xest.verify;

class Verifier {
  private final calls:Calls;
  private final method:String;

  public function new(calls:Calls, method:String) {
    this.calls = calls;
    this.method = method;
  }

  public function wasCalled() {
    if(calls.timesCalled(method) == 0)
      throw new VerificationFailure('Expected a call to $method, but received none');
  }
}