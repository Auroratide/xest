package ;

import com.auroratide.xest.Xest.start;

class Main {
  public static function main() {
    start([
      new running.RunningTests(),
      new assertions.Assertions(),
      new running.hooks.BeforeEach(),
      new running.hooks.AfterEach()
    ]);
  }
}