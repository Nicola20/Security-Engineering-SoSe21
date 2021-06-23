-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: le parallel brent
--------------------------------------------------------------

with Brent_Context;

generic
    with package Context is new Brent_Context(<>);
package Parallel_Brent is
   use Context;
   No_collision_found : exception;
   procedure Search_Collision (First: out Point_Type; Second: out Point_Type);
end Parallel_Brent;
