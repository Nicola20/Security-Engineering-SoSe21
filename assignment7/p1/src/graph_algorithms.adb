package body Graph_Algorithms is
    --use Graph_Instance;

    -- Implements Dijkstra’s shortest-path algorithm in the given graph with
    -- edge weights. If a path exists, Path contains of the ordered sequence
    -- of vertices from From to To, excluding From and To.
    -- If no such path exists, Path will be empty.
    --procedure Find_Shortest_Path(From: Vertex_Type;
    --                            To: Vertex_Type;
    --                            Path: out Vertex_Array_Access);

    -- Implements Kruskal’s minimal-spanning-tree algorithm in the given graph
    -- with edge weights. If the graph is connected, Result will hold the
    -- minimal spanning tree; otherwise, Result will hold the minimal spanning
    -- forest.
    procedure Find_Min_Spanning_Tree(Result: out Vertex_Array_Access) is
    begin
        
    end Find_Min_Spanning_Tree;

end Graph_Algorithms;