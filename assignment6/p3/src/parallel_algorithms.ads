--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Declaration of package that computes the sum 
--              of all elements inside an array
--				in parallel.
--------------------------------------------------------------
generic
    type Item_Type is private;
    with function "+"(Left: Item_Type; Right: Item_Type) return Item_Type;
package Parallel_Algorithms is

    type Array_Type is array(Natural range <>) of Item_Type;
    type Array_Access_Type is access all Array_Type;

    procedure Parallel_Sum(Input: Array_Access_Type; Result: out Item_Type);
    
end Parallel_Algorithms;