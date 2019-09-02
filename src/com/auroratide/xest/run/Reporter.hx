package com.auroratide.xest.run;

using Lambda;
using StringTools;

class Reporter {
  public function new() {}

  public function report(set:ResultSet) {
    Sys.println("");
    summary(set, 0);

    if(set.result.match(Failure(_, _))) {
      Sys.println("");
      Sys.println(red("Some tests failed:"));
      Sys.println("");
      failures(set, 0);
    }
  }

  private function summary(set:ResultSet, spaces:Int) {
    Sys.println('${pad(spaces)}${title(set.name)}');
    set.results.iter(result -> switch(result) {
      case Success(name): Sys.println('${pad(spaces + 2)}${passed(name)}');
      case Failure(name): Sys.println('${pad(spaces + 2)}${failed(name)}');
    });
    set.sets.iter(s -> summary(s, spaces + 2));
  }

  private function failures(set:ResultSet, spaces:Int) {
    Sys.println('${pad(spaces)}${red(title(set.name))}');
    set.results.iter(result -> switch(result) {
      case Failure(name, reason):
        Sys.println('${pad(spaces + 2)}${failed(name)}');
        Sys.println("");
        Sys.println('${pad(spaces + 4)}${red(reason)}');
        Sys.println("");
        Sys.println("");
      case _:
    });
    set.sets.iter(s -> failures(s, spaces + 2));
  }

  private function pad(spaces:Int):String {
    return "".rpad(" ", spaces);
  }

  private function title(s:String):String
    return '\u001B[1m$s\u001B[0m';

  private function passed(s:String):String
    return '\u001B[32m✓\u001B[90m $s\u001B[0m';
  
  private function failed(s:String):String
    return red('✗ $s');
  
  private function red(s:String):String
    return '\u001B[31m$s\u001B[0m';
}