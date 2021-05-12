--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Bank_Accounts_Fees declaration
--------------------------------------------------------------

with Bank_Accounts.Fees;
use Bank_Accounts.Fees;

package body Bank_Accounts.Fees is

function Get_Fees(Account : Fee_Account_Type) return Cents_Type is
begin
    return Account.Fees;
end Get_Fees;

procedure Withdraw(Account: in out Fee_Account_Type; Amount: Cents_Type) is
begin
    Account.Balance := Account.Balance - Amount - Get_Fees(Account);
end Withdraw;

procedure Transfer(From: in out Fee_Account_Type; To: in out Fee_Account_Type; Amount: Cents_Type) is
begin
    Withdraw(From, Amount);
    Deposit(To, Amount);
end Transfer;

end Bank_Accounts.Fees;