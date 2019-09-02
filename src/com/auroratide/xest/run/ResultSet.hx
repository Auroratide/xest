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
    return if(results.foreach(r -> r.match(Success(_))) && sets.foreach(r -> r.result.match(Success(_))))
      Success();
    else
      Failure();
  }
}