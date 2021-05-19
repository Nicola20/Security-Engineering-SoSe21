package Hill_Climb is
    function Climb(Fitness : access function(X : Integer) return Integer;
                    Min, Max : Integer) return Integer;
    -- Performs Hill Climbing on the given Fitness Function within the
    -- range Min .. Max
end Hill_Climb;
