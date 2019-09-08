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

    describe("Skipping", () -> {
      skip.example("using skip", () -> {
        throw "Test should have been skipped, but it ran";
      });

      describe("Aliases", () -> {
        ignore.example("using ignore", () -> {
          throw "Test should have been skipped, but it ran";
        });

        disable.example("using disable", () -> {
          throw "Test should have been skipped, but it ran";
        });
      });
    });
  }
}