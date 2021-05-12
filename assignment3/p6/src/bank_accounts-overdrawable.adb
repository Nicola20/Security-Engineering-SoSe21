--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Bank_Accounts_Overdrawable definition
--------------------------------------------------------------

with Bank_Accounts.Overdrawable;
use Bank_Accounts.Overdrawable;

package body Bank_Accounts.Overdrawable is

function Get_Overdraft_Limit(Account : Overdrawable_Account_Type) return Cents_Type is
begin
    return Account.Overdraft_Limit;
end Get_Overdraft_Limit;

procedure Withdraw(Account: in out Overdrawable_Account_Type; Amount: Cents_Type) is
begin
    Account.Balance := Account.Balance - Amount;
end Withdraw;

procedure Transfer(From: in out Overdrawable_Account_Type; To: in out Overdrawable_Account_Type; Amount: Cents_Type) is
begin
    Withdraw(From, Amount);
    Deposit(To, Amount);
end Transfer;

end Bank_Accounts.Overdrawable;