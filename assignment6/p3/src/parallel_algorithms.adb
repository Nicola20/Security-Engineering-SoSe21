--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Body of package that computes the sum of all
--				elements inside an array in parallel.
--------------------------------------------------------------
--with Ada.Text_IO;
--use Ada.Text_IO;
package body Parallel_Algorithms is

	procedure Parallel_Sum(Input: Array_Access_Type; Result: out Item_Type) is

		task type Parallel_Task is 
			entry Addition(From: Natural; To: Natural);
			entry Sum(Partial_Result: out Item_Type);
		end Parallel_Task;

		task body Parallel_Task is
			Total: Item_Type;
		begin
			accept Addition(From: Natural; To: Natural) do
				Total := Input(From);
				if (From + 1) <= To then
					for I in (From + 1)..To loop
						Total := Total + Input(I);
					end loop;
				end if;
			end Addition;
			accept Sum(Partial_Result: out Item_Type) do
				Partial_Result := Total;
			end Sum;
		end Parallel_Task;

		T1 : Parallel_Task;
		T2 : Parallel_Task;
		R1 : Item_Type;
		R2 : Item_Type;
		-- Compute the middle index of the array
		Middle : constant Natural := (Input'Length / 2) + Input'First;
	begin
		if Input'Length = 2 then
			T1.Addition(From => Input'First, To => Input'First);
			T2.Addition(From => Input'Last, To => Input'Last);
			T1.Sum(R1);
			T2.Sum(R2);
		else
			T1.Addition(From => Input'First, To => Middle);
			T2.Addition(From => (Middle + 1), To => Input'Last);
			T1.Sum(R1);
			T2.Sum(R2);
		end if;
		Result := R1 + R2;
	end Parallel_Sum;

end Parallel_Algorithms;