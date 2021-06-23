-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: le parallel brent
--------------------------------------------------------------

generic
    Num_Colliding_Bits: Natural;
    Num_State_Bits: Natural; -- 160 for SHA-1
    Num_Tasks: Natural;
package Brent_Context is
   NUM_BITS_PER_CHAR : constant Natural := 4;
   NUM_STATE_CHARS: constant Natural := Num_State_Bits / NUM_BITS_PER_CHAR;
   
   subtype Hash_Type is String (1 .. NUM_STATE_CHARS);
   subtype Bin_Type is String(1 .. Num_State_Bits);
     
   type Point_Type is record
       Preimage: Hash_Type;
       Hash: Hash_Type;
   end record;

   function "="(Left: Point_Type; Right: Point_Type) return Boolean;
   function "="(Left: Hash_Type; Right: Hash_Type) return Boolean;
   function to_binary_string(hex : Hash_Type) return Bin_Type;
   function Compute_Hash(Input: Hash_Type) return Hash_Type;
end Brent_Context;
