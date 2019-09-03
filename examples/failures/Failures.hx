package failures;

import com.auroratide.xest.Xest;

class Failures extends Xest {
  public function new() {
    example("general exception thrown", () -> {
      throw "An exception was thrown";
    });

    example("identity failure", () -> {
      assert(1).is(2);
    });

    example("equality failure", () -> {
      assert(new Circle(1)).equals(new Circle(2));
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

  public function toString():String {
    return 'Circle($radius)';
  }
}