with AUnit.Assertions;

use AUnit.Assertions;

package body Frac_Tests is

    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
        Register_Routine(T, Test_Constructor_Onehalf'Access,
            "Test constructor for 1/2.");
        Register_Routine(T, Test_Addition'Access,
            "Test Addition.");
        Register_Routine(T, Test_Subtraction'Access,
            "Test Subtraction.");
        Register_Routine(T, Test_Multiplication'Access,
            "Test Multiplication.");
        Register_Routine(T, Test_Division'Access,
            "Test Division.");
        Register_Routine(T, Test_Equality'Access,
            "Test Equality.");
        Register_Routine(T, Test_Greater_Comparison'Access,
            "Test_Greater_Comparison.");
        Register_Routine(T, Test_Smaller_Comparison'Access,
            "Test_Smaller_Comparison.");
        Register_Routine(T, Test_Sign_Positive'Access,
            "Test_Sign_Positive.");
        Register_Routine(T, Test_Sign_Null'Access,
            "Test_Sign_Zero.");
        Register_Routine(T, Test_Sign_Negative'Access,
            "Test_Sign_Negative.");
    end Register_Tests;

    -- ---------------------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("RationalNumber_Tests");
    end Name;

    -- ---------------------------------------------------------------

    procedure Set_Up (T : in out Test) is
        pragma Unreferenced(T);
    begin
        F1_p := Create_Fraction(1,2);
        F2_p := Create_Fraction(1,4);
        F3_n := Create_Fraction(-3,4);
        F4_0 := Create_Fraction(0,5);
        F5_1 := Create_Fraction(3,3);
        F6_p := Create_Fraction(6,2);
    end Set_Up;

    -- ---------------------------------------------------------------

    procedure Test_Constructor_OneHalf (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        Frac_Test : Fraction;
        Numerator : constant Integer := 1;
        Denumerator : constant Integer := 2;
    begin
        Frac_Test := Create_Fraction(Numerator, Denumerator);
        Assert(Get_Numerator(Frac_Test) = Numerator,"Frac Creation Failed.");
        Assert(Get_Denumerator(Frac_Test) = Denumerator,"Frac Creation Failed.");
    end Test_Constructor_OneHalf;


    procedure Test_Constructor_NegativeDenummerator(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        Frac_Test : Fraction;
        Numerator : constant Integer := 1;
        Denumerator : constant Integer := -2;
    begin
        Frac_Test := Create_Fraction(Numerator, Denumerator);
        Assert(Get_Numerator(Frac_Test) = Numerator,"Frac creation for a negaive denumerator failed.");
        Assert(Get_Denumerator(Frac_Test) = Denumerator,"Frac creation for a negative denumerator failed.");
    end Test_Constructor_NegativeDenummerator;

	procedure Test_Constructor_NegativeNumerator (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        Frac_Test : Fraction;
        Numerator : constant Integer := -1;
        Denumerator : constant Integer := 2;
    begin
        Frac_Test := Create_Fraction(Numerator, Denumerator);
        Assert(Get_Numerator(Frac_Test) = Numerator,"Frac creation for a negative Numerator failed.");
        Assert(Get_Denumerator(Frac_Test) = Denumerator,"Frac creation for a negative Numerator failed.");
    end Test_Constructor_NegativeNumerator;

    procedure Test_Constructor_NegativeComponents (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        Frac_Test : Fraction;
        Numerator : constant Integer := -1;
        Denumerator : constant Integer := -2;
    begin
        Frac_Test := Create_Fraction(Numerator, Denumerator);
        Assert(Get_Numerator(Frac_Test) = Numerator,"Frac creation for a negative components failed.");
        Assert(Get_Denumerator(Frac_Test) = Denumerator,"Frac creation for a negative components failed.");
    end Test_Constructor_NegativeComponents;

	procedure Test_Addition (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);

        R1_p : Fraction;
        R2_p : Fraction;
        R3_1 : Fraction;
        R4_n : Fraction;
        R5_0 : Fraction;
        R6_n : Fraction;
        R7_n : Fraction;
        R8_p : Fraction;

    begin
        R1_p := F1_p + F2_p;
        R2_p := F1_p + F2_p + F1_p;
        R3_1 := F1_p + F1_p;
        R4_n := F2_p + F3_n;
        R5_0 := F1_p + F2_p + F3_n;
        R6_n := F3_n + F1_P;
        R7_n := F3_n + F3_n;
        R8_p := F1_p + F4_0;

        Assert(Get_Numerator(R1_p) = 3,"Frac addition failed.");
        Assert(Get_Denumerator(R1_p) = 4,"Frac addition failed.");

        Assert(Get_Numerator(R2_p) = 5,"Multiple frac addition to greater 1 failed.");
        Assert(Get_Denumerator(R2_p) = 4,"Multiple frac addition to greater 1 failed.");

        Assert(Get_Numerator(R3_1) = 1,"Frac addition to 1 failed.");
        Assert(Get_Denumerator(R3_1) = 1,"Frac addition to 1 failed.");

        Assert(Get_Numerator(R4_n) = -1,"Frac addition with negative result failed.");
        Assert(Get_Denumerator(R4_n) = 2,"Frac addition with negative result failed.");

        Assert(Get_Numerator(R5_0) = 0,"Frac addition to 0 failed.");
        Assert(Get_Denumerator(R5_0) = 1,"Frac addition to 0 failed.");

        Assert(Get_Numerator(R6_n) = -1,"Frac addition negative + positive failed.");
        Assert(Get_Denumerator(R6_n) = 4,"Frac addition negative + positive failed.");

        Assert(Get_Numerator(R7_n) = -3,"Frac addition negative + negative failed.");
        Assert(Get_Denumerator(R7_n) = 2,"Frac addition negative + negative failed.");

        Assert(Get_Numerator(R8_p) = 1,"Frac add 0 failed.");
        Assert(Get_Denumerator(R8_p) = 2,"Frac add 0 failed.");

    end Test_Addition;

    procedure Test_Subtraction (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        R1_p : Fraction;
        R2_p : Fraction;
        R3_1 : Fraction;
        R4_n : Fraction;
        R5_0 : Fraction;
        R6_n : Fraction;
        R7_n : Fraction;
        R8_p : Fraction;
    begin
        R1_p := F1_p - F2_p;
        R2_p := F6_p - F2_p  - F1_p;
        R3_1 := F6_p - F5_1 - F5_1;
        R4_n := F2_p - F1_p;
        R5_0 := F1_p - F2_p - F2_p;
        R6_n := F3_n - F2_P;
        R7_n := R4_n - F3_n;
        R8_p := F1_p - F4_0;

        Assert(Get_Numerator(R1_p) = 1,"Frac subtraction failed.");
        Assert(Get_Denumerator(R1_p) = 4,"Frac subtraction failed.");

        Assert(Get_Numerator(R2_p) = 9,"Multiple frac subtraction to greater 1 failed.");
        Assert(Get_Denumerator(R2_p) = 4,"Multiple frac subtraction to greater 1 failed.");

        Assert(Get_Numerator(R3_1) = 1,"Frac subtraction to 1 failed.");
        Assert(Get_Denumerator(R3_1) = 1,"Frac subtraction to 1 failed.");

        Assert(Get_Numerator(R4_n) = -1,"Frac subtraction with negative result failed.");
        Assert(Get_Denumerator(R4_n) = 4,"Frac subtraction with negative result failed.");

        Assert(Get_Numerator(R5_0) = 0,"Frac subtraction to 0 failed.");
        Assert(Get_Denumerator(R5_0) = 1,"Frac subtraction to 0 failed.");

        Assert(Get_Numerator(R6_n) = -1,"Frac subtraction negative - positive failed.");
        Assert(Get_Denumerator(R6_n) = 1,"Frac subtraction negative - positive failed.");

        Assert(Get_Numerator(R7_n) = 1,"Frac subtraction negative - negative failed.");
        Assert(Get_Denumerator(R7_n) = 2,"Frac subtraction negative - negative failed.");

        Assert(Get_Numerator(R8_p) = 1,"Frac subtract 0 failed.");
        Assert(Get_Denumerator(R8_p) = 2,"Frac subtract 0 failed.");

    end Test_Subtraction;

	procedure Test_Multiplication(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        R1_p : Fraction;
        R2_n : Fraction;
        R3_p : Fraction;
        R4_0 : Fraction;
    begin
        R1_p := F5_1 * F1_p;
        R2_n := F3_n * F1_p;
        R3_p := R2_n * F3_n;
        R4_0 := F2_p * F4_0;

        Assert(Get_Numerator(R1_p) = 1,"Frac multiplication failed.");
        Assert(Get_Denumerator(R1_p) = 2,"Frac multiplication failed.");

        Assert(Get_Numerator(R2_n) = -3,"Frac multiplication negativ * positiv failed.");
        Assert(Get_Denumerator(R2_n) = 8,"Frac multiplication negativ * positiv failed.");

        Assert(Get_Numerator(R3_p) = 9,"Frac multiplication negativ * negative failed.");
        Assert(Get_Denumerator(R3_p) = 32,"Frac multiplication negativ * negativ failed.");

        Assert(Get_Numerator(R4_0) = 0,"Frac multiplication with 0 failed.");
        Assert(Get_Denumerator(R4_0) = 1,"Frac multiplication with 0 failed.");

    end Test_Multiplication;

	procedure Test_Division(T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        R1_p : Fraction;
        R2_n : Fraction;
        R3_p : Fraction;
    begin
        R1_p := F1_p / F2_p;
        R2_n := F3_n / F1_p;
        R3_p := R2_n / F3_n;

        Assert(Get_Numerator(R1_p) = 2,"Frac division failed.");
        Assert(Get_Denumerator(R1_p) = 1,"Frac division failed.");

        Assert(Get_Numerator(R2_n) = -3,"Frac division negativ / positiv failed.");
        Assert(Get_Denumerator(R2_n) = 2,"Frac division negativ / positiv failed.");

        Assert(Get_Numerator(R3_p) = 2,"Frac division negativ / negative failed.");
        Assert(Get_Denumerator(R3_p) = 1,"Frac division negativ / negativ failed.");
    end Test_Division;

	procedure Test_Equality (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
        F7_p : Fraction;
        F8_n : Fraction;
    begin

        F7_p := Create_Fraction(2,4);
        F8_n :=  Create_Fraction(-1,2);

        Assert(F1_p /= F2_p, "Frac equality check failed.");
        Assert(F1_p = F7_p, "Frac equality check failed.");
        Assert(F1_p /= F8_n ,"Frac equality check with negative variant failed.");

    end Test_Equality;

	procedure Test_Smaller_Comparison (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
    begin
        Assert(F2_p < F1_p, "Frac smaller comparison failed.");
        Assert(F3_n < F2_p, "Frac smaller comparison with negative frac failed.");
        Assert(F4_0 < F1_p, "Frac smaller comparison with zero failed.");
    end Test_Smaller_Comparison;

	procedure Test_Greater_Comparison (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
    begin
        Assert(F1_p > F2_p, "Frac greater comparison failed.");
        Assert(F2_p > F3_n, "Frac greater comparison with negative frac failed.");
        Assert(F1_p > F4_0, "Frac greater comparison with zero failed.");
    end Test_Greater_Comparison;

	procedure Test_Sign_Positive (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
    begin
        Assert(Sign(F1_p) = 1, "Frac sign positive failed.");
    end Test_Sign_Positive;

	procedure Test_Sign_Negative (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
    begin
        Assert(Sign(F3_n) = -1, "Frac sign null failed.");
    end Test_Sign_Negative;

	procedure Test_Sign_Null (T : in out Test_Cases.Test_Case'Class) is
        pragma Unreferenced(T);
    begin
        Assert(Sign(F4_0) = 0, "Frac sign negative failed.");
    end Test_Sign_Null;

end Frac_Tests;
