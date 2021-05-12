--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Aunit tests Bank_Accounts_Fees definition
--------------------------------------------------------------

with AUnit.Assertions;
with Bank_Accounts;
with Bank_Accounts.Fees;

use AUnit.Assertions;
use Bank_Accounts;
use Bank_Accounts.Fees;

package body Bank_Accounts_Fees_Tests is

    --package One_Euro_Fees_Accounts is new Bank_Accounts.Fees(100);
    --use One_Euro_Fees_Accounts;

    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
        Register_Routine(T, Test_Get_Fees'Access,
            "Test Get_Fees for Fees Account.");
        Register_Routine(T, Test_Withdraw'Access,
            "Test Withdraw from Bank_Account.");
        Register_Routine(T, Test_Transfer'Access,
            "Test Transfer from Bank_Account.");
    end Register_Tests;

    -- -----------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("Bank_Accounts_Fees_Tests");
    end Name;

    -- -----------------------------------------------------

    procedure Test_Get_Fees (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        Account : Fee_Account_Type;
    begin
        Assert(Get_Fees(Account) = 200,"Get_Fees for Bank_Accounts_Fee failed.");
    end Test_Get_Fees;

	procedure Test_Withdraw (T : in out Test_Cases.Test_Case'Class)is
        pragma Unreferenced(T);
        Account : Fee_Account_Type;
        Amount : Cents_Type;
    begin
        Amount:= 300;
        Deposit(Account, Amount);
        Amount:= 100;
        Withdraw(Account, Amount);
        Assert(Get_Balance(Account) = 0, "Test Withdraw from Bank Account Failed.");
    end Test_Withdraw;

	procedure Test_Transfer (T : in out Test_Cases.Test_Case'Class)is
        pragma Unreferenced(T);
        Account1 : Fee_Account_Type;
        Account2 : Fee_Account_Type;
        Amount : Cents_Type;
    begin
        Amount := 400;
        Deposit(Account1, Amount);
        Amount := 200;
        Transfer(Account1, Account2, Amount);
        Assert(Get_Balance(Account1) = 0,"Test Transfer from Bank Account failed.");
        Assert(Get_Balance(Account2) = 200,"Test Transfer from Bank Account failed.");
    end Test_Transfer;

end Bank_Accounts_Fees_Tests;
