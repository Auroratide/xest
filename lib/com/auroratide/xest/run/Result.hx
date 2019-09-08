package com.auroratide.xest.run;

enum Result {
  Success(?name:String);
  Failure(?name:String, ?reason:Dynamic);
  Skipped(?name:String);
}