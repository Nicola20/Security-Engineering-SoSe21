package Bank_Accounts is
    subtype Cents_Type is Integer;
    Default_Balance: constant Cents_Type := 0;

    type Account_Type is tagged limited private;

    function Get_Balance(Account: Account_Type) return Cents_Type;
    -- Returns the current Balance from Account.

    procedure Deposit(Account: in out Account_Type; Amount: Cents_Type);

    procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type);

    procedure Transfer(From: in out Account_Type;
                       To: in out Account_Type;
                       Amount: Cents_Type);

    procedure Put(Account: in Account_Type);
    -- Prints the current Balance of the given Account.

private

    type Account_Type is tagged limited record
        Balance: Cents_Type := Default_Balance;
    end record;

end Bank_Accounts;
