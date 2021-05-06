with AUnit.Assertions;
with Bank_Accounts;

use AUnit.Assertions;
use Bank_Accounts;

package body Bank_Accounts_Tests is

    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
    end Register_Tests;

    -- ---------------------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("Bank_Accounts_Tests");
    end Name;

    -- ---------------------------------------------------------------
end Bank_Accounts_Tests;
