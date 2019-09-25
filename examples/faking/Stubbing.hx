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
      stub(sample.withArgs(2, "xest")).toReturn(5);

      expect(sample.noArgs() == 2);
      expect(sample.withArgs(2, "xest") == 5);
    });

    example("null is returned when no stub is defined", () -> {      
      stub(sample.withArgs(1, "xest")).toReturn(2);

      expect(sample.noArgs() == null);
      expect(sample.withArgs(2, "xest") == null);
    });

    example("arguments can be used to identify which stub is returned", () -> {
      stub(sample.withArgs(1, "xest")).toReturn(2);
      stub(sample.withArgs(2, "xest")).toReturn(3);
      stub(sample.withArgs(2, "is good")).toReturn(5);

      expect(sample.withArgs(2, "is good") == 5);
      expect(sample.withArgs(2, "xest") == 3);
      expect(sample.withArgs(1, "xest") == 2);
    });

    example("stubbing works for interfaces", () -> {
      final implementation = fake(SampleInterface);

      stub(implementation.method(1)).toReturn("hello");

      expect(implementation.method(1) == "hello");
    });
  }
}
