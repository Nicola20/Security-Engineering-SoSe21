--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Aunit tests simon32 definition
--------------------------------------------------------------

with AUnit.Assertions;
with Simon32;

use AUnit.Assertions;
use Simon32;

package body Simon32.Simon32_Tests is

   procedure Test_Raising_Exception (T : in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Assert_Exception (Test_Dec_Raising_Exception'Access, "Decryption doesn't raise exception");
      Assert_Exception (Test_Dec_Raising_Exception'Access, "Encryption doesn't raise exception");
   end Test_Raising_Exception;

	procedure Test_Encrypt (T : in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Key : constant Block_64 := (25, 24, 17, 16, 9, 8, 1, 0);
      PlainText : constant Block_32 := (101, 101, 104, 119);
      ChipherText : constant Block_32 := (198, 155, 233, 187);
      tmp : Block_32;
   begin
      Prepare_Key(Key);
      tmp := Encrypt(PlainText);
      Assert (tmp = ChipherText, "Encryption is incorrect");
   end Test_Encrypt;

   procedure Test_Decrypt (T : in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Key : constant Block_64 := (25, 24, 17, 16, 9, 8, 1, 0);
      PlainText : constant Block_32 := (101, 101, 104, 119);
      ChipherText : constant Block_32 := (198, 155, 233, 187);
      tmp : Block_32;
   begin
      Prepare_Key(Key);
      tmp := Decrypt(ChipherText);
      Assert (tmp = PlainText, "Decryption is incorrect");
   end Test_Decrypt;

   procedure Test_Dec_Seclusion (T : in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Key : constant Block_64 := (25, 24, 17, 16, 9, 8, 1, 0);
      PlainText : constant Block_32 := (101, 101, 104, 119);
   begin
      Prepare_Key(Key);
      Assert (PlainText = Decrypt(Encrypt(PlainText)), "Decryption is Secluded");
   end Test_Dec_Seclusion;

   procedure Test_Enc_Seclusion (T : in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Key : constant Block_64 := (25, 24, 17, 16, 9, 8, 1, 0);
      ChipherText : constant Block_32 := (198, 155, 233, 187);
   begin
      Prepare_Key(Key);
      Assert (ChipherText = Encrypt(Decrypt(ChipherText)), "Encryption is Secluded");
   end Test_Enc_Seclusion;

	procedure Register_Tests(T: in out Simon32_Test) is
	    use AUnit.Test_Cases.Registration;
	begin
      Register_Routine(T, Test_Raising_Exception'Access, "Test Exception");
      Register_Routine(T, Test_Encrypt'Access, "Test Encrypt");
      Register_Routine(T, Test_Decrypt'Access, "Test Decrypt");
      Register_Routine(T, Test_Enc_Seclusion'Access, "Test Enc. Seclusion");
      Register_Routine(T, Test_Dec_Seclusion'Access, "Test Dec. Seclusion");
	end Register_Tests;

	function Name(T: Simon32_Test) return Test_String is
	    pragma Unreferenced(T);
	begin
	    return Format("Simon32_Tests");
	end Name;

end Simon32.Simon32_Tests;
