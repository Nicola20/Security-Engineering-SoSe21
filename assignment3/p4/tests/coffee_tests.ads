with AUnit;
with AUnit.Test_Cases;

use AUnit;
use AUnit.Test_Cases;

package Coffee_Tests is
	
	type Test is new Test_Case with null record;
	
	procedure Register_Tests(T: in out Test);
	function Name(T: Test) return Test_String;

end Coffee_Tests;
