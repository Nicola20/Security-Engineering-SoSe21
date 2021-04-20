package body Bank_Accounts is

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

procedure Transfer(From: in out Account_Type; To: in out Account_Type; Amount: in Cents_Type) is
begin
    Withdraw(From, Amount);
    Deposit(To, Amount);
end Transfer;

end Bank_Accounts;