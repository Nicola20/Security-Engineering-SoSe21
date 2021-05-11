with Bank_Accounts;

package Bank_Accounts.Overdrawable is

    type Overdrawable_Account_Type is new Account_Type with private;

    function Get_Overdraft_Limit(Account : Overdrawable_Account_Type) return Cents_Type;

    overriding procedure Withdraw(Account: in out Overdrawable_Account_Type; Amount: Cents_Type)
        with
            Pre => (Amount <= Get_Balance(Account) + Get_Overdraft_Limit(Account)),
            Post => Get_Balance(Account) > -Get_Overdraft_Limit(Account) and (Get_Balance(Account) = Get_Balance(Account)'Old - Amount);

    overriding procedure Transfer(From: in out Overdrawable_Account_Type;
                                    To: in out Overdrawable_Account_Type;
                                    Amount: Cents_Type)
        with
            Pre =>(Amount > 0) and (Get_Balance(From)+Get_Overdraft_Limit(From) >= Amount),
            Post =>(Get_Balance(From) = Get_Balance(From)'Old - Amount) and (Get_Balance(To) = Get_Balance(To)'Old + Amount);

    private
        type Overdrawable_Account_Type is new Account_Type with
        record
            Overdraft_Limit : Cents_Type := 10000;
        end record;
end Bank_Accounts.Overdrawable;