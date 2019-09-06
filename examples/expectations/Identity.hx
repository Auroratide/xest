package expectations;

import com.auroratide.xest.Xest;
import common.Circle;
import common.Complex;
import common.Direction;

class Identity extends Xest {
  public function new() {
    example("primitives", () -> {
      expect(1).to.be(1);
      expect(true).to.be(true);
      expect(5.6).to.be(5.6);
    });

    example("strings", () -> {
      expect("Xest").to.be("Xest");
    });

    example("instances", () -> {
      final circle = new Circle(5);
      expect(circle).to.be(circle);
    });

    example("abstracts", () -> {
      final n = new Complex(1, 2);
      expect(n).to.be(n);
    });

    example("functions", () -> {
      final sum = (a, b) -> a + b;
      expect(sum).to.be(sum);
    });

    example("enums", () -> {
      expect(North).to.be(North);
    });

    example("null", () -> {
      expect(null).to.be(null);
    });
  }
}
