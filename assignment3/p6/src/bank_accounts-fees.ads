--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Bank_Accounts_Fees definition
--------------------------------------------------------------

with Bank_Accounts;

package Bank_Accounts.Fees is

    type Fee_Account_Type is new Account_Type with private;

    function Get_Fees(Account : Fee_Account_Type) return Cents_Type;

    overriding procedure Withdraw(Account: in out Fee_Account_Type; Amount: Cents_Type)
        with
            Pre => (Amount + Get_Fees(Account) <= Get_Balance(Account)),
            Post => Get_Balance(Account) >= 0 and (Get_Balance(Account) = Get_Balance(Account)'Old - (Amount + Get_Fees(Account)));

    overriding procedure Transfer(From: in out Fee_Account_Type;
                                    To: in out Fee_Account_Type;
                                    Amount: Cents_Type)
        with
            Pre =>(Amount > 0) and (Get_Balance(From) >= Amount + Get_Fees(From)),
            Post =>(Get_Balance(From) = Get_Balance(From)'Old - (Amount+Get_Fees(From))) and (Get_Balance(To) = Get_Balance(To)'Old + Amount);

    private
        type Fee_Account_Type is new Account_Type with
        record
            Fees : Cents_Type := 200;
        end record;

end Bank_Accounts.Fees;