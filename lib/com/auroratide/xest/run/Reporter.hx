package com.auroratide.xest.run;

import com.auroratide.xest.run.Timer.Milliseconds;
using Lambda;
using StringTools;

class Reporter extends Printer {
  private final sets:Array<ResultSet> = [];

  public function new() {
    super();
  }

  public function report(set:ResultSet) {
    sets.push(set);

    newline.print();
    setSummary(set, 0);
  }

  public function summary() {
    newline.print();
    bold.print("----------------------------------------");
    newline.print();

    final all = new ResultSet("", [], sets);

    failures(all, -2);

    bold.print('Total tests: ${all.count()}${showTime(all.time)}');
    pad(2).passed.green.print('Passed : ${all.count(Success())}');
    pad(2).failed.red.print('Failed : ${all.count(Failure())}');
    pad(2).skipped.yellow.print('Skipped: ${all.count(Skipped())}');
    newline.print();
  }

  private function setSummary(set:ResultSet, spaces:Int) {
    pad(spaces).bold.print('${set.name}${showTime(set.time)}');
    set.results.iter(result -> switch(result) {
      case Success(name, time): pad(spaces + 2).passed.grey.print('$name${showTime(time)}');
      case Skipped(name): pad(spaces + 2).skipped.yellow.print(name);
      case Failure(name): pad(spaces + 2).failed.red.print(name);
    });
    set.sets.iter(s -> setSummary(s, spaces + 2));
  }

  private function failures(set:ResultSet, spaces:Int) {
    if(set.result.match(Failure())) {
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

  private function showTime(time:Milliseconds):String {
    return time >= 0.1 ? ' ($time)' : '';
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