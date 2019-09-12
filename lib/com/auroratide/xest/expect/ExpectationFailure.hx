package com.auroratide.xest.expect;

class ExpectationFailure {
  public final message:String;

  public function new(message:String) {
    this.message = message;
  }

  public function toString():String {
    return message;
  }
}