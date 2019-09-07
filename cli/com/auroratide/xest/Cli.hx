package com.auroratide.xest;

using Lambda;

class Cli {
  public static inline final VERSION = "0.1.0";

  private final logger:Logger;

  public function new(logger:Logger) {
    this.logger = logger;
  }

  public function run(args:Array<String>) {
    if(args.exists(s -> s == "--version")) {
      logger.info(VERSION);
    }
  }
}