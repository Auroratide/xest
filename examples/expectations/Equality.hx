package expectations;

import com.auroratide.xest.Xest;
import common.Circle;

class Equality extends Xest {
  public function new() {
    example("asserting two objects are equal", () -> {
      expect(new Circle(2)).to.equal(new Circle(2));
    });
  }
}
