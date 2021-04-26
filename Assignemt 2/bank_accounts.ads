--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Declarations for a simple bank account with pre and post conditions
--------------------------------------------------------------

package Bank_Accounts is
    subtype Cents_Type is Integer;
    type Account_Type is record
        Balance: Cents_Type := 0;
    end record;

    function Get_Balance(Account: Account_Type) return Cents_Type;
    -- Returns the current Balance from Account.

    procedure Deposit(Account: in out Account_Type; Amount: Cents_Type)
    with
        Pre =>(Amount > 0) and (Account.Balance+Amount < Integer'Last),
        Post =>(Account.Balance = Account'Old.Balance + Amount);
    -- Deposits Amount at the given Account.

    procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type)
    with
        Pre =>(Account.Balance > 0) and (Amount <= Account.Balance),
        Post =>(Account.Balance >= 0) and (Account.Balance = Account'Old.Balance - Amount);
    -- Withdraws Amount from the given Account.

    procedure Transfer(From: in out Account_Type;
                       To: in out Account_Type;
                       Amount: in Cents_Type)
    with
        Pre =>(Amount > 0) and (Get_Balance(From) >= Amount),
        Post =>(Get_Balance(From) = Get_Balance(From'Old) - Amount) and (Get_Balance(To) = Get_Balance(To'Old) + Amount);
    -- Transfers Amount from Account From to Account To.
end Bank_Accounts;