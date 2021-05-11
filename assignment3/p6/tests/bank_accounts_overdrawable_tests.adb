with AUnit.Assertions;
with Bank_Accounts;
with Bank_Accounts.Overdrawable;

use AUnit.Assertions;
use Bank_Accounts;
use Bank_Accounts.Overdrawable;

package body Bank_Accounts_Overdrawable_Tests is

    --package One_Euro_Overdrawable_Accounts is new Bank_Accounts.Overdrawable(100);
    --use One_Euro_Overdrawable_Accounts;

    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
        Register_Routine(T, Test_Get_Overdraft_Limit'Access,
            "Test Get_Overdraft_Limit");
        Register_Routine(T, Test_Withdraw'Access,
            "Test Withdraw from Bank_Account.");
        Register_Routine(T, Test_Transfer'Access,
            "Test Transfer from Bank_Account.");
    end Register_Tests;

    -- -----------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("Bank_Accounts_Overdrawable_Tests");
    end Name;

    -- -----------------------------------------------------

    procedure Test_Get_Overdraft_Limit (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        Account : Overdrawable_Account_Type;
    begin
        Assert(Get_Overdraft_Limit(Account) = 10000,"Get_Overdraft_Limit of Overdraft Account Failed.");
    end Test_Get_Overdraft_Limit;

	procedure Test_Withdraw (T : in out Test_Cases.Test_Case'Class)is
        pragma Unreferenced(T);
        Account : Overdrawable_Account_Type;
        Amount : Cents_Type;
    begin
        Amount:= 100;
        Deposit(Account, Amount);
        Amount:= 200;
        Withdraw(Account, Amount);
        Assert(Get_Balance(Account) = -100, "Test Withdraw more than the capacity from Bank Account Failed.");
    end Test_Withdraw;

	procedure Test_Transfer (T : in out Test_Cases.Test_Case'Class)is
        pragma Unreferenced(T);
        Account1 : Overdrawable_Account_Type;
        Account2 : Overdrawable_Account_Type;
        Amount : Cents_Type;
    begin
        Amount := 100;
        Deposit(Account1, Amount);
        Amount := 300;
        Transfer(Account1, Account2, Amount);
        Assert(Get_Balance(Account1) = -200,"Test Transfer more than capacity from Bank Account failed.");
        Assert(Get_Balance(Account2) = 300,"Test Transfer from Bank Account failed.");
    end Test_Transfer;

end Bank_Accounts_Overdrawable_Tests;
