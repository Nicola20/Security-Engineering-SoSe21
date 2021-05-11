context with Rational_Numbers;
        with Ada.Text_IO;
        use Ada.Text_IO;
        use Rational_Numbers;

code    Put_line("Test Rational_Number package.");
        New_Line;
        Put_line("Test Create Fraction");

***** (1) Generate Fraction
define  I1 : constant Integer := 1;
        I2 : constant Integer := 2;
        R1 : Integer;
        R2 : Integer;
        F1 : Fraction;
test    F1 := Create_Fraction(I1, I2);
        R1 := Get_Numerator(F1);
        R2 := Get_Denumerator(F1);
pass    (R1 = I1) AND (R2 = I2)

code Put_line("Test Create Negative Fraction");

***** (2) Generate Negative Fraction
define  I1 : constant Integer := -1;
        I2 : constant Integer := 2;
        R1 : Integer;
        R2 : Integer;
        F1 : Fraction;
test    F1 := Create_Fraction(I1, I2);
        R1 := Get_Numerator(F1);
        R2 := Get_Denumerator(F1);
pass    (R1 = I1) AND (R2 = I2)

code Put_line("Test Create Fraction and input negative components");

***** (3) Generate Fraction with Negative Components
define  I1 : constant Integer := -1;
        I2 : constant Integer := -2;
        R1 : Integer;
        R2 : Integer;
        F1 : Fraction;
test    F1 := Create_Fraction(I1, I2);
        R1 := Get_Numerator(F1);
        R2 := Get_Denumerator(F1);
pass    (R1 = 1) AND (R2 = 2)

code Put_line("Test Fraction Addition");

***** (4) Fraction Addition
define  F1_p : Fraction;
        F2_p : Fraction;
        F3_n : Fraction;
        F4_0 : Fraction;

        R1_p : Fraction;
        R2_p : Fraction;
        R3_1 : Fraction;
        R4_n : Fraction;
        R5_0 : Fraction;
        R6_n : Fraction;
        R7_n : Fraction;
        R8_p : Fraction;

prepare F1_p := Create_Fraction(1,2);
        F2_p := Create_Fraction(1,4);
        F3_n := Create_Fraction(-3,4);
        F4_0 := Create_Fraction(0,5);

test    R1_p := F1_p + F2_p;
        R2_p := F1_p + F2_p + F1_p;
        R3_1 := F1_p + F1_p;
        R4_n := F2_p + F3_n;
        R5_0 := F1_p + F2_p + F3_n;
        R6_n := F3_n + F1_P;
        R7_n := F3_n + F3_n;
        R8_p := F1_p + F4_0;

pass    (Get_Numerator(R1_p) = 3)
        AND (Get_Denumerator(R1_p) = 4)

        AND (Get_Numerator(R2_p) = 5)
        AND (Get_Denumerator(R2_p) = 4)

        AND (Get_Numerator(R3_1) = 1)
        AND (Get_Denumerator(R3_1) = 1)

        AND (Get_Numerator(R4_n) = -1)
        AND (Get_Denumerator(R4_n) = 2)

        AND (Get_Numerator(R5_0) = 0)
        AND (Get_Denumerator(R5_0) = 1)

        AND (Get_Numerator(R6_n) = -1)
        AND (Get_Denumerator(R6_n) = 4)

        AND (Get_Numerator(R7_n) = -3)
        AND (Get_Denumerator(R7_n) = 2)

        AND (Get_Numerator(R8_p) = 1)
        AND (Get_Denumerator(R8_p) = 2)

code Put_line("Test Fraction Subtraction");

***** (5) Fraction Subtraction
define  F1_p : Fraction;
        F2_p : Fraction;
        F3_n : Fraction;
        F4_0 : Fraction;
        F5_1 : Fraction;
        F6_p : Fraction;

        R1_p : Fraction;
        R2_p : Fraction;
        R3_1 : Fraction;
        R4_n : Fraction;
        R5_0 : Fraction;
        R6_n : Fraction;
        R7_n : Fraction;
        R8_p : Fraction;

prepare
        F1_p := Create_Fraction(1,2);
        F2_p := Create_Fraction(1,4);
        F3_n := Create_Fraction(-3,4);
        F4_0 := Create_Fraction(0,5);
        F5_1 := Create_Fraction(3,3);
        F6_p := Create_Fraction(6,2);
test
        R1_p := F1_p - F2_p;
        R2_p := F6_p - F2_p  - F1_p;
        R3_1 := F6_p - F5_1 - F5_1;
        R4_n := F2_p - F1_p;
        R5_0 := F1_p - F2_p - F2_p;
        R6_n := F3_n - F2_P;
        R7_n := R4_n - F3_n;
        R8_p := F1_p - F4_0;

pass    (Get_Numerator(R1_p) = 1)
        AND(Get_Denumerator(R1_p) = 4)

        AND(Get_Numerator(R2_p) = 9)
        AND(Get_Denumerator(R2_p) = 4)

        AND(Get_Numerator(R3_1) = 1)
        AND(Get_Denumerator(R3_1) = 1)

        AND(Get_Numerator(R4_n) = -1)
        AND(Get_Denumerator(R4_n) = 4)

        AND(Get_Numerator(R5_0) = 0)
        AND(Get_Denumerator(R5_0) = 1)

        AND(Get_Numerator(R6_n) = -1)
        AND(Get_Denumerator(R6_n) = 1)

        AND(Get_Numerator(R7_n) = 1)
        AND(Get_Denumerator(R7_n) = 2)

        AND(Get_Numerator(R8_p) = 1)
        AND(Get_Denumerator(R8_p) = 2)

code Put_line("Test Fraction Multiplication");

***** (6) Fraction Multiplication
define
        F1_p : Fraction;
        F2_p : Fraction;
        F3_n : Fraction;
        F4_0 : Fraction;
        F5_1 : Fraction;

        R1_p : Fraction;
        R2_n : Fraction;
        R3_p : Fraction;
        R4_0 : Fraction;

prepare F1_p := Create_Fraction(1,2);
        F2_p := Create_Fraction(1,4);
        F3_n := Create_Fraction(-3,4);
        F4_0 := Create_Fraction(0,5);
        F5_1 := Create_Fraction(3,3);

test    R1_p := F5_1 * F1_p;
        R2_n := F3_n * F1_p;
        R3_p := R2_n * F3_n;
        R4_0 := F2_p * F4_0;

pass (Get_Numerator(R1_p) = 1)
        AND (Get_Denumerator(R1_p) = 2)

        AND (Get_Numerator(R2_n) = -3)
        AND (Get_Denumerator(R2_n) = 8)

        AND (Get_Numerator(R3_p) = 9)
        AND (Get_Denumerator(R3_p) = 32)

        AND (Get_Numerator(R4_0) = 0)
        AND (Get_Denumerator(R4_0) = 1)


code Put_line("Test Fraction Division");

***** (7) Fraction Division
define  F1_p : Fraction;
        F2_p : Fraction;
        F3_n : Fraction;

        R1_p : Fraction;
        R2_n : Fraction;
        R3_p : Fraction;

prepare F1_p := Create_Fraction(1,2);
        F2_p := Create_Fraction(1,4);
        F3_n := Create_Fraction(-3,4);

test    R1_p := F1_p / F2_p;
        R2_n := F3_n / F1_p;
        R3_p := R2_n / F3_n;

pass    (Get_Numerator(R1_p) = 2)
        AND(Get_Denumerator(R1_p) = 1)

        AND(Get_Numerator(R2_n) = -3)
        AND(Get_Denumerator(R2_n) = 2)

        AND(Get_Numerator(R3_p) = 2)
        AND(Get_Denumerator(R3_p) = 1)

code Put_line("Test Fraction Equality");

***** (8) Fraction Equality
define  F1_p : Fraction;
        F2_p : Fraction;
        F7_p : Fraction;
        F8_n : Fraction;

test    F1_p := Create_Fraction(1,2);
        F2_p := Create_Fraction(1,4);
        F7_p := Create_Fraction(2,4);
        F8_n :=  Create_Fraction(-1,2);

pass    (F1_p /= F2_p)
        AND (F1_p = F7_p)
        AND (F1_p /= F8_n)

code Put_line("Test Fraction Smaller Comparison");

***** (9) Fraction Smaller Comparison
define  F1_p : Fraction;
        F2_p : Fraction;
        F3_n : Fraction;
        F4_0 : Fraction;

test
        F1_p := Create_Fraction(1,2);
        F2_p := Create_Fraction(1,4);
        F3_n := Create_Fraction(-3,4);
        F4_0 := Create_Fraction(0,5);

pass    (F2_p < F1_p)
        AND (F3_n < F2_p)
        AND (F4_0 < F1_p)

code Put_line("Test Fraction Greater Comparison");

***** (10) Fraction Greater Comparison
define  F1_p : Fraction;
        F2_p : Fraction;
        F3_n : Fraction;
        F4_0 : Fraction;

test    F1_p := Create_Fraction(1,2);
        F2_p := Create_Fraction(1,4);
        F3_n := Create_Fraction(-3,4);
        F4_0 := Create_Fraction(0,5);

pass    (F1_p > F2_P)
        AND(F2_p > F3_n)
        AND(F1_p > F4_0)

code Put_line("Test Sign Positive Fraction");

***** (11) Fraction Sign Positive
define  Result : Sign_Type;
        F1_p : Fraction;

prepare F1_p := Create_Fraction(1,2);
test    Result := Sign(F1_p);
pass    Result = 1

code Put_line("Test Sign Negative");

***** (12) Fraction Sign Negative
define  Result : Sign_Type;
        F3_n : Fraction;

prepare F3_n := Create_Fraction(-3,4);
test    Result := Sign(F3_n);
pass    Result = -1

code Put_line("Test Fraction Sign 0");

***** (13) Fraction Sign Null
define  Result : Sign_Type;
        F4_0 : Fraction;

prepare F4_0 := Create_Fraction(0,5);
test    Result := Sign(F4_0);
pass    Result = 0

code Ada.Text_IO.Put_line("All tests done.");
