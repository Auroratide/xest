package com.auroratide.xest.stub;

class OngoingStubbing<T> {
  private final actions:Array<T>;

  public function new(actions:Array<T>) {
    this.actions = actions;
  }

  public function toReturn(r:T):OngoingStubbing<T> {
    actions.push(r);
    return this;
  }
}