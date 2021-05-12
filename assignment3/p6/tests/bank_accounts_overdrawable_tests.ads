--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Aunit tests Bank_Accounts_Overdrawable declaration
--------------------------------------------------------------

with AUnit;
with AUnit.Test_Cases;

use AUnit;
use AUnit.Test_Cases;

package Bank_Accounts_Overdrawable_Tests is

	type Test is new Test_Case with null record;

	procedure Register_Tests(T: in out Test);
	function Name(T: Test) return Test_String;

	procedure Test_Get_Overdraft_Limit(T : in out Test_Cases.Test_Case'Class);
	procedure Test_Withdraw (T : in out Test_Cases.Test_Case'Class);
	procedure Test_Transfer (T : in out Test_Cases.Test_Case'Class);

end Bank_Accounts_Overdrawable_Tests;
