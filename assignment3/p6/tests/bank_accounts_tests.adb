with AUnit.Assertions;
with Bank_Accounts;

use AUnit.Assertions;
use Bank_Accounts;

package body Bank_Accounts_Tests is

    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
        Register_Routine(T, Test_Get_Balance'Access,
            "Test Get_Balance from Bank_Account.");
        Register_Routine(T, Test_Deposit'Access,
            "Test Deposit from Bank_Account.");
        Register_Routine(T, Test_Withdraw'Access,
            "Test Withdraw from Bank_Account.");
        Register_Routine(T, Test_Transfer'Access,
            "Test Transfer from Bank_Account.");
    end Register_Tests;

    -- ---------------------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("Bank_Accounts_Tests");
    end Name;

    -- ---------------------------------------------------------------

    procedure Test_Get_Balance (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        Account : Account_Type;
        Amount : Cents_Type;
    begin
        Amount := 200;
        Deposit(Account,Amount);
        Assert(Get_Balance(Account) = 200, "Test Get_Balance from Bank Account Failed.");
    end Test_Get_Balance;

    procedure Test_Deposit (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        Account : Account_Type;
        Amount : Cents_Type;
    begin
        Amount:= 300;
        Deposit(Account,Amount);
        Assert(Get_Balance(Account) = 300, "Test Deposit to Bank Account Failed.");
    end Test_Deposit;

	procedure Test_Withdraw (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        Account : Account_Type;
        Amount : Cents_Type;
    begin
        Amount:= 300;
        Deposit(Account, Amount);
        Amount:= 100;
        Withdraw(Account, Amount);
        Assert(Get_Balance(Account) = 200, "Test Withdraw from Bank Account Failed.");
    end Test_Withdraw;

	procedure Test_Transfer (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        Account1 : Account_Type;
        Account2 : Account_Type;
        Amount : Cents_Type;
    begin
        Amount := 400;
        Deposit(Account1, Amount);
        Amount := 300;
        Transfer(Account1, Account2, Amount);
        Assert(Get_Balance(Account1) = 100,"Test Transfer from Bank Account failed.");
        Assert(Get_Balance(Account2) = 300,"Test Transfer from Bank Account failed.");
    end Test_Transfer;

end Bank_Accounts_Tests;
