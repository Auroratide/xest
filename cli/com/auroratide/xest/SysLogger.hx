package com.auroratide.xest;

class SysLogger implements Logger {
  public function new() {}

  public function info(s:String) {
    Sys.println(s);
  }
}