--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Lucas Hübner (116232),
-- Philipp Tornow (118332)
-- Description: Elections package declaration with Proves
--------------------------------------------------------------

package Elections
    with SPARK_Mode => On
is
    type Party is (None, A, B, C, D);
    type Votes_Array is array(Party) of Natural;

    Zero_Votes_Distribution: constant Votes_Array := (others => 0);
    Votes_Distribution: Votes_Array := Zero_Votes_Distribution;
    Num_Votes_Made: Natural := 0;
    Num_Total_Voters: Natural := 0;

    procedure Initialize(Num_Voters: Natural) with
        Global => (Output => (Votes_Distribution, Num_Votes_Made, Num_Total_Voters)),
        Depends => (Num_Total_Voters => Num_Voters,
                    Votes_Distribution => null,
                    Num_Votes_Made => null),
        Pre => Num_Voters < Natural'Last,
        Post => ((Num_Total_Voters = Num_Voters) and (Num_Votes_Made = 0) and (for all P in Votes_Distribution'Range => Votes_Distribution(P) = 0));
    -- Resets the number of made votes and votes for all parties to 0, and
    -- sets the number of total Voters to the given.

    procedure Vote_For(Vote: Party) with
        Global => (Proof_In => (Num_Total_Voters),
                  In_Out => (Num_Votes_Made,Votes_Distribution)),
        Depends => (Votes_Distribution => (Votes_Distribution,Vote), Num_Votes_Made => Num_Votes_Made),
        Pre => (not All_Voters_Voted
                and (for all P in Votes_Distribution'Range => Votes_Distribution(P) = 0)
                and Num_Votes_Made < Natural'Last),
        Post => Votes_Distribution(Vote) = Votes_Distribution(Vote)'Old + 1;

    function All_Voters_Voted return Boolean with
        Global => (Num_Votes_Made, Num_Total_Voters),
        Post => (if All_Voters_Voted'Result then
                    Num_Votes_Made = Num_Total_Voters
                );

    function Find_Winner return Party with
        Global => Votes_Distribution,
        Post => (for all P in Votes_Distribution'Range => Votes_Distribution(Find_Winner'Result) >= Votes_Distribution(P)) or (Find_Winner'Result = None);
    -- Returns Party with most votes assigned.
    -- Returns None if multiple parties share the highest votes.
end Elections;
