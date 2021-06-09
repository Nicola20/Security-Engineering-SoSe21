--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Lucas Hübner (116232),
-- Philipp Tornow (118332)
-- Description: Log
--------------------------------------------------------------

package Logerithm with
   SPARK_Mode => On
is
   
   Exponent_Not_Integer : Exception;
   
   function Log(Base, Value : Integer) return Integer with
     Global =>  Null,
     Depends => (Log'Result => (Base, Value)),
     Pre => Base > 1 and (Value = 1 or Value >= Base);
     --  Post => Base**Log'Result <= Value and then Base**Log'Result > Value / Base;
   
   function Mult(x, y : Positive) return Positive with
     Global =>  Null,
     Depends => (Mult'Result => (x, y)),
     Pre => x <= Integer'Last / y and y <= Integer'Last / x,
     Post => Mult'Result = x*y;
      
end Logerithm;
