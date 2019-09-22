package examples.faking;

import com.auroratide.xest.Xest;

class Stubbing extends Xest {
  public function new() {
    var sample:SampleClass;

    before(() -> {
      sample = fake(SampleClass);
    });

    example("stubbing a method with no arguments", () -> {
      stub(sample.noArgs()).toReturn(2);

      expect(sample.noArgs() == 2);
    });

    example("stubbing a method with one argument", () -> {
      stub(sample.oneArg(1)).toReturn(2);
      stub(sample.oneArg(2)).toReturn(3);

      expect(sample.oneArg(2) == 3);
      expect(sample.oneArg(1) == 2);
    });

    example("stubbing a method with multiple arguments", () -> {
      stub(sample.twoArgs(1, "xest")).toReturn(2);

      expect(sample.twoArgs(1, "xest") == 2);
    });
  }
}
