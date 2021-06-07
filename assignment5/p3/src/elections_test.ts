context with Elections;
        with Ada.Text_IO;
        use Elections;
        use Ada.Text_IO;

code    Put_line("Test Elections Package.");
        New_Line;

        Put_line("Test Elections Initialization.");

***** (1.1) Test Init
define  num : Natural;
test    num := 3;
        Initialize(num);
pass    (Num_Total_Voters = num)
        AND (Num_Votes_Made = 0)
        AND (Votes_Distribution(None) = 0)
        AND (Votes_Distribution(A) = 0)
        AND (Votes_Distribution(B) = 0)
        AND (Votes_Distribution(C) = 0)
        AND (Votes_Distribution(D) = 0)


***** (1.2) Test Vote
test    Initialize(2);
        Vote_For(A);
pass    (Num_Votes_Made = 1) AND (Num_Total_Voters = 2) AND (Votes_Distribution(A) = 1)


***** (1.3) Test All Voters Voted
test    Initialize(1);
        Vote_For(B);
pass    All_Voters_Voted


***** (1.3) Test Find Winner
define  Winner: Party;
test    Initialize(5);
        Vote_For(B);
        Vote_For(C);
        Vote_For(C);
        Vote_For(A);
        Vote_For(None);
        Winner := Find_Winner;
pass    Winner = C


***** (1.4) Test Find Winner On Draw
define  Winner: Party;
test    Initialize(5);
        Vote_For(B);
        Vote_For(C);
        Vote_For(C);
        Vote_For(B);
        Vote_For(D);
        Winner := Find_Winner;
pass    Winner = None