package ;

import com.auroratide.xest.Xest;
import com.auroratide.xest.Cli;
import com.auroratide.xest.Logger;

using Lambda;

class Examples extends Xest {
  public static function main() {
    Xest.start([new Examples()]);
  }

  public function new() {
    var logger:ListLogger;
    var cli:Cli;

    beforeEach(() -> {
      logger = new ListLogger();
      cli = new Cli(logger);
    });

    example("xest --version", () -> {
      cli.run(["--version"]);

      expect(logger.logged(Cli.VERSION));
    });
  }
}

private class ListLogger implements Logger {
  private final messages:Array<String> = [];

  public function new() {}

  public function info(s:String) {
    messages.push(s);
  }

  public function logged(message:String):Bool {
    return messages.exists(s -> s == message);
  }
}