package com.auroratide.xest.run;

class Skipped extends Test {
  override public function run():Result {
    return Skipped(name);
  }
}