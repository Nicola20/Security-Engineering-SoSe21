--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: AUnit tests for the coffee machine
--------------------------------------------------------------

with AUnit;
with AUnit.Test_Cases;

use AUnit;
use AUnit.Test_Cases;

package Coffee_Tests is
	
	type Test is new Test_Case with null record;
	
	procedure Test_Initialization (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Insert_Ten_Cent (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Insert_Twenty_Cent (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Get_Coffee_Exactly(T : in out Test_Cases.Test_Case'Class);
	procedure Test_Get_Coffee_Overspending(T : in out Test_Cases.Test_Case'Class);
	procedure Test_Button_No_Money_Inserted (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Button_Money_Inserted (T : in out Test_Cases.Test_Case'Class);

	procedure Register_Tests(T: in out Test);
	function Name(T: Test) return Test_String;

end Coffee_Tests;
