--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: AUnit tests for the coffee machine
--------------------------------------------------------------

with AUnit.Assertions;
with Parallel_Algorithms;

package body Parallel_Sum_Tests is
    use AUnit.Assertions;

    procedure Test_Complete_Sum_Integer(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced (T);
        subtype Item_Type is Integer;
        package P is new Parallel_Algorithms(Item_Type, "+");
        use P; 
        Result: Item_Type;
        Test_Array : aliased Array_Type := (2, 3, 7, 10, 20, 4, 9);
    begin
        Parallel_Sum(Test_Array'Access, Result);
        Assert((Result = 55), "Initialization failed.");
    end Test_Complete_Sum_Integer;


    procedure Test_Complete_Sum_String(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced (T);
        subtype Item_Type is String := "hi";
        package P is new Parallel_Algorithms(Item_Type, "+");
        use P; 
        Result: Item_Type;
        Test_Array : aliased Array_Type := ("Hel", "lo", ", ", "wo", "rl", "d!");
    begin
        Parallel_Sum(Test_Array'Access, Result);
        Assert((Result = "Hello, world"), "Initialization failed.");
    end Test_Complete_Sum_String;


    --procedure Test_Sum_Customized_Index(T : in out Test_Cases.Test_Case'Class) is
    --    pragma Unreferenced (T);
    --    subtype Item_Type is String;
    --    package P is new Parallel_Algorithms(Item_Type, "+");
    --    use P; 
    --    Result: Item_Type;
    --    Test_Array: Array_Access_Type := new Array_Type(5..20);
    --begin
    --    Parallel_Sum(Test_Array'Access, Result);
    --    Assert((Result = "Hello, world"), "Initialization failed.");
    --end Test_Sum_Customized_Index;


    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
        Register_Routine(T, Test_Complete_Sum_Integer'Access, 
            "Test sum of array with integers");
        Register_Routine(T, Test_Complete_Sum_String'Access, 
            "Test sum of array with strings");
        --Register_Routine(T, Test_Sum_Customized_Index'Access, 
        --    "Test sum of array with customized index");
  
    end Register_Tests;

    ------------------------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("Parallel_Sum_Tests");
    end Name;

    ------------------------------------------------------------------

end Parallel_Sum_Tests;
