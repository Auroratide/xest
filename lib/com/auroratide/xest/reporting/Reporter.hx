package com.auroratide.xest.reporting;

import com.auroratide.xest.run.ResultSet;

using Lambda;
using com.auroratide.xest.reporting.Reporter.PrinterExtensions;

class Reporter {
  private final printer:Printer;

  public function new(printer:Printer) {
    this.printer = printer;
  }

  public function report(set:ResultSet) {
    printer.newline();
    printer.set(set);
  }

  public function summary(set:ResultSet) {
    printer.newline().title("-------------------------------------------------------------------------------").newline().end();
    printer.failures(set, -2);
    printer.stats(set);

    printer.newline();
  }
}

class PrinterExtensions {
  public static function set(printer:Printer, set:ResultSet, spaces:Int = 0) {
    printer.pad(spaces).title(set.name).time(set.time).end();
    set.results.iter(result -> switch(result) {
      case Success(name, time): printer.pad(spaces + 2).success("✓ ").quiet(name).time(time).end();
      case Skipped(name): printer.pad(spaces + 2).warning("- ").print(name).end();
      case Failure(name): printer.pad(spaces + 2).failure("✗ ").print(name).end();
    });

    set.sets.iter(s -> printer.set(s, spaces + 2));
  }

  public static function failures(printer:Printer, set:ResultSet, spaces:Int = 0) {
    if(set.result.match(Failure())) {
      printer.pad(spaces).title().failure(set.name).end();
      set.results.iter(result -> switch(result) {
        case Failure(name, reason):
          printer.pad(spaces + 2).failure('✗ $name').newline().end();
          '$reason'.split("\n").iter(s -> printer.pad(spaces + 4).failure(s).end());
          printer.newline().newline();
        case _:
      });

      set.sets.iter(s -> printer.failures(s, spaces + 2));
    }
  }

  public static function stats(printer:Printer, set:ResultSet) {
    final passed = set.count(Success());
    final failed = set.count(Failure());
    final skipped = set.count(Skipped());

    printer.title('Total tests: ${passed + failed + skipped}').time(set.time).end();
    if(passed > 0) printer.pad(2).success('✓ Passed : $passed').end();
    if(failed > 0) printer.pad(2).failure('✗ Failed : $failed').end();
    if(skipped > 0) printer.pad(2).warning('- Skipped: $skipped').end();

    printer.newline();

    if(failed > 0)
      printer.title().failure("Uh oh! Some tests failed. See the details above.").end();
    else
      printer.title().success("Nice! All tests passed!").end();
  }
}