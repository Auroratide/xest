package examples.faking;

class SampleClass {
  public function new() {}

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