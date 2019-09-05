package expectations;

import com.auroratide.xest.Xest;

class Expectations extends Xest {
  public function new() {
    example("asserting two primitives are the same", () -> {
      expect(1).to.be(1);
    });

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