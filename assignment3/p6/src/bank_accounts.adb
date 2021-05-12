--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Bank_Accounts definition
--------------------------------------------------------------

with Ada.Text_IO;
with Bank_Accounts; use Bank_Accounts;

package body Bank_Accounts is

    package TEXTIO renames Ada.Text_IO;

    function Get_Balance(Account: Account_Type) return Cents_Type is
    begin
        return  Account.Balance;
    end Get_Balance;

    procedure Deposit(Account: in out Account_Type; Amount: Cents_Type) is
    begin
        Account.Balance := Account.Balance + Amount;
    end Deposit;

    procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) is
    begin
        Account.Balance := Account.Balance - Amount;
    end Withdraw;

    procedure Transfer(From: in out Account_Type; To: in out Account_Type; Amount: Cents_Type) is
    begin
        Withdraw(From, Amount);
        Deposit(To, Amount);
    end Transfer;

    procedure Put(Account: in Account_Type) is
    begin
        TEXTIO.Put("Current Balance: ");
        TEXTIO.Put(Get_Balance(Account)'Image);
        TEXTIO.Put(" Euro");
    end Put;

end Bank_Accounts;