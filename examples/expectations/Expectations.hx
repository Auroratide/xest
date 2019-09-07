package expectations;

import com.auroratide.xest.Xest;

class Expectations extends Xest {
  public function new() {
    example("equality", () -> {
      expect(1 + 1 == 2);
      expect("Xest" == "Xest");
    });

    example("truth", () -> {
      expect(true);
    });
  }
}
