--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Declarations for the hill climbing algorithm
--------------------------------------------------------------

package Hill_Climb is
    function Climb(Fitness : access function(X : Integer) return Integer;
                    Min, Max : Integer) return Integer;
    -- Performs Hill Climbing on the given Fitness Function within the
    -- range Min .. Max

    private
    function Find_Min(X : Integer; Fitness : access function(X : Integer) return Integer;
                    Min, Max : Integer) return Integer;
end Hill_Climb;
