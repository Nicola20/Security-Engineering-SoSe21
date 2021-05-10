--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Implementation of rational numbers definition
--------------------------------------------------------------

with Ada.Text_IO;

package body Rational_Numbers is

    package TEXTIO renames Ada.Text_IO;

    function Create_Fraction(N, D : Integer) return Fraction is
        Frac : Fraction;
    begin
        if D < 0 then
            Frac.Num := -N;
            Frac.Den := -D;
        else
            Frac.Num := N;
            Frac.Den := D;
        end if;
        return Frac;
    end Create_Fraction;

    procedure Put(X: Fraction) is
    begin
        TEXTIO.Put(X.Num'Image);
        TEXTIO.Put("/");
        TEXTIO.Put(X.Den'Image);
        TEXTIO.New_Line;
    end Put;

    function "+"(Lhs : Fraction; Rhs : Fraction) return Fraction is
        Result : Fraction;
        ComDen : Integer;
    begin
        ComDen := Lhs.Den * Rhs.Den;
        Result := Create_Fraction((Lhs.Num * Rhs.Den) + (Rhs.Num * Lhs.Den), ComDen);
        reduce(Result);
        return Result;
    end "+";

    function "-"(Lhs : Fraction; Rhs : Fraction) return Fraction is
        Result : Fraction;
        ComDen : Integer;
    begin
        ComDen := Lhs.Den * Rhs.Den;
        Result := Create_Fraction((Lhs.Num * Rhs.Den) - (Rhs.Num * Lhs.Den), ComDen);
        Reduce(Result);
        return Result;
    end "-";

    function "*"(Lhs : Fraction; Rhs : Fraction) return Fraction is
        Result : Fraction;
    begin
        Result := Create_Fraction(Lhs.Num * Rhs.Num, Lhs.Den * Rhs.Den);
        Reduce(Result);
        return Result;
    end "*";

    function "/"(Lhs : Fraction; Rhs : Fraction) return Fraction is
        Result : Fraction;
    begin
        Result := Create_Fraction(Lhs.Num * Rhs.Den, Lhs.Den * Rhs.Num);
        Reduce(Result);
        return Result;
    end "/";

    function "="(Lhs : Fraction; Rhs : Fraction) return Boolean is
        Lhs_Ext : Integer;
        Rhs_Ext : Integer;
        Result : Boolean;
    begin
        Lhs_Ext := Lhs.Num * Rhs.Den;
        Rhs_Ext := Rhs.Num * Lhs.Den;

        if Lhs_Ext = Rhs_Ext then
            Result := true;
        else
            Result := false;
        end if;
        return Result;
    end "=";

    function "<"(Lhs : Fraction; Rhs : Fraction) return Boolean is
        Lhs_Ext : Integer;
        Rhs_Ext : Integer;
        Result : Boolean;
    begin
        Lhs_Ext := Lhs.Num * Rhs.Den;
        Rhs_Ext := Rhs.Num * Lhs.Den;

        if Lhs_Ext < Rhs_Ext then
            Result := true;
        else
            Result := false;
        end if;
        return Result;
    end "<";

    function ">"(Lhs : Fraction; Rhs : Fraction) return Boolean is
        Lhs_Ext : Integer;
        Rhs_Ext : Integer;
        Result : Boolean;
    begin
        Lhs_Ext := Lhs.Num * Rhs.Den;
        Rhs_Ext := Rhs.Num * Lhs.Den;

        if Lhs_Ext > Rhs_Ext then
            Result := true;
        else
            Result := false;
        end if;
        return Result;
    end ">";

    function Sign(X : Fraction) return Sign_Type is
        S : Sign_Type;
    begin
        if X.Num = 0 then
            S := 0;
        elsif X.Num < 0 then
            S := -1;
        else
            S := 1;
        end if;
        return S;
    end Sign;

    procedure reduce(F : in out Fraction) is
        Xt : Natural := abs F.Num;
        Yt : Natural := abs F.Den;
        Temp : Natural;
    begin
        while (Yt /= 0) loop
           Temp := Xt;
           Xt := Yt;
           Yt := Temp mod Yt;
        end loop;

        F.Num := F.Num / Xt;
        F.Den := F.Den / Xt;
    end reduce;

    function Get_Numerator (F : Fraction) return Integer is
    begin
        return F.Num;
    end Get_Numerator;

    function Get_Denumerator (F : Fraction) return Integer is
    begin
        return F.Den;
    end Get_Denumerator;

end Rational_Numbers;
