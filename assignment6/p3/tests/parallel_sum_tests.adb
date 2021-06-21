--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: AUnit tests for the parallel computation
--              of the sum of arrayelements.
--------------------------------------------------------------

with AUnit.Assertions;
with Parallel_Algorithms;

package body Parallel_Sum_Tests is
    use AUnit.Assertions;

    procedure Test_Complete_Sum_Natural(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced (T);
        subtype Item_Type is Natural;
        package P is new Parallel_Algorithms(Item_Type, "+");
        use P; 
        Result : Item_Type;
        Test_Array : aliased Array_Type := (2, 3, 7, 10, 20, 4, 9);
    begin
        Parallel_Sum(Test_Array'Access, Result);
        Assert((Result = 55), "Sum of positive numbers failed.");
    end Test_Complete_Sum_Natural;


    procedure Test_Complete_Sum_Integer(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced (T);
        subtype Item_Type is Integer;
        package P is new Parallel_Algorithms(Item_Type, "+");
        use P; 
        Result : Item_Type;
        Test_Array : aliased Array_Type := (2, 3, 7, -6, 0, -8, 305, 10, 20, 4, 9);
    begin
        Parallel_Sum(Test_Array'Access, Result);
        Assert((Result = 346), "Sum of integers failed.");
    end Test_Complete_Sum_Integer;


    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
        Register_Routine(T, Test_Complete_Sum_Natural'Access, 
            "Test sum of array with naturals");
        Register_Routine(T, Test_Complete_Sum_Integer'Access, 
            "Test sum of array with integers");

    end Register_Tests;

    ------------------------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("Parallel_Sum_Tests");
    end Name;

    ------------------------------------------------------------------

end Parallel_Sum_Tests;
