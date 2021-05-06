with AUnit.Assertions;
with Bank_Accounts;
with Bank_Accounts.Overdrawable;

use AUnit.Assertions;
use Bank_Accounts;
use Bank_Accounts.Overdrawable;

package body Bank_Accounts_Overdrawable_Tests is

    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
    end Register_Tests;

    -- -----------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("Bank_Accounts_Overdrawable_Tests");
    end Name;

    -- -----------------------------------------------------
end Bank_Accounts_Overdrawable_Tests;
