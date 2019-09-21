package examples.faking;

import com.auroratide.xest.Xest;

class Stubbing extends Xest {
  public function new() {
    example("stubbing a method with no arguments", () -> {
      final sample = fake(SampleClass);

      stub(sample.noArgs()).toReturn(2);

      expect(sample.noArgs() == 2);
    });
  }
}
