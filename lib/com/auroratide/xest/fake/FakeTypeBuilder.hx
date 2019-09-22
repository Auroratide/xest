package com.auroratide.xest.fake;

import haxe.macro.Expr;
import haxe.macro.Context;

using Lambda;
using haxe.macro.Tools;

class FakeTypeBuilder {
  private static final fakes:Array<String> = [];

  public static function define(c:haxe.macro.Type.ClassType):String {
    final id = '${c.pack.join(".")}.${c.name}_Fake';

    if(!fakes.exists(f -> f == id)) {
      final name = c.name;
      final pack = c.pack;
      final fields = c.fields.get().map(f -> {
        var ret;
        var args;
        switch(f.type) {
          case TFun(as, r):
            ret = r.toComplexType();
            args = as.map(a -> ({
              type: a.t.toComplexType(),
              opt: a.opt,
              name: a.name,
              meta: null,
              value: null
            }));
          case _: throw "idk what happened";
        };
        
        return {
          name: f.name,
          access: [APublic, AOverride],
          pos: f.pos,
          kind: FFun({
            ret: ret,
            args: args,
            expr: macro return xest.call($v{f.name})
          })
        };
      });

      Context.defineType({
        name: '${name}_Fake',
        pack: pack,
        kind: TDClass({ name: name, pack: pack }, [{ name: "Fake", pack: ["com", "auroratide", "xest", "fake"] }], false),
        pos: Context.currentPos(),
        fields: [ {
          name: "xest",
          access: [APublic, AFinal],
          pos: Context.currentPos(),
          kind: FVar(macro:com.auroratide.xest.fake.Proxy, macro new com.auroratide.xest.fake.Proxy())
        } ].concat(fields)
      });

      fakes.push(id);
    }

    return id;
  }
}