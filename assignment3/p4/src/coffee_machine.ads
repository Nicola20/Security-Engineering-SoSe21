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

	procedure Initialize (S : out State);

	procedure Input(S 		: in out State;
					Act 	: in Action;
					React 	: out Reaction);

	function Check_For_Equality(S : in out State; I : Integer) return Boolean;

	private
		type State is range 0..2;

		--function Check_Conditions_For_Input(S : State; Act : Action; React : Reaction) return Boolean;	

end Coffee_Machine;
