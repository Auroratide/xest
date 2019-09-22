package com.auroratide.xest.stub;

class Stub<T> {
  private final actions:ActionRegister<T> = new ActionRegister<T>();

  public function new() {}

  public function next(args:ArgumentList):T {
    final actionList = actions[args];
    return if(actionList == null || actionList.length == 0)
      null;
    else
      actionList.shift();
  }

  public function with(args:ArgumentList):OngoingStubbing<T> {
    if(!actions.exists(args))
      actions.create(args);
    return new OngoingStubbing<T>(actions[args]);
  }
}