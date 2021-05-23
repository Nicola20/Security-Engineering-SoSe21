--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Implementation of the hill climbing algorithm
--              computing the minimum of the given function.
--------------------------------------------------------------

with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Vectors;

package body Hill_Climb is
    function Climb(Fitness : access function(X : Integer) return Integer;
                    Min, Max : Integer) return Integer is
        subtype Random_Range is Integer range Min..Max;

        package R is new Ada.Numerics.Discrete_Random(Random_Range);
        use R;

        G : R.Generator;
        Best_Solution_Eval : Integer := Integer'Last;  -- This is f(x)
        Best_Solution : Integer;  -- This is x
        New_Best_Solution : Integer;
        Current_Best_Solution : Integer;
    begin
        R.Reset(G);
        for i in 0..(abs Min + abs Max) loop  -- maybe change this here because it is not working for reaaly large intervalls
        --for i in 1..3 loop
            Current_Best_Solution := R.Random(G);
            Ada.Text_IO.Put_Line("I am random starting point" & Integer'Image(Current_Best_Solution));
            New_Best_Solution := Find_Min(Current_Best_Solution, Fitness, Min, Max);
            Ada.Text_IO.Put_Line("I am best solution of one round" & Integer'Image(New_Best_Solution));
            -- Here implement check if new best solution is better than current and if so, then
            -- set new to current best
            if Fitness(New_Best_Solution) <= Best_Solution_Eval then
                Best_Solution := New_Best_Solution;
                Best_Solution_Eval := Fitness(New_Best_Solution);
            end if;
            Ada.Text_IO.Put_Line("I am best of one iteration" & Integer'Image(Best_Solution));
        end loop;
        Ada.Text_IO.Put_Line("I am finally best" & Integer'Image(Best_Solution));
        return Best_Solution;
    end Climb;

    function Find_Min(X : Integer; Fitness : access function(X : Integer) return Integer;
                Min, Max : Integer) return Integer is
        Current_Point : Integer := X;
        Step_Size : Integer := 1;
        Next_Eval : Integer := Integer'Last;
        Next_Point : Integer;
        Min_Not_Found : Boolean := True;

        package Integer_Vectors is new Ada.Containers.Vectors
            (Index_Type   => Natural,
            Element_Type => Integer);
        use Integer_Vectors;
        Neighbour_Vector : Vector;
    begin
        while Min_Not_Found = True loop
            Next_Eval := Integer'Last;
            Neighbour_Vector.Clear;
            if Current_Point - Step_Size >= Min then
                Neighbour_Vector.Append(Current_Point - Step_Size);
             --   Ada.Text_IO.Put_Line("Minus current");
             --   Ada.Text_IO.Put_Line(Integer'Image(Current_Point - Step_Size));
            end if;
            if Current_Point + Step_Size <= Max then
                Neighbour_Vector.Append(Current_Point + Step_Size);
              --  Ada.Text_IO.Put_Line("Plus current");
              --  Ada.Text_IO.Put_Line(Integer'Image(Current_Point + Step_Size));
            end if;
            for E of Neighbour_Vector loop  -- We check for the point/node with the smallest value
                --Ada.Text_IO.Put_Line("Evaluation");
                --Ada.Text_IO.Put_Line(Integer'Image(Fitness(E)));
                --Ada.Text_IO.Put_Line(Integer'Image(Next_Eval));
                if Fitness(E) <= Next_Eval then
                    Next_Point := E;
                    Next_Eval := Fitness(E);
                end if;
            end loop;
            --Ada.Text_IO.Put_Line("I am smallest Neighbour " & Integer'Image(Next_Point) &
            --" Fittness: " & Integer'Image(Fitness(Next_Point)));
            --Ada.Text_IO.Put_Line("I am current point " & Integer'Image(Current_Point) &
            --" Fittness: " & Integer'Image(Fitness(Current_Point)));


            if Fitness(Next_Point) <= Fitness(Current_Point) then
                Current_Point := Next_Point;
            elsif Fitness(Next_Point) > Fitness(Current_Point) then
                Min_Not_Found := False;
                return Current_Point;
            end if;
            --Ada.Text_IO.Put_Line("I am new current point" & Integer'Image(Current_Point) &
            --" Fittness: " & Integer'Image(Fitness(Current_Point)));
        end loop;
        return 0;
    end Find_Min;

end Hill_Climb;
