package ;

import com.auroratide.xest.Xest.start;

using Lambda;

class Main {
  public static function main() {
    testTheTestRunner();

    start([
      new assertions.Assertions(),
      new running.hooks.BeforeEach(),
      new running.hooks.AfterEach()
    ]);
  }

  private static function testTheTestRunner() {
    final test = new running.RunningTests();

    start([ test ]);

    if(!test.itRan.foreach(b -> b))
      throw 'Expected all tests in RunningTests to run, but they did not: ${test.itRan}';
  }

}