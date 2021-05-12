--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Bank_Accounts declaration
--------------------------------------------------------------

package Bank_Accounts is
    subtype Cents_Type is Integer;
    Default_Balance: constant Cents_Type := 0;

    type Account_Type is tagged limited private;

    function Get_Balance(Account: Account_Type) return Cents_Type;
    -- Returns the current Balance from Account.

    procedure Deposit(Account: in out Account_Type; Amount: Cents_Type)
    with
        Pre =>(Amount > 0) and (Get_Balance(Account)+Amount < Integer'Last),
        Post =>(Get_Balance(Account) = Get_Balance(Account)'Old + Amount);

    procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type)
    with
        Pre =>(Get_Balance(Account) > 0) and (Amount <= Get_Balance(Account)),
        Post =>(Get_Balance(Account) >= 0) and (Get_Balance(Account) = Get_Balance(Account)'Old - Amount);

    procedure Transfer(From: in out Account_Type;
                       To: in out Account_Type;
                       Amount: Cents_Type)
    with
        Pre =>(Amount > 0) and (Get_Balance(From) >= Amount),
        Post =>(Get_Balance(From) = Get_Balance(From)'Old - Amount) and (Get_Balance(To) = Get_Balance(To)'Old + Amount);

    procedure Put(Account: in Account_Type);
    -- Prints the current Balance of the given Account.

private

    type Account_Type is tagged limited record
        Balance: Cents_Type := Default_Balance;
    end record;

end Bank_Accounts;
