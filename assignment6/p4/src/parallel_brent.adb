with Parallel_brent;
with Ada.Numerics.Discrete_Random;
with Ada.Calendar; use Ada.Calendar;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Task_Identification; use Ada.Task_Identification;

package body Parallel_Brent is

   procedure Search_Collision (First: out Point_Type; Second: out Point_Type) is
      type randRange is range 1..10;
      package Rand is new Ada.Numerics.Discrete_Random(randRange);
      gen : Rand.Generator;
      collision_detected : Boolean := False;
      force_quit : Boolean := False;

      -- Task type to enable multiple tasks of same type
      Task type Find_Cycle is
         entry rand_offset(N : Natural);
      end;

      -- actual cycle finding algorithm in a single task
      Task body Find_Cycle is
         Lam: Integer := 1;
         Mu : Integer := 0;
         Power: Integer := 1;
         offset : Natural;
         Tortoise : Point_Type := First;
         Hare : Point_Type := Second;
      begin
         -- sync with main task
         accept rand_offset (N : Natural) do
            offset := N;
         end rand_offset;

         -- apply random offset. Shift tort and hare away from start
         while offset > 0 loop
            if force_quit or collision_detected then
               exit;
            end if;

            Tortoise.Preimage := Tortoise.Hash;
            Tortoise.Hash := Context.Compute_Hash(Tortoise.Hash);

            Hare.Preimage := Hare.Hash;
            Hare.Hash := Context.Compute_Hash(Hare.Hash);

            offset := offset - 1;
         end loop;

         -- Brent algorithm
         -- main phase: search successive powers of two
         while Tortoise /= Hare loop
            if force_quit or collision_detected then
               exit;
            end if;

            if Power = Lam then
               Tortoise := Hare;
               Power := Power * 2;
               Lam := 0;
            end if;

            Hare.Preimage := Hare.Hash;
            Hare.Hash := Context.Compute_Hash(Hare.Hash);
            Lam := Lam + 1;
         end loop;

         -- Find the position of the first repetition of Lambda
         Tortoise := First;
         Hare := First;
         for I in 0..Lam - 1 loop
            if force_quit or collision_detected then
               exit;
            end if;
            Hare.Preimage := Hare.Hash;
            Hare.Hash := Context.Compute_Hash(Hare.Hash);
         end loop;

         -- Next, the hare and tortoise move at same speed until they agree
         while Tortoise /= Hare loop
            if force_quit or collision_detected then
               exit;
            end if;

            Tortoise.Preimage := Tortoise.Hash;
            Tortoise.Hash := Context.Compute_Hash(Tortoise.Hash);

            Hare.Preimage := Hare.Hash;
            Hare.Hash := Context.Compute_Hash(Hare.Hash);

            Mu := Mu + 1;
         end loop;

         -- check if preimages are different and if cicle start exists
         if Mu /= 0 and String(Tortoise.Preimage) /= String(Hare.Preimage) then
            collision_detected := True;
            First := Tortoise;
            Second := Hare;
         else
            force_quit := True;
            raise No_collision_found with
              "Failed to find collision. Initial value must have been in a cycle";
         end if;
      end Find_Cycle;

      -- array containing the number of tasks
      Task_Pool : array(1..Context.Num_Tasks) of Find_Cycle;

      Task Quit_Button;
      Task body Quit_Button is
         key_input : Character;
         key_down : Boolean;
      begin
         loop
            Get_Immediate(key_input, key_down);
            if key_input = 'q' then
               force_quit := True;
            end if;
            exit when force_quit or collision_detected;
         end loop;
      end Quit_Button;

      Task Quit_Duration;
      Task body Quit_Duration is
         start_time : Time := Clock;
         max_Duration_s : Duration := Duration(300); -- stop exectution after 300 seconds
      begin
         loop
            if Clock - start_time > max_Duration_s then
               force_quit := True;
            end if;
            exit when force_quit or collision_detected;
         end loop;
      end Quit_Duration;

   begin
      -- sync tasks with random offset so they arn't the same
      for I in Task_Pool'Range loop
         Rand.Reset(gen);
         Task_Pool(I).rand_offset(Integer(Rand.Random(gen)));
      end loop;

      -- wait untill colision is detected or force stop occurs
      loop
         --  exit when force_quit or collision_detected;
         if force_quit then
            Abort_Task(Quit_Duration'Identity);
            Abort_Task(Quit_Button'Identity);
            raise No_collision_found with "Force quit.";
         elsif collision_detected then
            Abort_Task(Quit_Duration'Identity);
            Abort_Task(Quit_Button'Identity);
            exit;
         end if;
      end loop;
   end Search_Collision;
end Parallel_Brent;
