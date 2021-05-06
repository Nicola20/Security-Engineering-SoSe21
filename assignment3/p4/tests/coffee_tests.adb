with AUnit.Assertions;
with Coffee_Machine;

package body Coffee_Tests is
    use AUnit.Assertions;
    use Coffee_Machine;

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
