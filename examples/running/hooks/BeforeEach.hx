package examples.running.hooks;

import com.auroratide.xest.Xest;

/**
  This example shows off how to setup tests.

  It is often useful to have a method that sets up common structures for the
  other tests to use. Rather than duplicate that setup in each test, you can
  declare a `before` block which is guaranteed to run before each test in
  its block.
 */
class BeforeEach extends Xest {
  public function new() {
    var n = 0;

    before(() -> {
      n = 5;
    });

    example("n becomes 5 before each test", () -> {
      expect(n == 5);
      n = 0;
    });

    example("n becomes 5 before each test", () -> {
      expect(n == 5);
      n = 0;
    });


    describe("nested before block", () -> {
      var m = 0;

      before(() -> {
        m = 6;
      });

      example("m becomes 6 before each test", () -> {
        expect(n + m == 11);
        n = 0;
        m = 0;
      });

      example("m becomes 6 before each test", () -> {
        expect(n + m == 11);
        n = 0;
        m = 0;
      });
    });


    describe("declaration order does not matter", () -> {
      var m = 0;

      describe("...", () -> {
        example("m becomes 6 before each test", () -> {
          expect(n + m == 11);
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