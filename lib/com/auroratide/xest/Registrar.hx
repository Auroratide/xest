package com.auroratide.xest;

import haxe.macro.Expr;
import haxe.macro.Context;

using Lambda;

class Registrar {
  private static inline final RUNNER_PACKAGE = "com.auroratide.xest";
  private static inline final RUNNER_CLASS = "Runner";

  private static var runnerRegistered = false;
  private static var runnerBuilt = false;
  private static final classes:Array<haxe.macro.Type> = [];

  public static macro function register():Array<Field> {
    if(!runnerRegistered) {
      Context.onAfterTyping(arr -> {
        if(!runnerBuilt) {
          Context.defineType({
            name: RUNNER_CLASS,
            pack: RUNNER_PACKAGE.split("."),
            fields: [{
              name: "run",
              access: [APublic],
              kind: FFun({
                args: [],
                ret: macro:Void,
                expr: {
                  expr: EBlock([
                    macro final reporter = new com.auroratide.xest.reporting.Reporter(new com.auroratide.xest.reporting.Printer())
                  ].concat(classes.map(c -> switch(c) {
                    case TInst(ref, _):
                      final className = {
                        expr: EConst(CString(ref.toString())),
                        pos: Context.currentPos()
                      };
                      macro Type.createInstance(Type.resolveClass($className), []).run(reporter);
                    case _:
                      macro null; // do nothing
                  })).concat([
                    macro reporter.summary()
                  ])),
                  pos: Context.currentPos()
                }
              }),
              pos: Context.currentPos()
            }],
            kind: TDClass(null, [], false),
            pos: Context.currentPos()
          });

          runnerBuilt = true;
        }
      });

      runnerRegistered = true;
    }

    classes.push(Context.getLocalType());
    return Context.getBuildFields();
  }

  public static function runner() {
    return Type.createEmptyInstance(Type.resolveClass('$RUNNER_PACKAGE.$RUNNER_CLASS'));
  }
}