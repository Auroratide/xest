package common;

abstract Complex({ real:Float, imag: Float }) {
  public function new(real:Float, imag: Float) {
    this = { real: real, imag: imag };
  }
}
