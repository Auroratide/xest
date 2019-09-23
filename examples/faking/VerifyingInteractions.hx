package examples.faking;

import com.auroratide.xest.Xest;
import com.auroratide.xest.verify.VerificationFailure;

class VerifyingInteractions extends Xest {
  public function new() {
    var sample:SampleClass;

    before(() -> {
      sample = fake(SampleClass);
    });

    example("verifying methods", () -> {
      sample.voidMethod();
      sample.oneArg(1);
      sample.twoArgs(1, "xest");

      verify(sample.voidMethod()).wasCalled();
      verify(sample.oneArg(1)).wasCalled();
      verify(sample.twoArgs(1, "xest")).wasCalled();
    });

    example("verification fails when the call did not happen", () -> try {
      verify(sample.noArgs()).wasCalled();
      throw "Should have failed verification, but it did not.";
    } catch(e:VerificationFailure) {});

    example("verification depends on the arguments used", () -> try {
      sample.twoArgs(1, "xest");
      sample.twoArgs(2, "is good");

      verify(sample.twoArgs(1, "is good")).wasCalled();
      throw "Should have failed verification, but it did not.";
    } catch(e:VerificationFailure) {});

    example("verification works for interfaces", () -> {
      final implementation = fake(SampleInterface);

      implementation.method(1);

      verify(implementation.method(1)).wasCalled();
    });
  }
}
