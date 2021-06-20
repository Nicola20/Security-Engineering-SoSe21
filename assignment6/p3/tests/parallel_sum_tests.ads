--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: AUnit tests for the coffee machine
--------------------------------------------------------------

with AUnit;
with AUnit.Test_Cases;

use AUnit;
use AUnit.Test_Cases;

package Parallel_Sum_Tests is
	
	type Test is new Test_Case with null record;
	
	--procedure Test_First_Partial_Sum (T : in out Test_Cases.Test_Case'Class);
	--procedure Test_Second_Partial_Sum (T : in out Test_Cases.Test_Case'Class);
    procedure Test_Complete_Sum_Integer(T : in out Test_Cases.Test_Case'Class);
    procedure Test_Complete_Sum_String(T : in out Test_Cases.Test_Case'Class);
    --procedure Test_Sum_Customized_Index(T : in out Test_Cases.Test_Case'Class);

	procedure Register_Tests(T: in out Test);
	function Name(T: Test) return Test_String;

end Parallel_Sum_Tests;
