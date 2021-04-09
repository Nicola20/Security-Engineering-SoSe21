--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
-- Description: A simple program, counting vowels in an input
-- text.
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;            
use  Ada.Text_IO, Ada.Integer_Text_IO; 

procedure Vowels is

    A_Count, E_Count, I_Count, O_Count, U_Count, Total_Count : Integer := 0;
    In_Char : Character;

begin
    Put("Enter a text for counting the vowels. " &
        "Finalize your input with a full stop.");
    New_Line;
    
    loop
        Get(In_Char);
        case In_Char is
            when 'a' | 'A' =>
                A_Count := A_Count + 1;
            
            when 'e' | 'E' =>
                E_Count := E_Count + 1;
            
            when 'i' | 'I' =>
                I_Count := I_Count + 1;

            when 'o' | 'O' =>
                O_Count := O_Count + 1;
            
            when 'u' | 'U' =>
                U_Count := U_Count + 1;
            
            when '.' =>
                Put("Occurances: ");
                New_Line;
                Put("A/a: ");
                Put(A_Count, Width=>1);
                New_Line;
                Put("E/e: ");
                Put(E_Count, Width=>1);
                New_Line;
                Put("I/i: ");
                Put(I_Count, Width=>1);
                New_Line;
                Put("O/o: ");
                Put(O_Count, Width=>1);
                New_Line;
                Put("U/u: ");
                Put(U_Count, Width=>1);
                New_Line;
                Put("=============");
                New_Line;
                Put("Total count: ");
                Total_Count := A_Count + E_Count + I_Count + O_Count + U_Count;
                Put(Total_Count, Width=>1);
                exit;
            
            when others =>
                null;
        end case;
    end loop;
end Vowels;
