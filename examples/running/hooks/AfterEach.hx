package running.hooks;

import com.auroratide.xest.Xest;

class AfterEach extends Xest {
  public function new() {
    var n = 5;

    after(() -> {
      n = 5;
    });

    example("n becomes 5 after each test", () -> {
      expect(n == 5);
      n = 0;
    });

    example("n becomes 5 after each test", () -> {
      expect(n == 5);
      n = 0;
    });


    describe("nested after block", () -> {
      var m = 6;

      after(() -> {
        m = 6;
      });

      example("m becomes 6 after each test", () -> {
        expect(n + m == 11);
        n = 0;
        m = 0;
      });

      example("m becomes 6 after each test", () -> {
        expect(n + m == 11);
        n = 0;
        m = 0;
      });
    });


    describe("declaration order does not matter", () -> {
      var m = 6;

      describe("...", () -> {
        example("m becomes 6 after each test", () -> {
          expect(n + m == 11);
          n = 0;
          m = 0;
        });

        example("m becomes 6 after each test", () -> {
          expect(n + m == 11);
          n = 0;
          m = 0;
        });
      });

      after(() -> {
        m = 6;
      });
    });
  }
}