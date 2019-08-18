package ;

import com.auroratide.xest.Xest.start;

using Lambda;

class Main {
  public static function main() {
    testTheTestRunner();

    start([
      new Assertions()
    ]);
  }

  private static function testTheTestRunner() {
    final test = new RunningTests();

    start([ test ]);

    if(!test.itRan.foreach(b -> b))
      throw 'Expected all tests in RunningTests to run, but they did not: ${test.itRan}';
  }
}