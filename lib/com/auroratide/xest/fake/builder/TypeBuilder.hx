package com.auroratide.xest.fake.builder;

import haxe.macro.Expr;
import haxe.macro.Context;

using Lambda;
using haxe.macro.Tools;

class TypeBuilder {
  private static final fakes:Array<String> = [];
  private static final Fake_typePath:TypePath = { name: "Fake", pack: ["com", "auroratide", "xest", "fake"] };

  private final classType:haxe.macro.Type.ClassType;

  public function new(classType:haxe.macro.Type.ClassType) {
    this.classType = classType;
  }

  public final function build():String {
    final id = '${classType.pack.join(".")}.${name()}';

    if(!fakes.exists(f -> f == id)) {
      Context.defineType({
        name: name(),
        pack: classType.pack,
        kind: kind(),
        pos: Context.currentPos(),
        fields: [ {
          name: "xest",
          access: [APublic, AFinal],
          pos: Context.currentPos(),
          kind: FVar(macro:com.auroratide.xest.fake.Proxy, macro new com.auroratide.xest.fake.Proxy())
        } ].concat(fields())
      });

      fakes.push(id);
    }

    return id;
  }

  private function name():String {
    return '${classType.name}_Fake';
  }

  private function kind():TypeDefKind {
    return null;
  }

  private function fields():Array<Field> {
    return [];
  }
}