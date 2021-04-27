-- Nicola Lea Libera (117073)
-- Philipp Tornow (118332)
-- Lucas Hübner (116232)

package body GF2n is
    function "+"(X: Element_Type; Y: Element_Type) return Element_Type is
    begin
        return X xor Y;
    end "+";

    function "-"(X: Element_Type; Y: Element_Type) return Element_Type is
    begin
        return X + Y;
    end "-";

    function "*"(X: Element_Type; Y: Element_Type) return Element_Type is
        type custom_arry is array (Integer range <>) of Boolean;
        tmp_m : custom_arry (0 .. Element_Type'Size * 2) :=  (others => False);
        tmp_p : custom_arry (0 .. Element_Type'Size) :=  (others => False);
        largest_index_m : Integer := 0;
        largest_index_p : Integer := 0;
        T : Integer := 0;
    begin
        -- multiplication, store bit representation in tmp_m bool array
        for i in 0 .. Element_Type'Size - 1 loop
            if (Element_Type(2**i) and X) > Element_Type(0) then
                for j in 0 ..  Element_Type'Size - 1 loop
                    if (Element_Type(2**j) and Y) > Element_Type(0) then
                        if tmp_m(i + j) then
                            tmp_m(i + j) := False; 
                        else 
                            tmp_m(i + j) := True;
                        end if;
                    end if;
                end loop;
            end if;
        end loop;

        -- get largest index
        for i in tmp_m'Range loop
            if tmp_m(i) then
                largest_index_m := i;
            end if;
        end loop;

        -- store bit representation of primitive P in tmp_p bool array, get largest index
        for i in 0 .. Element_Type'Size - 1 loop
            if (Element_Type(2**i) and P) > Element_Type(0) then
                tmp_p(i) := True;
                largest_index_p := i;
            end if;
        end loop;

        -- modulus operation (long division -> mult. Result modolus primitive p)
        for i in 0 .. largest_index_m - largest_index_p loop
            if tmp_m(largest_index_m - i) then
                for j in 0 .. largest_index_p loop
                    if tmp_m(largest_index_m - i - j) /= tmp_p(largest_index_p - j) then
                        tmp_m(largest_index_m - i - j) := True;
                    else 
                        tmp_m (largest_index_m - i - j) := False;
                    end if;
                end loop;
            end if;
        end loop;

        -- create result
        for i in reverse tmp_m'Range loop
            if tmp_m(i) then
                T := T + 2**i;
            end if;
        end loop;

        return Element_Type(T);
    end "*";

    function "/"(X: Element_Type; Y: Element_Type) return Element_Type is
    begin
        return X * (Find_Inverse(Y) mod P);
    end "/";

    function Find_Inverse(X: Element_Type) return Element_Type is
    begin
        return X;
    end Find_Inverse;

    function GCD(X: Element_Type; Y: Element_Type) return Element_Type is
        -- https://rosettacode.org/wiki/Greatest_common_divisor#Ada
        M : Element_Type := X;
        N : Element_Type := Y;
        T : Element_Type;
    begin
        while N /= 0 loop
            T := M;
            M := N;
            N := T mod N;
        end loop;
        return M;
    end GCD;

    function Is_Primitive(X: Element_Type) return Boolean is
        T : Element_Type := X;
    begin
        T := T + X;
        return false;
    end Is_Primitive;
end GF2n;