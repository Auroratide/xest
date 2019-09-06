package common;

class Circle {
  public final radius:Int;

  public function new(radius:Int) {
    this.radius = radius;
  }

  public function equals(other:Circle):Bool {
    return this.radius == other.radius;
  }
}