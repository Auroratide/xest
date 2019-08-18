package ;

import com.auroratide.xest.Xest;

class RunningTests extends Xest {
  public function new() {}

  override function run() {
    var itRan = false;

    example("how to create a test", () -> {
      itRan = true;
    });

    if(!itRan)
      throw "The example did not run, and that's bad.";
  }
}