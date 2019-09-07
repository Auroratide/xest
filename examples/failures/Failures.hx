package failures;

import com.auroratide.xest.Xest;

class Failures extends Xest {
  public function new() {
    example("general exception thrown", () -> {
      throw "An exception was thrown";
    });

    example("equality failure", () -> {
      var x = 2;
      expect(2 + x == 5);
    });

    example("truth failure", () -> {
      expect(false);
    });
  }
}
