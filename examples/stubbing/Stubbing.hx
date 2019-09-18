package examples.stubbing;

import com.auroratide.xest.Xest;
import com.auroratide.xest.fake.Fake;
import com.auroratide.xest.fake.Proxy;

class Stubbing extends Xest {
  public function new() {
    example("stubbing a method with no arguments", () -> {
      final sample = new SampleClassFake();

      stub(sample.noArgs()).toReturn(2);

      expect(sample.noArgs() == 2);
    });
  }
}

private class SampleClassFake extends examples.stubbing.SampleClass implements Fake {
  public final xest:Proxy = new Proxy();

  public function new() super();

  override public function noArgs():Int {
    return xest.call("noArgs");
  }
}