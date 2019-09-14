package examples.running;

import com.auroratide.xest.Xest;

/**
  This example shows off how to write tests, including:

  - Declaring a test class
  - Writing a test (and aliases for doing so)
  - Grouping tests together
  - Skipping tests
 */

/**
  Declaring a test class!

  xest tests are declared by extending the Xest class. This provides a number
  of methods that allow you to declare tests, setup and teardowns, and
  expectations.
 */
class RunningTests extends Xest {
  public function new() {

    /**
      Writing a test!

      A test is declared with the `example` method. This allows you to provide
      a name for the test along with a callback that executes the test.
     */
    example("how to create a test", () -> {
      expect(true);
    });

    /**
      Grouping tests together!

      The `describe` method allows you to group related tests together. Simply
      provide it a name for the group and a callback that contains tests within
      it. Alternatively, you may use `context` or `scenario` as aliases.
     */
    describe("Aliases", () -> {

      /**
        Aliases!

        Tests can also be declared with `it` or `test`, as they may be more
        familiar than `example`.
       */
      it("allows 'it' to define tests also", () -> {
        expect(true);
      });

      test("allows 'test' to define tests also", () -> {
        expect(true);
      });

      context("allows 'context' to define a group also", () -> {
        example("", () -> expect(true));
      });

      scenario("allows 'scenario' to define a group also", () -> {
        example("", () -> expect(true));
      });
    });

    /**
      Skipping tests!

      You can skip a test by prepending it with `skip`. The test will not be
      run, but it will be reported in the end as being skipped to remind you
      to unskip it in the future.
     */
    describe("Skipping", () -> {
      skip.example("using skip", () -> {
        throw "Test should have been skipped, but it ran";
      });
    });
  }
}