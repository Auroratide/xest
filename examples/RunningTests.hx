package ;

import com.auroratide.xest.Xest;

class RunningTests extends Xest {
  public final itRan = [ false, false, false ];

  public function new() {
    example("how to create a test", () -> {
      itRan[0] = true;
    });

    it("allows 'it' to define tests also", () -> {
      itRan[1] = true;
    });

    test("allows 'test' to define tests also", () -> {
      itRan[2] = true;
    });
  }
}