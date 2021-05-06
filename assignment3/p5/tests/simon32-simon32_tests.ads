with AUnit;
with AUnit.Test_Cases;

use AUnit;
use AUnit.Test_Cases;

package Simon32.Simon32_Tests is

	type Simon32_Test is new Test_Case with null record;

	procedure Register_Tests(T: in out Simon32_Test);
	function Name(T: Simon32_Test) return Test_String;


private

end Simon32.Simon32_Tests;
