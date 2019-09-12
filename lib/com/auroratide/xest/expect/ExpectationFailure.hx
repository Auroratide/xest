package com.auroratide.xest.expect;

class ExpectationFailure {
  private final message:String;
  private final file:String;
  private final line:Int;

  public function new(message:String, file:String, line:Int) {
    this.message = message;
    this.file = file;
    this.line = line;
  }

  public function toString():String {
    return '$message\n\nCalled from expectation ($file line $line)';
  }
}