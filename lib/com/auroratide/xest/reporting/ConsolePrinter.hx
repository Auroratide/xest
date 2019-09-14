package com.auroratide.xest.reporting;

import com.auroratide.xest.run.Timer.Milliseconds;

using StringTools;

class ConsolePrinter implements Printer {
  private static inline final bold = "\u001B[1m";
  private static inline final green = "\u001B[32m";
  private static inline final red = "\u001B[31m";
  private static inline final yellow = "\u001B[33m";
  private static inline final grey = "\u001B[90m";
  private static inline final terminal = "\u001B[0m";

  public function new() {}

  public function print(s:String):Printer {
    Sys.print(s);
    return this;
  }

  public function title(s:String = ""):Printer {
    Sys.print('$bold$s');
    return this;
  }

  public function time(t:Milliseconds):Printer {
    Sys.print(t >= 0.1 ? ' ($t)' : '');
    return this;
  }

  public function success(s:String = ""):Printer {
    Sys.print('$green$s');
    return this;
  }

  public function failure(s:String = ""):Printer {
    Sys.print('$red$s');
    return this;
  }

  public function warning(s:String = ""):Printer {
    Sys.print('$yellow$s');
    return this;
  }

  public function quiet(s:String = ""):Printer {
    Sys.print('$grey$s');
    return this;
  }

  public function newline():Printer {
    Sys.print("\n");
    return this;
  }

  public function pad(spaces:Int):Printer {
    Sys.print("".rpad(" ", spaces));
    return this;
  }

  public function end() {
    Sys.print('$terminal\n');
  }
}