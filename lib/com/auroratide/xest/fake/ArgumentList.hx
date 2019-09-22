package com.auroratide.xest.fake;

using Lambda;

@:forward(length)
abstract ArgumentList(Array<Dynamic>) from Array<Dynamic> to Array<Dynamic> {
  @:op(A == B) @:commutative
  public function equals(other:ArgumentList):Bool {
    return this.length == other.length
      && this.mapi((index, item) -> item == other[index]).foreach(equal -> equal);
  }
}