--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: AUnit tests for the coffee machine
--------------------------------------------------------------

with AUnit.Assertions;
with Parallel_Algorithms;

package body Parallel_Sum_Tests is
    use AUnit.Assertions;
    use Parallel_Algorithms;

    procedure Test_Initialization (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced (T);
        Test_State : State;
    begin
        Initialize(Test_State);
        Assert(Check_For_Equality(Test_State, 0), "Initialization failed.");
    end Test_Initialization;


	procedure Test_Insert_Ten_Cent(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced (T);
        Test_State : State;
        Coffe_Machine_Reaction : Reaction;
    begin
        Initialize(Test_State);
        Input(Test_State, Ten_Cent, Coffe_Machine_Reaction);
        Assert(Check_For_Equality(Test_State, 1), "State is not correct");
        Assert(Coffe_Machine_Reaction = Nothing, "Coffee machine reaction went wrong");
    end Test_Insert_Ten_Cent;


    procedure Test_Insert_Twenty_Cent (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced (T);
        Test_State : State;
        Coffe_Machine_Reaction : Reaction;
    begin
        Initialize(Test_State);
        Input(Test_State, Twenty_Cent, Coffe_Machine_Reaction);
        Assert(Check_For_Equality(Test_State, 2), "State is not correct");
        Assert(Coffe_Machine_Reaction = Nothing, "Coffee machine reaction went wrong");
    end Test_Insert_Twenty_Cent;


	procedure Test_Get_Coffee_Exactly (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced (T);
        Test_State : State;
        Coffe_Machine_Reaction : Reaction;
    begin
        Initialize(Test_State);
        Input(Test_State, Twenty_Cent, Coffe_Machine_Reaction);
        Input(Test_State, Ten_Cent, Coffe_Machine_Reaction);
        Assert(Check_For_Equality(Test_State, 0), "State is not correct");
        Assert(Coffe_Machine_Reaction = Coffee, "Getting coffee exactly went wrong");
    end Test_Get_Coffee_Exactly;


    procedure Test_Get_Coffee_Overspending(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced (T);
        Test_State : State;
        Coffe_Machine_Reaction : Reaction;
    begin
        Initialize(Test_State);
        Input(Test_State, Twenty_Cent, Coffe_Machine_Reaction);
        Input(Test_State, Twenty_Cent, Coffe_Machine_Reaction);
        Assert(Check_For_Equality(Test_State, 0), "State is not correct");
        Assert(Coffe_Machine_Reaction = Coffee, "Getting coffee while overspending went wrong");
    end Test_Get_Coffee_Overspending;


	procedure Test_Button_Money_Inserted  (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced (T);
        Test_State : State;
        Coffe_Machine_Reaction : Reaction;
    begin
        Initialize(Test_State);
        Input(Test_State, Twenty_Cent, Coffe_Machine_Reaction);
        Input(Test_State, Button, Coffe_Machine_Reaction);
        Assert(Check_For_Equality(Test_State, 0), "State is not correct");
        Assert(Coffe_Machine_Reaction = Drop_All_Coins, "Pressing button went wrong");
    end Test_Button_Money_Inserted;


    procedure Test_Button_No_Money_Inserted  (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced (T);
        Test_State : State;
        Coffe_Machine_Reaction : Reaction;
    begin
        Initialize(Test_State);
        Input(Test_State, Button, Coffe_Machine_Reaction);
        Assert(Check_For_Equality(Test_State, 0), "State is not correct");
        Assert(Coffe_Machine_Reaction = Drop_All_Coins, "Pressing button went wrong");
    end Test_Button_No_Money_Inserted;


    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
        Register_Routine(T, Test_Initialization'Access, 
            "Test initialization");
        Register_Routine(T, Test_Insert_Ten_Cent'Access, 
            "Test inserting ten cent");
        Register_Routine(T, Test_Insert_Twenty_Cent'Access, 
            "Test insert twenty cent");
        Register_Routine(T, Test_Get_Coffee_Exactly'Access, 
            "Test getting coffee with exactly 30 cent");
        Register_Routine(T, Test_Get_Coffee_Overspending'Access, 
            "Test getting coffee with more than 30 cent");
        Register_Routine(T, Test_Button_No_Money_Inserted'Access, 
            "Test getting money back without inserting coins beforehand");
        Register_Routine(T, Test_Button_Money_Inserted'Access, 
            "Test getting money back after inserting coins");
        
    end Register_Tests;

    ------------------------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("Parallel_Sum_Tests");
    end Name;

    ------------------------------------------------------------------

end Parallel_Sum_Tests;
