package ;

import com.auroratide.xest.Xest.start;

class Main {
  public static function main() {
    start([
      new running.RunningTests(),
      new expectations.Expectations(),
      new running.hooks.BeforeEach(),
      new running.hooks.AfterEach()
    ]);
  }
}