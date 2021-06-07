--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Lucas Hübner (116232),
-- Philipp Tornow (118332)
-- Description: Elections package definition
--------------------------------------------------------------

package body Elections is

procedure Initialize(Num_Voters: Natural) is
begin
    Num_Votes_Made := 0;
    Num_Total_Voters := Num_Voters;
    Votes_Distribution := Zero_Votes_Distribution;
end Initialize;

procedure Vote_For(Vote: Party) is
begin
    Votes_Distribution(Vote) := Votes_Distribution(Vote)+1;
    Num_Votes_Made  := Num_Votes_Made+1;
end Vote_For;

function All_Voters_Voted return Boolean is
begin
    return Num_Votes_Made = Num_Total_Voters;
end All_Voters_Voted;

function Find_Winner return Party is
potWinner : Party;
equalNumVotes : Natural;
begin
    potWinner := None;
    for p in Votes_Distribution'Range loop
        if Votes_Distribution(p) > Votes_Distribution(potWinner) then
            potWinner := p;
        elsif Votes_Distribution(p) = Votes_Distribution(potWinner) then
            equalNumVotes := Votes_Distribution(p);
        end if;
    end loop;

    if Votes_Distribution(potWinner) = equalNumVotes then
        return None;
    end if;

    return potWinner;
end Find_Winner;

end Elections;