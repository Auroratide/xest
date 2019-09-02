package running;

import com.auroratide.xest.Xest;

class Failures extends Xest {
  public final itRan = [ false, false ];

  public function new() {
    example("all tests run even if some fail", () -> {
      itRan[0] = true;
      throw 1;
    });

    example("this runs even if the previous test failed", () -> {
      itRan[1] = true;
      throw 1;
    });
  }
}