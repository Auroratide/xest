package com.auroratide.xest.run;

using Lambda;

class ResultSet {
  public final name:String;
  public final results:Array<Result>;
  public final sets:Array<ResultSet>;
  public var result(get, never):Result;

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
}