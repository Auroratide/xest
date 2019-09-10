package examples.running.hooks;

import com.auroratide.xest.Xest;

/**
  This example shows off how to teardown tests.

  Sometimes you have to safely clean up after tests are run, such as clearing
  a database or what have you. In such a case, you can declare an `after` block
  that is run after each test in its block.
 */
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