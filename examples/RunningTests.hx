package ;

import com.auroratide.xest.Xest;

using Lambda;

class RunningTests extends Xest {
  public function new() {}

  override function run() {
    var itRan = [ false, false, false ];

    example("how to create a test", () -> {
      itRan[0] = true;
    });

    it("allows 'it' to define tests also", () -> {
      itRan[1] = true;
    });

    test("allows 'test' to define tests also", () -> {
      itRan[2] = true;
    });

    if(!itRan.foreach(b -> b))
      throw "The example did not run, and that's bad.";
  }
}