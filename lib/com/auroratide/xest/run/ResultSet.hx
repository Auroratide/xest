package com.auroratide.xest.run;

import com.auroratide.xest.run.Timer.Milliseconds;
using Lambda;

class ResultSet {
  public final name:String;
  public final results:Array<Result>;
  public final sets:Array<ResultSet>;
  public var result(get, never):Result;
  public var time(get, never):Milliseconds;
  public var count(get, never):Int;

  public function new(name:String, results:Array<Result>, sets:Array<ResultSet>) {
    this.name = name;
    this.results = results;
    this.sets = sets;
  }

  private function get_result():Result {
    return if(results.exists(r -> r.match(Failure(_)) || sets.exists(r -> r.result.match(Failure(_)))))
      Failure();
    else
      Success();
  }

  private function get_time():Milliseconds {
    return results.fold((r, sum) -> switch(r) {
      case Success(_, t): t + sum;
      case _: sum;
    }, 0) + sets.fold((s, sum) -> s.time + sum, 0);
  }

  private function get_count():Int {
    return results.length + sets.fold((s, sum) -> s.count + sum, 0);
  }

  public function cc(type:Result):Int {
    return results.count(r -> Type.enumIndex(r) == Type.enumIndex(type)) + sets.fold((s, sum) -> s.cc(type) + sum, 0);
  }
}