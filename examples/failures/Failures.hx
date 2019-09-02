package failures;

import com.auroratide.xest.Xest;

class Failures extends Xest {
  public function new() {
    example("general exception thrown", () -> {
      throw "An exception was thrown";
    });

    example("assertion failure", () -> {
      assert(1).is(2);
    });
  }
}