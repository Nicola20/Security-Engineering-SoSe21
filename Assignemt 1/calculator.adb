--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
-- Description: A simple calculator that takes two integer 
--              values and performs four simple calculations
--              on them.
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;            
use  Ada.Text_IO, Ada.Integer_Text_IO; 

procedure Simple_Calculations is
    First, Second : Integer; 
    Answer : Character;                     
begin
    Outer:
    loop
        Put("Please enter two integers. Seperate them with a space: ");                 
        Get(First);                                  
        Get(Second);   

        Put("The sum is ");                           
        Put(First + Second, Width=>1);                         
        New_Line; 

        Put("The difference is ");                           
        Put(First - Second, Width=>1);
        New_Line;

        Put("The product is ");                           
        Put(First * Second, Width=>1);   
        New_Line;

        if Second = 0 then 
            Put("Sorry, division by zero is not possible.");
        else
            Put("The quotient is ");                           
            Put(First / Second, Width=>1); 
        end if; 
        New_Line; 
        Inner:
        loop
            Put("Do you want to enter another pair of integers?" & 
                " If so, please enter y or Y. If not, please enter " &
                "n or N. ");
            Get(Answer);
            if Answer = 'y' or Answer = 'Y' then
                exit;
            elsif Answer = 'n' or Answer = 'N' then
                -- exit both loops and end program
                exit Outer;
            else 
                Put_Line("You entered an invalid character, " &
                        "please try again.");
                New_Line;
            end if;
        end loop Inner;
    end loop Outer;                                
end Simple_Calculations;