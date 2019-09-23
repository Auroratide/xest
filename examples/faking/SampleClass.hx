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

  public function oneArg(n:Int):Int {
    return n;
  }

  public function twoArgs(n:Int, s:String):Int {
    return n + s.length;
  }
}