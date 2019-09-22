package com.auroratide.xest.stub;

abstract ActionRegister<T>(Map<ArgumentList, Array<T>>) {
  public inline function new() this = [];

  @:op([])
  public function get(args:ArgumentList):Array<T> {
    final it = this.keys();
    var current;
    while(it.hasNext()) if((current = it.next()) == args)
      return this[current];
    return null;
  }

  public function create(args:ArgumentList):Array<T> {
    return this[args] = [];
  }

  public function exists(args:ArgumentList):Bool {
    final it = this.keys();
    while(it.hasNext()) if(it.next() == args)
      return true;
    return false;
  }
}