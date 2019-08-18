package ;

import com.auroratide.xest.Xest;

class Assertions extends Xest {
  public function new() {}

  override function run() {
    example("asserting two primitives are the same", () -> {
      assert(1).is(1);
      assert(true).is(true);
      assert(5.6).is(5.6);
    });
  }
}