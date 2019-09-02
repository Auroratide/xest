package com.auroratide.xest.run;

using Lambda;
using StringTools;

class Reporter {
  public function new() {}

  public function report(set:ResultSet) {
    Sys.println("");
    reportWithSpaces(set, 0);
  }

  private function reportWithSpaces(set:ResultSet, spaces:Int) {
    Sys.println('${pad(spaces)}${title(set.message)}');
    set.results.iter(result -> switch(result) {
      case Success(message): Sys.println('${pad(spaces + 2)}${passed(message)}');
      case Failure(message): Sys.println('${pad(spaces + 2)}${failed(message)}');
    });
    set.sets.iter(s -> reportWithSpaces(s, spaces + 2));
  }

  private function pad(spaces:Int):String {
    return "".rpad(" ", spaces);
  }

  private function title(s:String):String
    return '\u001B[1m$s\u001B[0m';

  private function passed(s:String):String
    return '\u001B[32m✓\u001B[90m $s\u001B[0m';
  
  private function failed(s:String):String
    return '\u001B[31m✗ $s\u001B[0m';
}