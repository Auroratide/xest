package examples.faking;

import com.auroratide.xest.Xest;
import com.auroratide.xest.verify.VerificationFailure;

class VerifyingInteractions extends Xest {
  public function new() {
    var sample:SampleClass;

    before(() -> {
      sample = fake(SampleClass);
    });

    example("verifying a method with no arguments", () -> {
      sample.noArgs();

      verify(sample.noArgs()).wasCalled();
    });

    example("fails verification when the call did not happen", () -> try {
      verify(sample.noArgs()).wasCalled();
      throw "Should have failed verification, but it did not.";
    } catch(e:VerificationFailure) {});

    example("verifying a method with one argument", () -> {
      sample.oneArg(1);

      verify(sample.oneArg(1)).wasCalled();
    });
  }
}
