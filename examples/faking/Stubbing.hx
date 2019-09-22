package examples.faking;

import com.auroratide.xest.Xest;

class Stubbing extends Xest {
  public function new() {
    example("stubbing a method with no arguments", () -> {
      final sample = fake(SampleClass);

      stub(sample.noArgs()).toReturn(2);

      expect(sample.noArgs() == 2);
    });

    example("stubbing a method with one argument", () -> {
      final sample = fake(SampleClass);

      stub(sample.oneArg(1)).toReturn(2);

      expect(sample.oneArg(1) == 2);
    });
  }
}
