with AUnit;
with AUnit.Test_Cases;
with Rational_Numbers;

use AUnit;
use AUnit.Test_Cases;

use Rational_Numbers;

package Frac_Tests is

	type Test is new Test_Case with null record;

	procedure Register_Tests(T: in out Test);
	function Name(T: Test) return Test_String;

	-- fixture elements
	F1_p : Fraction;
	F2_p : Fraction;
	F3_n : Fraction;
	F4_0 : Fraction;
	F5_1 : Fraction;
	F6_p : Fraction;
	procedure Set_Up (T : in out Test);

	procedure Test_Constructor_OneHalf (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Constructor_NegativeDenummerator(T : in out Test_Cases.Test_Case'Class);
	procedure Test_Constructor_NegativeNumerator (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Constructor_NegativeComponents (T : in out Test_Cases.Test_Case'Class);

	procedure Test_Addition (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Subtraction (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Multiplication(T : in out Test_Cases.Test_Case'Class);
	procedure Test_Division(T : in out Test_Cases.Test_Case'Class);

	procedure Test_Equality (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Smaller_Comparison (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Greater_Comparison (T : in out Test_Cases.Test_Case'Class);

	procedure Test_Sign_Positive (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Sign_Negative (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Sign_Null (T : in out Test_Cases.Test_Case'Class);

end Frac_Tests;
