package expectations;

import com.auroratide.xest.Xest;

class Expectations extends Xest {
  public function new() {
    example("equality", () -> {
      expect(1 + 1 == 2);
      expect("Xest" == "Xest");
    });

    example("inequality", () -> {
      expect(1 + 1 != 3);
      expect("Xest" != "bad");
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
