package ;

import com.auroratide.xest.Xest;

class UsingTestHooks extends Xest {
  public function new() {
    describe("Using beforeEach", () -> {
      var n = 0;

      beforeEach(() -> {
        n = 5;
      });

      example("n becomes 5 before each test", () -> {
        assert(n).is(5);
        n = 0;
      });

      example("n becomes 5 before each test", () -> {
        assert(n).is(5);
        n = 0;
      });
    });
  }
}