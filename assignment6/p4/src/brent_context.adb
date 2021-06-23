-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: le parallel brent
--------------------------------------------------------------

with Brent_context;
with GNAT.SHA1;
with Ada.Text_IO; use Ada.Text_IO;

package body Brent_Context is

   function "="(Left: Point_Type; Right: Point_Type) return Boolean is
   begin
      return Left.Hash = Right.Hash;
    end "=";

   function "="(Left: Hash_Type; Right: Hash_Type) return Boolean is
      left_bin : Bin_Type := to_binary_string(Left);
      right_bin : Bin_Type := to_binary_string(Right);
   begin
      for I in 1..Num_Colliding_Bits loop
         if left_bin(I) /= right_bin(I) then
            return False;
         end if;
      end loop;
      return True;
   end "=";

   function Compute_Hash(Input: Hash_Type) return Hash_Type is
   begin
       return GNAT.SHA1.Digest(Input);
   end Compute_Hash;

   function to_binary_string(hex : Hash_Type) return Bin_Type is
      subtype hex_string is String(1..NUM_BITS_PER_CHAR);
      hex_str : hex_string;
      count : Integer;

      subtype bin_string is String(1..NUM_STATE_CHARS);
      bin_str : Bin_Type;

      -- convert int to binary
      -- https://rosettacode.org/wiki/Binary_digits#Ada
      bit : array (0..1) of character := ('0','1');
      function bin_image (n : Natural) return string is
      (if n < 2 then (1 => bit (n)) else bin_image (n / 2) & bit (n mod 2));

   begin
      for I in Hash_Type'Range loop
         for n in 1..NUM_BITS_PER_CHAR loop
            hex_str(n) := '0';
         end loop;

         count := NUM_BITS_PER_CHAR;
         for n in reverse bin_image(Integer'Value("16#" & hex(I) & "#"))'Range loop
            hex_str(count) :=  bin_image(Integer'Value("16#" & hex(I) & "#"))(n);
            count := count - 1;
         end loop;

         for n in hex_str'Range loop
            bin_str((I-1) * NUM_BITS_PER_CHAR + n) := hex_str(n);
         end loop;
      end loop;
      return bin_str;
   end to_binary_string;

end Brent_Context;
