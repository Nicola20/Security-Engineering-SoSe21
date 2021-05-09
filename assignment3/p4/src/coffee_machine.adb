with Ada.Text_IO;
package body Coffee_Machine is
	-- Simulation of a coin-driven coffee machine
	-- User: - One slot to insert coins (only 10 or 20 cents)
	--		 - One button to press ("money back")
	-- Machine: one slot to drop coins, the coffee output
	-- Given 30 cents or more, the coffee is produced immediately
	-- (Note that Overspending is Possible)
    procedure Initialize (S : out State) 
    -- post condition: state has to be 0
    is
    begin
        Ada.Text_IO.Put_Line(State'Image(S));
        S := 0;
        Ada.Text_IO.Put_Line("Initialized");
        Ada.Text_IO.Put_Line(State'Image(S));
    end Initialize;



	procedure Input(S : in out State; Act : in Action;
				    React : out Reaction) 
    is
    begin
        if Act = Button then
            React := Drop_All_Coins;
            S := 0;
        elsif Act = Ten_Cent then
            if S = 0 then
                S := 1;
                React := Nothing;
            elsif S = 1 then
               S := 2;
               React := Nothing;
            else 
                S:= 0;
                React := Coffee;
            end if;
        else
            if S = 0 then
                S := 2;
                React := Nothing;
            else
                S := 0;
                React := Coffee;
            end if;
        end if;

        Ada.Text_IO.Put_Line(State'Image(S));
        Ada.Text_IO.Put_Line(Reaction'Image(React));
    end Input;

end Coffee_Machine;
