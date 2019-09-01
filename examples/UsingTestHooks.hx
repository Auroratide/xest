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

      describe("nested before block", () -> {
        var m = 0;

        beforeEach(() -> {
          m = 6;
        });

        example("m becomes 6 before each test", () -> {
          assert(n + m).is(11);
          n = 0;
          m = 0;
        });

        example("m becomes 6 before each test", () -> {
          assert(n + m).is(11);
          n = 0;
          m = 0;
        });
      });
    });
  }
}