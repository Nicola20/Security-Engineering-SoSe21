with AUnit.Assertions;
with Coffee_Machine;

package body Coffee_Tests is
    use AUnit.Assertions;
    use Coffee_Machine;

    procedure Test_Initialization (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Insert_Money (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Get_Coffee (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Money_Back (T : in out Test_Cases.Test_Case'Class);

    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
    end Register_Tests;

    -- ---------------------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("Coffee_Machine_Tests");
    end Name;

    -- ---------------------------------------------------------------

end Coffee_Tests;
