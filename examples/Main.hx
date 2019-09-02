package ;

import com.auroratide.xest.Xest.start;

using Lambda;

class Main {
  public static function main() {
    testTheTestRunner();
    testFailures();

    start([
      new assertions.Assertions(),
      new running.hooks.BeforeEach()
    ]);
  }

  private static function testTheTestRunner() {
    final test = new running.RunningTests();

    start([ test ]);

    if(!test.itRan.foreach(b -> b))
      throw 'Expected all tests in RunningTests to run, but they did not: ${test.itRan}';
  }

  private static function testFailures() {
    final test = new running.Failures();

    try {
      start([ test ]);
    } catch(e:Dynamic) {}

    if(!test.itRan.foreach(b -> b))
      throw 'Expected all tests in Failures to run, but they did not: ${test.itRan}';
  }
}