--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
-- Description: A programm which implements a little quiz
--				game with the user.
--------------------------------------------------------------

with Ada.Text_IO;

procedure Animals is
	use Ada.Text_IO;
	Answer : Character;
begin
	Put_Line("Let's play a little puzzle game!");
	Put_Line("Below you are presented a list of animals.");
	Put_line("Please choose on of those but don't tell me which.");
	Put_line("I will ask you some questions about the animal " &
			"which you can answer with either y or Y for yes and n " &
			" or N for no.");
	Put_Line("Maybe I will be able to guess your choice :).");
	Put_Line("Please select an animal out of the following list:");
	New_Line;
	Put_Line("cat, dog, elephant, giraffe, turtle, fish, tiger, hawk");
	New_Line;
	Put("If you are ready, please enter y or Y to start the game. ");
	Get(Answer);

	if Answer = 'y' or Answer = 'Y' then
		Put("Is it a household pet? ");
		Get(Answer);

		if Answer = 'y' or Answer = 'Y' then
			Put("Does it purr? ");
			Get(Answer);

			if Answer = 'y' or Answer = 'Y' then
				Put_Line("I know! It must be the cat.");	
			elsif Answer = 'n' or Answer = 'N' then
				Put("Does it bark? ");
				Get(Answer);

				if Answer = 'y' or Answer = 'Y' then
					Put_Line("I know! It must be the dog.");
				elsif Answer = 'n' or Answer = 'N' then
					Put("Does it have a shell? ");
					Get(Answer);

					if Answer = 'y' or Answer = 'Y' then
						Put_Line("I know! It must be the turtle.");
					elsif Answer = 'n' or Answer = 'N' then
						Put("Does it have scales? ");
						Get(Answer);

						if Answer = 'y' or Answer = 'Y' then
							Put_Line("I know! It must be the fish");
						elsif Answer = 'n' or Answer = 'N' then
							Put_Line("I am sorry, I don't know which" &
									" animal you chose.");
						end if;
					end if;
				end if;
			end if;

		elsif Answer = 'n' or Answer = 'N' then
			Put("Can it fly? ");
			Get(Answer);

			if Answer = 'y' or Answer = 'Y' then
				Put_Line("I know! It must be the hawk.");
			elsif Answer = 'n' or Answer = 'N' then
				Put("Does it roar? ");
				Get(Answer);
				
				if Answer = 'y' or Answer = 'Y' then
					Put_Line("I know! It must be the tiger.");
				elsif Answer = 'n' or Answer = 'N' then
					Put("Is it grey? ");
					Get(Answer);

					if Answer = 'y' or Answer = 'Y' then
						Put_Line("I know!" &
								" It must be the elephant.");
					elsif Answer = 'n' or Answer = 'N' then
						Put_Line("Ok, the only animal left is" &
								" the giraffe.");
					end if;
				end if;
			end if;
		end if;
	end if;
end Animals;
