package examples.reporting;

import com.auroratide.xest.reporting.Reporter;
import com.auroratide.xest.Xest;

/**
  This sample test suite is used by the Reporting test to demonstrate how the
  reporter prints out test results. Tests are not normally defined by providing
  xest to the constructor.
 */
class SampleTestSuite {
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