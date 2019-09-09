package com.auroratide.xest.run;

import com.auroratide.xest.run.Timer.Milliseconds;

enum Result {
  Success(?name:String, ?time:Milliseconds);
  Failure(?name:String, ?reason:Dynamic);
  Skipped(?name:String);
}