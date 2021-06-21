--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: AUnit tests for the parallel computation
--              of the sum of arrayelements.
--------------------------------------------------------------

with AUnit;
with AUnit.Test_Cases;

use AUnit;
use AUnit.Test_Cases;

package Parallel_Sum_Tests is
	
	type Test is new Test_Case with null record;
	
    procedure Test_Complete_Sum_Integer(T : in out Test_Cases.Test_Case'Class);
    procedure Test_Complete_Sum_Natural(T : in out Test_Cases.Test_Case'Class);
	procedure Test_Small_Array(T : in out Test_Cases.Test_Case'Class);

	procedure Register_Tests(T: in out Test);
	function Name(T: Test) return Test_String;

end Parallel_Sum_Tests;
