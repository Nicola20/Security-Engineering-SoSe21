with AUnit.Assertions;
with Rational_Numbers;

use AUnit.Assertions;
use Rational_Numbers;

package body Frac_Tests is

    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
        Register_Routine(T, Test_Constructor_Onehalf'Access,
            "Test constructor for 1/2");
    end Register_Tests;

    -- ---------------------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("RationalNumber_Tests");
    end Name;

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


    --procedure Test_Constructor_NegativeDenummerator(T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Constructor_NegativeDenummerator;

	--procedure Test_Constructor_NegativeNumerator (T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Constructor_NegativeNumerator;

	--procedure Test_Constructor_NegativeComponents (T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Constructor_NegativeComponents;

	--procedure Test_Addition (T : in out Test_Cases.Test_Case'Class)
    --begin
    --end Test_Addition;

	--procedure Test_Subtraction (T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Subtraction;

	--procedure Test_Multiplication(T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Multiplication;

	--procedure Test_Division(T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Division;

	--procedure Test_Equality_Same (T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Equality_Same;

	--procedure Test_Equality_Multiple (T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Equality_Multiple;

	--procedure Test_Smaller_Comparison (T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Smaller_Comparison;

	--procedure Test_Greater_Comparison (T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Greater_Comparison;

	--procedure Test_Sign_Positive (T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Sign_Positive;

	--procedure Test_Sign_Negaitve (T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Sign_Negaitve;

	--procedure Test_Sign_Null (T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Sign_Null;

	--procedure Test_Reduction (T : in out Test_Cases.Test_Case'Class) is
    --begin
    --end Test_Reduction;

end Frac_Tests;
