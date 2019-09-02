package ;

import com.auroratide.xest.Xest.start;

class FailMain {
  public static function main() {
    start([
      new failures.Failures()
    ]);
  }
}
