with GNAT.SHA1;
With Ada.Text_IO;
with Brent_context;
with Parallel_Brent;

procedure Main is
   package BC is new Brent_Context (Num_Colliding_Bits => 4, Num_State_Bits => 160, Num_Tasks => 1);
   package PB is new Parallel_Brent (Context => BC);
   use BC, PB, Ada.Text_IO, GNAT.SHA1;

   first : Point_Type;
   second : Point_Type;
begin

   first.Hash := Digest("hello");
   second.Hash := Digest(first.Hash);
   Search_Collision(first, second);
   put_line(first.Preimage & " -> " & first.Hash);
   put_line(second.Preimage & " -> " & second.Hash);
end Main;
