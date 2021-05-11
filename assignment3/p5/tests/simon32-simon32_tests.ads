with AUnit;
with AUnit.Test_Cases;

use AUnit;
use AUnit.Test_Cases;

package Simon32.Simon32_Tests is

	type Simon32_Test is new Test_Case with null record;

	procedure Register_Tests(T: in out Simon32_Test);
	function Name(T: Simon32_Test) return Test_String;

   procedure Test_Raising_Exception(T: in out Test_Cases.Test_Case'Class);
   procedure Test_Encrypt(T: in out Test_Cases.Test_Case'Class);
   procedure Test_Decrypt(T: in out Test_Cases.Test_Case'Class);
   procedure Test_Enc_Seclusion(T: in out Test_Cases.Test_Case'Class);
   procedure Test_Dec_Seclusion(T: in out Test_Cases.Test_Case'Class);
private

end Simon32.Simon32_Tests;
