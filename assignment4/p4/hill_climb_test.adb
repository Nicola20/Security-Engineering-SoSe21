--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Testing the graph package
--------------------------------------------------------------

with Ada.Text_IO, Hill_Climb;
with Ada.Numerics.Generic_Elementary_Functions;
use Ada.Text_IO;

procedure Hill_Climb_Test is
    function Evaluation (X : Integer) return Integer is
    begin
       return X**3 + 3 * X**2 - 2 * X + 1;
    end Evaluation;
    Result : Integer;
begin
    Result := Hill_Climb.Climb(Evaluation'Access, -4, 2);
    Ada.Text_IO.Put_Line("I am finally best " & Integer'Image(Result));
end Hill_Climb_Test;