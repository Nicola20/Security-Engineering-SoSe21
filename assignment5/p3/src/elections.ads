package Elections is
    type Party is (None, A, B, C, D);
    type Votes_Array is array(Party) of Natural;

    Zero_Votes_Distribution: constant Votes_Array := (others => 0);
    Votes_Distribution: Votes_Array := Zero_Votes_Distribution;
    Num_Votes_Made: Natural := 0;
    Num_Total_Voters: Natural := 0;

    procedure Initialize(Num_Voters: Natural);
    -- Resets the number of made votes and votes for all parties to 0, and
    -- sets the number of total Voters to the given.
    procedure Vote_For(Vote: Party);
    function All_Voters_Voted return Boolean;
    function Find_Winner return Party;
    -- Returns Party with most votes assigned.
    -- Returns None if multiple parties share the highest votes.
end Elections;
