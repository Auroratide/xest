package examples.reporting;

import com.auroratide.xest.reporting.Printer;
import com.auroratide.xest.reporting.Reporter;
import com.auroratide.xest.Xest;
import com.auroratide.xest.run.Timer.Milliseconds;

/**
  This example shows what information is reported.

  By default, the test runner will report results to the console. It includes
  a summary as well as some details for any tests that failed.
 */
class Reporting extends Xest {
  public function new() {
    var printer:StringPrinter;
    var reporter:Reporter;
    var suite:SampleTestSuite;

    before(() -> {
      printer = new StringPrinter();
      reporter = new Reporter(printer);
      suite = new SampleTestSuite(new XestProxy());
    });

    example("it reports summary stats", () -> {
      suite.run(reporter);
      reporter.summary();

      expect(printer.contains("Total tests: 3"));
      expect(printer.contains("Passed : 1"));
      expect(printer.contains("Failed : 1"));
      expect(printer.contains("Skipped: 1"));
    });

    example("it reports test failures", () -> {
      suite.run(reporter);
      reporter.summary();

      expect(printer.contains("Expected 1 to equal 2"));
      expect(printer.contains("Called from expectation"));
    });
  }
}

/* ========================================================================= */

private class XestProxy extends Xest {
  public function new() {}
}

private class SampleTestSuite {
  private final xest:Xest;

  public function new(xest:Xest) {
    this.xest = xest;

    xest.example("passes", () -> {
      xest.expect(1 == 1);
    });

    xest.example("fails", () -> {
      xest.expect(1 == 2);
    });

    xest.skip.example("skipped", () -> {
      xest.expect(1 == 1);
    });
  }

  public function run(reporter:Reporter) {
    xest.run(reporter);
  }
}

private class StringPrinter implements Printer {
  private final contents = new StringBuf();

  public function new() {}

  public function contains(s:String):Bool {
    return contents.toString().indexOf(s) >= 0;
  }

  public function print(s:String):Printer {
    contents.add(s);
    return this;
  }

  public function title(s:String = ""):Printer {
    contents.add(s);
    return this;
  }

  public function time(t:Milliseconds):Printer {
    return this;
  }

  public function success(s:String = ""):Printer {
    contents.add(s);
    return this;
  }

  public function failure(s:String = ""):Printer {
    contents.add(s);
    return this;
  }

  public function warning(s:String = ""):Printer {
    contents.add(s);
    return this;
  }

  public function quiet(s:String = ""):Printer {
    contents.add(s);
    return this;
  }

  public function newline():Printer {
    return this;
  }

  public function pad(spaces:Int):Printer {
    return this;
  }

  public function end() {}
}