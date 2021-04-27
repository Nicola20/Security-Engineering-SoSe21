with GF2n, Ada.Text_IO; 

procedure test_gf2n is 
    package T_IO renames Ada.Text_IO;
    package I_IO is new Ada.Text_IO.Integer_IO (Integer);

    type Polynome is mod 2**8;
    package g1 is new GF2n (Element_Type => Polynome, P => 19);
    p1 : Polynome := 7;
    p2 : Polynome := 3;
    result : Polynome;
begin
    result := g1."+"(p1, p2);
    T_IO.put_line(result'Image);
    result := g1."-"(p1, p2);
    T_IO.put_line (result'Image);
    result := g1."*" (p1, p2);
    T_IO.put_line (result'Image);
    result := g1.GCD(p1, p2);
    T_IO.put_line (result'Image);
end test_gf2n;
