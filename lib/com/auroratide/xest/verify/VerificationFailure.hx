package com.auroratide.xest.verify;

class VerificationFailure {
  private final message:String;

  public function new(message:String) {
    this.message = message;
  }

  public function toString():String {
    return message;
  }
}