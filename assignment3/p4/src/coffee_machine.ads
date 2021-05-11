--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Declarations for a simple coffee machine
--------------------------------------------------------------

package Coffee_Machine is

	-- Simulation of a coin-driven coffee machine
	-- User: - One slot to insert coins (only 10 or 20 cents)
	--		 - One button to press ("money back")
	-- Machine: one slot to drop coins, the coffee output
	-- Given 30 cents or more, the coffee is produced immediately
	-- (Note that Overspending is Possible)

	type State is private;
	type Action is (Ten_Cent, Twenty_Cent, Button);
	type Reaction is (Nothing, Drop_All_Coins, Coffee);

	function Check_For_Equality(S : in out State; I : Integer) return Boolean;

	procedure Initialize (S : out State)
	with
		Post => Check_For_Equality(S, 0);

	procedure Input(S 		: in out State;
					Act 	: in Action;
					React 	: out Reaction)
	with
        Post => (if Act = Button then Check_For_Equality(S, 0) and React = Drop_All_Coins
				elsif Act = Ten_Cent or Act = Twenty_Cent then React = Nothing 
					or React = Coffee);

	private
		type State is range 0..2;

end Coffee_Machine;
