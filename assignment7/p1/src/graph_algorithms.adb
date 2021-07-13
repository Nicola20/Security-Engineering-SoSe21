with Ada.Text_IO;
package body Graph_Algorithms is
    use Graph_Instance;
    use Ada.Text_IO;

    -- Implements Dijkstra’s shortest-path algorithm in the given graph with
    -- edge weights. If a path exists, Path contains of the ordered sequence
    -- of vertices from From to To, excluding From and To.
    -- If no such path exists, Path will be empty.
    --procedure Find_Shortest_Path(From: Vertex_Type; To: Vertex_Type; Path: out Vertex_Array_Access);

    -- Implements Kruskal’s minimal-spanning-tree algorithm in the given graph
    -- with edge weights. If the graph is connected, Result will hold the
    -- minimal spanning tree; otherwise, Result will hold the minimal spanning
    -- forest.
    procedure Find_Min_Spanning_Tree(Result: out Edge_Array_Access) is
        Graph_Vertices_Array: Vertex_Array := To_Vertex_Array; --convert to vertex array
        Graph_Edges_Array: Edge_Array := To_Edge_Array; --convert to edge array

    begin
        if Graph_Vertices_Array'Length = 0 then
            Result := new Edge_Array(1..0);
        else
            if not (Graph_Edges_Array'Length = 0) then
                Sort(Graph_Edges_Array); --sort vertices according to their weight

                for E in Graph_Edges_Array'Range loop
                   Put_Line(Graph_Edges_Array(E).Weight'Image);
                end loop;
            else
                Result := new Edge_Array(1..0);
            end if;
        end if;
    end Find_Min_Spanning_Tree;

    -- sorting function according to the weight
    function "<" (L, R : Edge_Type) return Boolean is
    begin
        return L.Weight < R.Weight;
    end "<";

    -- inspired by https://www.geeksforgeeks.org/union-find-algorithm-set-2-union-by-rank/ 08.07.21
    -- union find algorithm to determine circles
    procedure Union(Subs : in out Subset_Array; Xroot : Natural; Yroot : Natural) is
    begin
        if Subs(Xroot).Rank < Subs(Yroot).Rank then
            Subs(Xroot).Parent := Yroot;
        elsif Subs(Xroot).Rank > Subs(Yroot).Rank then
            Subs(Yroot).Parent := Xroot;
        else
            Subs(Yroot).Parent := Xroot;
            Subs(Yroot).Rank := Subs(Yroot).Rank + 1;
        end if;

    end Union;

    function Find(Subs : in out Subset_Array; Idx : Natural) return Natural is
        Result : Natural;
    begin
        if not (Subs(Idx).Parent = Idx) then
            Subs(Idx).Parent := Find(Subs, Subs(Idx).Parent);
        end if;
        return Subs(Idx).parent;
    end Find;


end Graph_Algorithms;