with Interfaces;

package Simon32 is
   use Interfaces;
   type Byte is mod 2**8;
   type Word is mod 2**16;
    
   for Byte'Size use 8;
   for Word'Size use 16;
    
   type Bytes is array (Integer range <>) of Byte;
   type Words is array (Integer range <>) of Word;
    
   type Block_32 is new Bytes(0..3);
   type Block_64 is new Bytes(0..7);
   
   Cipher_Initialized : Boolean := False;
   Cipher_Not_Initialized_Exception: exception;
    
   -- Decrypts the given ciphertext block and returns the corresponding 
   -- plaintext block. Requires that a key was given by calling Prepare_Key
   -- before; raises a Cipher_Not_Initialized_Exception otherwise.
   function Decrypt(Ciphertext: in Block_32) return Block_32 with
     Post => Encrypt(Decrypt'Result) = Ciphertext;
     
   -- Encrypts the given plaintext block and returns the corresponding 
   -- ciphertext block. Requires that a key was given by calling Prepare_Key
   -- before; raises a Cipher_Not_Initialized_Exception otherwise.
   function Encrypt(Plaintext: in Block_32) return Block_32 with 
     Post => Decrypt(Encrypt'Result) = Plaintext;
   
   -- Generates the round keys from the given cipher key. 
   -- Must be invoked before any en- or decryption can happen.
   procedure Prepare_Key(Key: in Block_64);
   
   procedure Round_Function(x,y : in out Unsigned_16);
   
   procedure Test_Enc_Raising_Exception;
   procedure Test_Dec_Raising_Exception;
       
private
   Num_Rounds: constant Positive := 32;
   Num_State_Words: constant Positive := 2;
    
   type Key_Type is array(0..Num_Rounds - 1) of Word;
   
   Round_Keys: Key_Type;
end Simon32;

