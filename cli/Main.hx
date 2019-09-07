package ;

import com.auroratide.xest.Cli;
import com.auroratide.xest.SysLogger;

class Main {
  public static function main() {
    new Cli(new SysLogger()).run(Sys.args());
  }
}