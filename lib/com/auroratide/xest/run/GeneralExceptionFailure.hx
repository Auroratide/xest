package com.auroratide.xest.run;

import haxe.CallStack;

class GeneralExceptionFailure {
  private final cause:Dynamic;
  private final stack:Array<StackItem>;

  public function new(cause:Dynamic, stack:Array<StackItem>) {
    this.cause = cause;
    this.stack = stack;
  }

  public function toString():String {
    return '$cause\n${CallStack.toString(stack)}';
  }
}