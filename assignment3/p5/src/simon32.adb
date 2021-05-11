--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Implementation of rational numbers definition
--------------------------------------------------------------

package body Simon32 is

   function Decrypt(Ciphertext: in Block_32) return Block_32 is
      x : Unsigned_16 := Shift_Left(Unsigned_16(Ciphertext(0)), 8) + Unsigned_16(Ciphertext(1)); -- subcipher x_i
      y : Unsigned_16 := Shift_Left(Unsigned_16(Ciphertext(2)), 8) + Unsigned_16(Ciphertext(3)); -- subcipher x_i+1
      Plaintext : Block_32;
   begin
      if not Cipher_Initialized then
         raise Cipher_Not_Initialized_Exception;
      end if;

      Round_Function(y, x);
      
      Plaintext(0) := Byte(Shift_Right(x, 8));
      Plaintext(1) := Byte(x - Shift_Left(Unsigned_16(Plaintext(0)), 8));
      Plaintext(2) := Byte(Shift_Right(y, 8));
      Plaintext(3) := Byte(y - Shift_Left(Unsigned_16(Plaintext(2)), 8));
      --  Put_Line("Dec: " & Plaintext(0)'Image & " " & Plaintext(1)'Image & 
      -- " " & Plaintext(2)'Image & " " & Plaintext(3)'Image);
      return Plaintext;
   end Decrypt;

   function Encrypt(Plaintext: in Block_32) return Block_32 is
      x : Unsigned_16 := Shift_Left(Unsigned_16(Plaintext(0)), 8) + Unsigned_16(Plaintext(1)); -- subcipher x_i
      y : Unsigned_16 := Shift_Left(Unsigned_16(Plaintext(2)), 8) + Unsigned_16(Plaintext(3)); -- subcipher x_i+1
      Ciphertext : Block_32;
   begin
      if not Cipher_Initialized then
         raise Cipher_Not_Initialized_Exception;
      end if;
      
      Round_Function(x, y);
      
      Ciphertext(0) := Byte(Shift_Right(x, 8));
      Ciphertext(1) := Byte(x - Shift_Left(Unsigned_16(Ciphertext(0)), 8));
      Ciphertext(2) := Byte(Shift_Right(y, 8));
      Ciphertext(3) := Byte(y - Shift_Left(Unsigned_16(Ciphertext(2)), 8));
      --  Put_Line("Enc: " & Ciphertext(0)'Image & " " & Ciphertext(1)'Image & 
      -- " " & Ciphertext(2)'Image & " " & Ciphertext(3)'Image);
      return Ciphertext;
   end Encrypt;
    
   procedure Prepare_Key(Key: in Block_64) with 
     Refined_Post => (for some i in Round_Keys'Range => Round_Keys(i) /= Round_Keys'Old(i))
   is     
      n : constant Positive := 2**16; -- Word size
      m : constant Positive := 4; -- num key words
      all_ones : constant Word := Word((-1) mod n); -- largest word
      tmp : Unsigned_16; -- tmp for shifting
 
      type a is array (Integer range <>) of Word;
      z0 : constant a (0 .. 61) := (1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 
                                    0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 
                                    1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 
                                    1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0);
      
      k : constant a (0 .. m - 1):= (Word(Shift_Left(Unsigned_16(Key(0)), 8) + Unsigned_16(Key(1))),
                                     Word(Shift_Left(Unsigned_16(Key(2)), 8) + Unsigned_16(Key(3))),
                                     Word(Shift_Left(Unsigned_16(Key(4)), 8) + Unsigned_16(Key(5))),
                                     Word(Shift_Left(Unsigned_16(Key(6)), 8) + Unsigned_16(Key(7))));
   begin
      Round_Keys(0) := k(0);
      Round_Keys(1) := k(1);
      Round_Keys(2) := k(2);
      Round_Keys(3) := k(3);
      
      for i in m .. Num_Rounds - 1 loop
         tmp := Rotate_Right(Unsigned_16(Round_Keys(i - 1)), 3);
         tmp := tmp xor Unsigned_16(Round_Keys(i - 3));
         tmp := tmp xor Rotate_Right(tmp, 1);
         Round_Keys(i) := (all_ones xor Round_Keys(i - m)) xor Word(tmp) xor z0((i - m) mod 62) xor Word(3);
      end loop;
   
      Cipher_Initialized := True;
   
   end Prepare_Key;
   
   procedure Round_Function(x, y : in out Unsigned_16) is      
      tmp : Unsigned_16;
   begin
      for i in 0 .. Num_Rounds - 1 loop
         tmp := x;
         x := y xor (Rotate_Left(x, 1) and Rotate_Left(x, 8)) xor Rotate_Left(x, 2);
         x := x xor Unsigned_16(Round_Keys(i));
         y := tmp;
      end loop;
   end Round_Function;
   
   procedure Test_Enc_Raising_Exception is
      A, B : Block_32;
   begin
      A := Encrypt(B);
   end Test_Enc_Raising_Exception;
   
   procedure Test_Dec_Raising_Exception is
      A, B : Block_32;
   begin
      A := Decrypt(B);
   end Test_Dec_Raising_Exception;
   
end Simon32;

