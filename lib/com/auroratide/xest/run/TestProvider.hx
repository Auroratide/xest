package com.auroratide.xest.run;

interface TestProvider {
  function example(name:String, f:() -> Void):Void;
  function it(name:String, f:() -> Void):Void;
  function test(name:String, f:() -> Void):Void;
}