package expectations;

import com.auroratide.xest.Xest;

class Equality extends Xest {
  public function new() {
    example("asserting two objects are equal", () -> {
      expect(new Circle(2)).to.equal(new Circle(2));
    });
  }
}

private class Circle {
  public final radius:Int;

  public function new(radius:Int) {
    this.radius = radius;
  }

  public function equals(other:Circle):Bool {
    return this.radius == other.radius;
  }
}