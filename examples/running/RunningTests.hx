package running;

import com.auroratide.xest.Xest;

class RunningTests extends Xest {
  public function new() {
    example("how to create a test", () -> {
      assert(true).is(true);
    });

    describe("Aliases", () -> {
      it("allows 'it' to define tests also", () -> {
        assert(true).is(true);
      });

      test("allows 'test' to define tests also", () -> {
        assert(true).is(true);
      });
    });
  }
}