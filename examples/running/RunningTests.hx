package examples.running;

import com.auroratide.xest.Xest;

class RunningTests extends Xest {
  public function new() {
    example("how to create a test", () -> {
      expect(true);
    });

    describe("Aliases", () -> {
      it("allows 'it' to define tests also", () -> {
        expect(true);
      });

      test("allows 'test' to define tests also", () -> {
        expect(true);
      });
    });
  }
}