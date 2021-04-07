with Ada.Text_IO;

procedure Loops is
begin
    Ada.Text_IO.Put_Line("1st loop");
    for I in 1 .. 3 loop
        Ada.Text_IO.Put(Integer'Image(I));
    end loop;

    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put_Line("2nd loop");
    for I in 3 .. 1 loop
        Ada.Text_IO.Put(Integer'Image(I));
    end loop;

    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put_Line("3rd loop");
    for I in reverse 1 .. 3 loop
        Ada.Text_IO.Put(Integer'Image(I));
    end loop;

    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put_Line("4th loop");
    for I in reverse 3 .. 1 loop
        Ada.Text_IO.Put(Integer'Image(I));
     end loop;
end Loops;
