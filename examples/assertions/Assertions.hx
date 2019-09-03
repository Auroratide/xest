package assertions;

import com.auroratide.xest.Xest;

class Assertions extends Xest {
  public function new() {
    example("asserting two primitives are the same", () -> {
      assert(1).is(1);
      assert(true).is(true);
      assert(5.6).is(5.6);
    });

    example("asserting two objects are equal", () -> {
      assert(new Circle(2)).equals(new Circle(2));
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