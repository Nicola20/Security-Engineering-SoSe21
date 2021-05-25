with Lists, Ada.Text_IO;
use Ada.Text_IO;

procedure Test is
    package L is new Lists(Item_Type => Integer);
    use L;
    t : List_Type;
    i : List_Iterator_Type;
begin
    t := Create_List;
    t.Append(Integer(3)); -- 3
    t.Prepend(Integer(1)); -- 1 3
    t.Append(Integer(4)); -- 1 3 4
    i := Succ(t.First);
    Insert(i, 2);   -- 1 2 3 4
    i := Succ(t.Last);
    Insert(i, 6); -- 1 2 3 4 6
    i := Pred(t.Last);
    Insert(i, 5); -- 1 2 3 4 5 6
    i := Succ(Succ(Pred(Succ(t.First))));
    Delete(i); -- 1 2 4 5 6
    i:= t.First;
    Put_line("testing append, prepend, insert, delete");
    for n in 1..Size(t) loop
        Put( Value(i)'image);
        i := Succ(i);
    end loop;
    New_Line;
    Put_Line("expected:");
    Put_Line(" 1 2 4 5 6");
end Test;