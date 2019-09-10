package examples.expectations;

import com.auroratide.xest.Xest;

/**
  This example shows off how to declare expectations, including:

  - Declaring an equality
  - Declaring an inequality
  - Declaring true or false

  A lot of test frameworks provide assertions like `assertEquals`, or something
  like `expect(x).toEqual(5)`. In xest, we try to keep things simple and
  unified. At the end of the day, every assertion is either true or false, 
  passed or failed.

  Therefore, just about anything can be done with the `expect` method alone.
  Put any normal Haxe expression within `expect` that resolves to a `Bool` and
  xest will treat it like an assertion.
 */
class Expectations extends Xest {
  public function new() {
    example("equality", () -> {
      expect(1 + 1 == 2);
      expect("xest" == "xest");
    });

    example("inequality", () -> {
      expect(1 + 1 != 3);
      expect("xest" != "bad");
    });

    example("truth", () -> {
      expect(true);
    });

    describe("aliases", () -> {
      example("assert", () -> {
        assert(1 == 1);
      });
    });
  }
}
