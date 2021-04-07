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
begin
    Put ("Please enter two integers. Seperate them by a space: ");                 
    Get (First);                                  
    Get (Second);                                 
    Put ("The sum is ");                           
    Put (First + Second, Width=>1);                         
    New_Line; 
    Put ("The difference is ");                           
    Put (First - Second, Width=>1);
    New_Line;
    Put ("The product is ");                           
    Put (First * Second, Width=>1);   
    New_Line;
    Put ("The quotient is ");                           
    Put (First / Second, Width=>1);  
    New_Line;                                 
end Simple_Calculations;