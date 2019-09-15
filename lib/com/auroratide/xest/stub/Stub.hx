package com.auroratide.xest.stub;

class Stub<T> {
  private final actions:Array<T> = [];

  public function new() {}

  public function next():T {
    return actions.shift();
  }

  public function with():OngoingStubbing<T> {
    return new OngoingStubbing<T>(actions);
  }
}