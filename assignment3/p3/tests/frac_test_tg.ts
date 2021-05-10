context with Rational_Numbers;
        with Ada.Text_IO; use Ada.Text_IO;

code    Put_line("Test Rational_Number package.");

***** (1) Generate Fraction
define  I1 : constant Integer := 1;
        I2 : constant Integer := 2;
        R1 : Integer;
        F1 : Fraction;
test    F1 := Rational_Numbers.Create_Fraction(I1, I2);
        R1 := Rational_Numbers.Get_Numerator(F1);
pass    (R1 = I1)

code Ada.Text_IO.Put_line("All tests done.");