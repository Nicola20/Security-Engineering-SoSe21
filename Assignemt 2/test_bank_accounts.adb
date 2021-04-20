with Bank_Accounts, Ada.Text_IO;
use Bank_Accounts, Ada.Text_IO;

procedure Test_Bank_Accounts is

Account1 : Account_Type := (Balance => 200);
Account2 : Account_Type := (Balance => 400);

Amount1 : Cents_Type := 400;
Amount2 : Cents_Type := 200;

begin
    Put_Line("Test: Get Balance Account2");
    Put(Get_Balance(Account2)'Image);
    New_line;

    Put_Line("Test: Deposit Amount1: 400 to Account2");
    Deposit(Account2, Amount1);
    Put_Line(Get_Balance(Account2)'Image);

    Put_Line("Test: Withdraw Amount1: 400 from Account2");
    Withdraw(Account2, Amount1);
    Put_Line(Get_Balance(Account2)'Image);

    Put_Line("Test: Transfer Amount2: from Account1 to Account2");
    Transfer(Account1, Account2, Amount2);
    Put(Get_Balance(Account1)'Image & ", " & Get_Balance(Account2)'Image);
    New_Line;

    Put_Line("Test Pre - condition: Withdraw Amount1: 400 from Account1");
    Withdraw(Account1, Amount1);
    Put_Line(Get_Balance(Account1)'Image);

end Test_Bank_Accounts;