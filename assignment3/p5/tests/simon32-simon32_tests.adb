with AUnit.Assertions;
with Simon32;

use AUnit.Assertions;
use Simon32;

package body Simon32.Simon32_Tests is
	
	procedure Register_Tests(T: in out Simon32_Test) is
	    use AUnit.Test_Cases.Registration;
	begin
	end Register_Tests;
	
	function Name(T: Simon32_Test) return Test_String is
	    pragma Unreferenced(T);
	begin
	    return Format("Simon32_Tests");
	end Name;
	
end Simon32.Simon32_Tests;
