package examples.faking;

class SampleClass {
  private final someField:Float;

  public function new(someField:Float) {
    this.someField = someField;
  }

  public function voidMethod():Void {}

  public function noArgs():Int {
    return 1;
  }

  public function withArgs(n:Int, s:String):Int {
    return n + s.length;
  }

  private function privateFunction():Int {
    return 1;
  }
}