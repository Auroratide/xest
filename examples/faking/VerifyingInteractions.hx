package examples.faking;

import com.auroratide.xest.Xest;
import com.auroratide.xest.fake.Fake;
import com.auroratide.xest.fake.Proxy;
import com.auroratide.xest.verify.VerificationFailure;

class VerifyingInteractions extends Xest {
  public function new() {
    example("verifying a method with no arguments", () -> {
      final sample = new SampleClassFake();

      sample.noArgs();

      verify(sample.noArgs()).wasCalled();
    });

    example("fails verification when the call did not happen", () -> {
      final sample = new SampleClassFake();

      try {
        verify(sample.noArgs()).wasCalled();
        throw "Should have failed verification, but it did not.";
      } catch(e:VerificationFailure) {}
    });
  }
}

private class SampleClassFake extends SampleClass implements Fake {
  public final xest:Proxy = new Proxy();

  public function new() super();

  override public function noArgs():Int {
    return xest.call("noArgs");
  }
}