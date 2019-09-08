package com.auroratide.xest.expect;

class Failure {
  public final message:String;

  public function new(message:String) {
    this.message = message;
  }

  public function toString():String {
    return message;
  }
}