package running.hooks;

import com.auroratide.xest.Xest;

class BeforeEach extends Xest {
  public function new() {
    var n = 0;

    before(() -> {
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

      before(() -> {
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


    describe("declaration order does not matter", () -> {
      var m = 0;

      describe("...", () -> {
        example("m becomes 6 before each test", () -> {
          assert(n + m).is(11);
          n = 0;
          m = 0;
        });
      });

      before(() -> {
        m = 6;
      });
    });
  }
}