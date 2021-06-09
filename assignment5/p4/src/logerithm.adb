--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Lucas Hübner (116232),
-- Philipp Tornow (118332)
-- Description: Log
--------------------------------------------------------------

with Logerithm;

package body Logerithm with
   SPARK_Mode => On
is

   function Log(Base, Value : Integer) return Integer is
      Log : Natural := 0;
      Pow : Positive := 1;
   begin
      if Value = 1 then
         pragma Assert(Base**Log = Pow);
         return Log;
      end if;


      while Pow <= (Value / Base)
        and Log < Integer'Last
        and Pow <= Integer'Last / Base
        and Base <= Integer'Last / Pow
      loop
         pragma Loop_Variant(Increases => Log);
         pragma Loop_Invariant(Pow = Base**Log);
         Pow := Mult(Pow, Base);
         Log := Log + 1;
      end loop;
      return Log;
   end Log;


   function Mult(x, y : Positive) return Positive is
      count : Natural := 0;
      z : Natural := 0;
   begin
      while count < x and count < Integer'Last and z <= Integer'Last - y loop
         pragma Loop_Variant(Increases => count);
         pragma Loop_Invariant(count * y = z);
         z := z + y;
         count := count + 1;
      end loop;
      return z;
   end Mult;

end Logerithm;
