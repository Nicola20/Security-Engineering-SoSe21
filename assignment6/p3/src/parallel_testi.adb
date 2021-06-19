--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Testing the graph package
--------------------------------------------------------------

with Ada.Text_IO, Parallel_Algorithms;
use Ada.Text_IO;

procedure Parallel_Testi is
    subtype Item_Type is Integer;
    package P is new Parallel_Algorithms(Item_Type, "+");
    use P; 
    Result: Item_Type;
    Test_Array : aliased Array_Type := (2, 3, 7, 10, 20, 4, 9);
begin
    Put_Line("Test parallel sum:");
    Parallel_Sum(Test_Array'Access, Result);
end Parallel_Testi;
