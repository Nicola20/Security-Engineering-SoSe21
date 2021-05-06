with AUnit.Assertions;
with Bank_Accounts;
with Bank_Accounts.Fees;

use AUnit.Assertions;
use Bank_Accounts;
use Bank_Accounts.Fees;

package body Bank_Accounts_Fees_Tests is

    -- package One_Euro_Fees_Accounts is new Bank_Accounts.Fees(100);
    -- use One_Euro_Fees_Accounts;

    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
    end Register_Tests;

    -- -----------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("Bank_Accounts_Fees_Tests");
    end Name;

    -- -----------------------------------------------------

end Bank_Accounts_Fees_Tests;
