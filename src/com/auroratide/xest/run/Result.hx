package com.auroratide.xest.run;

enum Result {
  Success(?message:String);
  Failure(?message:String);
}