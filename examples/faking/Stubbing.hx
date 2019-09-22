package examples.faking;

import com.auroratide.xest.Xest;

class Stubbing extends Xest {
  public function new() {
    var sample:SampleClass;

    before(() -> {
      sample = fake(SampleClass);
    });

    example("stubbing methods", () -> {
      stub(sample.noArgs()).toReturn(2);
      stub(sample.oneArg(1)).toReturn(3);
      stub(sample.twoArgs(2, "xest")).toReturn(5);

      expect(sample.noArgs() == 2);
      expect(sample.oneArg(1) == 3);
      expect(sample.twoArgs(2, "xest") == 5);
    });

    example("null is returned when no stub is defined", () -> {      
      stub(sample.oneArg(1)).toReturn(2);

      expect(sample.noArgs() == null);
      expect(sample.oneArg(2) == null);
    });

    example("arguments can be used to identify which stub is returned", () -> {
      stub(sample.twoArgs(1, "xest")).toReturn(2);
      stub(sample.twoArgs(2, "xest")).toReturn(3);
      stub(sample.twoArgs(2, "is good")).toReturn(5);

      expect(sample.twoArgs(2, "is good") == 5);
      expect(sample.twoArgs(2, "xest") == 3);
      expect(sample.twoArgs(1, "xest") == 2);
    });
  }
}
