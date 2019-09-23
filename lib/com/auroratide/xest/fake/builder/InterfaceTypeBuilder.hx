package com.auroratide.xest.fake.builder;

import haxe.macro.Expr;
using haxe.macro.Tools;

class InterfaceTypeBuilder extends TypeBuilder {
  public function new(c:haxe.macro.Type.ClassType) super(c);

  override private function kind():TypeDefKind {
    return TDClass(null, [TypeBuilder.Fake_typePath, { name: classType.name, pack: classType.pack }], false);
  }

  override private function fields():Array<Field> {
    return classType.fields.get().map(f -> {
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
        access: [APublic],
        pos: f.pos,
        doc: null,
        meta: null,
        kind: FFun({
          ret: ret,
          args: args,
          expr: macro return xest.call($v{f.name}, [$a{args.map(a -> macro $i{a.name})}])
        })
      };
    });
  }
}