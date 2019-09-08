package com.auroratide.xest.run;

using Lambda;
using StringTools;

class Reporter extends Printer {
  public function new() {
    super();
  }

  public function report(set:ResultSet) {
    newline.print();
    summary(set, 0);

    if(set.result.match(Failure(_, _))) {
      newline.print();
      newline.print();
      bold.red.print("*************************************");
      bold.red.print("Some tests failed:");
      bold.red.print("*************************************");
      newline.print();
      failures(set, 0);
    }
  }

  private function summary(set:ResultSet, spaces:Int) {
    pad(spaces).bold.print(set.name);
    set.results.iter(result -> switch(result) {
      case Success(name): pad(spaces + 2).passed.grey.print(name);
      case Skipped(name): pad(spaces + 2).skipped.yellow.print(name);
      case Failure(name): pad(spaces + 2).failed.red.print(name);
    });
    set.sets.iter(s -> summary(s, spaces + 2));
  }

  private function failures(set:ResultSet, spaces:Int) {
    if(set.result.match(Failure(_, _))) {
      pad(spaces).bold.red.print(set.name);
      set.results.iter(result -> switch(result) {
        case Failure(name, reason):
          pad(spaces + 2).failed.red.print(name);
          newline.print();
          '$reason'.split("\n").iter(s -> pad(spaces + 4).red.print(s));
          newline.print();
          newline.print();
        case _:
      });
      set.sets.iter(s -> failures(s, spaces + 2));
    }
  }
}

private class Printer {
  private final prepend:String;
  private final append:String;

  private var newline(get, never):Printer;
  private var bold(get, never):Printer;
  private var red(get, never):Printer;
  private var green(get, never):Printer;
  private var grey(get, never):Printer;
  private var yellow(get, never):Printer;
  private var passed(get, never):Printer;
  private var skipped(get, never):Printer;
  private var failed(get, never):Printer;

  public function new(prepend:String = "", append:String = "") {
    this.prepend = prepend;
    this.append = append;
  }

  private function print(?value:String) {
    Sys.println('$prepend${value != null ? value : ""}$append');
  }

  private function pad(spaces:Int):Printer {
    return new Printer(prepend + "".rpad(" ", spaces), append);
  }

  private function get_newline():Printer
    return new Printer(prepend, append);
  
  private function get_bold():Printer
    return new Printer('$prepend\u001B[1m', '\u001B[0m$append');

  private function get_red():Printer
    return new Printer('$prepend\u001B[31m', '\u001B[0m$append');

  private function get_green():Printer
    return new Printer('$prepend\u001B[32m', '\u001B[0m$append');

  private function get_grey():Printer
    return new Printer('$prepend\u001B[90m', '\u001B[0m$append');
  
  private function get_yellow():Printer
    return new Printer('$prepend\u001B[33m', '\u001B[0m$append');

  private function get_passed():Printer
    return new Printer('$prepend\u001B[32m✓\u001B[0m ', append);

  private function get_skipped():Printer
    return new Printer('$prepend\u001B[33m-\u001B[0m ', append);

  private function get_failed():Printer
    return new Printer('$prepend\u001B[31m✗\u001B[0m ', append);
}