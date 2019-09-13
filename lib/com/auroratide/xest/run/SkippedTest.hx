package com.auroratide.xest.run;

class SkippedTest extends Test {
  override public function run():Result {
    return Skipped(name);
  }
}