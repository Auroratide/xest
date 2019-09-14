package com.auroratide.xest.reporting;

import com.auroratide.xest.run.Timer.Milliseconds;

interface Printer {
  function print(s:String):Printer;
  function title(s:String = ""):Printer;
  function time(t:Milliseconds):Printer;
  function success(s:String = ""):Printer;
  function failure(s:String = ""):Printer;
  function warning(s:String = ""):Printer;
  function quiet(s:String = ""):Printer;
  function newline():Printer;
  function pad(spaces:Int):Printer;
  function end():Void;
}