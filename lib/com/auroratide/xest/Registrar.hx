package com.auroratide.xest;

import haxe.macro.Expr;
import haxe.macro.Context;

using Lambda;

final class Registrar {
  private static inline final RUNNER_PACKAGE = "com.auroratide.xest";
  private static inline final RUNNER_CLASS = "Runner";

  private static var runnerRegistered = false;
  private static var runnerBuilt = false;
  private static final classes:Array<haxe.macro.Type> = [];

  public static macro function register():Array<Field> {
    if(!runnerRegistered) {
      Context.onAfterTyping(arr -> buildRunner());
      runnerRegistered = true;
    }

    classes.push(Context.getLocalType());
    return Context.getBuildFields();
  }

  public static function runner() {
    return Type.createEmptyInstance(Type.resolveClass('$RUNNER_PACKAGE.$RUNNER_CLASS'));
  }

  private static inline function buildRunner() {
    if(!runnerBuilt) {
      Context.defineType({
        name: RUNNER_CLASS,
        pack: RUNNER_PACKAGE.split('.'),
        kind: TDClass(null, [], false),
        pos: Context.currentPos(),
        fields: [runField()]
      });

      runnerBuilt = true;
    }
  }

  private static inline function runField():Field {
    return {
      name: "run",
      access: [APublic],
      pos: Context.currentPos(),
      kind: FFun({
        args: [],
        ret: macro:Void,
        expr: runFunction()
      }),
    };
  }

  private static inline function runFunction():Expr {
    final block = [];
    block.push(macro final reporter = new com.auroratide.xest.reporting.Reporter(new com.auroratide.xest.reporting.ConsolePrinter()));
    block.push(macro final results = []);
    classes.iter(c -> switch(c) {
      case TInst(ref, _):
        block.push(macro results.push(Type.createInstance(Type.resolveClass($v{ref.toString()}), []).run()));
        block.push(macro reporter.report(results[results.length - 1]));
      case _:
        block.push(macro null); // do nothing
    });

    block.push(macro final overallResult = new com.auroratide.xest.run.ResultSet("", [], results));
    block.push(macro reporter.summary(overallResult));
    block.push(macro if(overallResult.result.match(com.auroratide.xest.run.Result.Failure())) Sys.exit(1));

    return macro $b{block};
  }
}