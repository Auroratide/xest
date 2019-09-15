package com.auroratide.xest.stub;

class Stubs {
  private final stubs:Map<String, Stub<Dynamic>> = [];

  public function new() {}

  public function get<T>(method:String):Stub<T> {
    if(!stubs.exists(method))
      stubs[method] = new Stub<T>();
    return cast stubs[method];
  }
}