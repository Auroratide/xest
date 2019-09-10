package com.auroratide.xest.run;

import com.auroratide.xest.run.Timer.Milliseconds;
using Lambda;

class ResultSet {
  public final name:String;
  public final results:Array<Result>;
  public final sets:Array<ResultSet>;
  public var result(get, never):Result;
  public var time(get, never):Milliseconds;

  public function new(name:String, results:Array<Result>, sets:Array<ResultSet>) {
    this.name = name;
    this.results = results;
    this.sets = sets;
  }

  public function count(?type:Result):Int {
    return results.count(r -> type == null || Type.enumIndex(r) == Type.enumIndex(type)) + sets.fold((s, sum) -> s.count(type) + sum, 0);
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
}