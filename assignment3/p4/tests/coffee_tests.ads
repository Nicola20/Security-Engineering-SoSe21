with AUnit;
with AUnit.Test_Cases;

use AUnit;
use AUnit.Test_Cases;

package Coffee_Tests is
	
	type Test is new Test_Case with null record;
	
	procedure Register_Tests(T: in out Test);
	function Name(T: Test) return Test_String;

	procedure Test_Initialization (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Insert_Money (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Get_Coffee (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Money_Back (T : in out Test_Cases.Test_Case'Class);

end Coffee_Tests;
