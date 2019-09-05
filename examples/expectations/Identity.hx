package expectations;

import com.auroratide.xest.Xest;

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

    example("null", () -> {
      expect(null).to.be(null);
    });
  }
}

private class Circle {
  public final radius:Int;

  public function new(radius:Int) {
    this.radius = radius;
  }
}