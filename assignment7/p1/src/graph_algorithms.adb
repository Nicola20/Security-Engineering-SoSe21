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
        Graph_Vertices_Array: Vertex_Array_Access := new Vertex_Array'(To_Vertex_Array); --convert to vertex array access
        Graph_Edges_Array: Edge_Array_Access := new Edge_Array'(To_Edge_Array); --convert to vertex array access

        Subsets : Subset_Array(0..Graph_Vertices_Array.all'Length);
        A : Natural;
        B : Natural;

    begin
        if Graph_Vertices_Array.all'Length = 0 then
            Result := new Edge_Array(1..0);
        else
            if not (Graph_Edges_Array.all'Length = 0) then
                -- sort vertices according to their weight
                Sort(Graph_Edges_Array.all);

                -- initialize subsets / setting parents and rank for union find
                for S in Subsets'Range loop
                   Subsets(S).ParentIndex := S;
                   Subsets(S).Rank := 0;
                end loop;

                -- itterate over all edges and try to include them in a subset to
                New_Line(1);
                Put_Line("Minimal Spanning Tree/Forest:");
                for E in Graph_Edges_Array.all'Range loop
                    -- get subsets (compressed tree) for each vertex of an edge
                    A := find(Subsets, Get_Index_Of(Graph_Edges_Array.all(E).From));
                    B := find(Subsets, Get_Index_Of(Graph_Edges_Array.all(E).To));

                    -- circle criteria is that no edge/vertex has the same representative / root
                    if not (A = B) then
                        Union(Subsets, A, B);
                        Put_Edge(Graph_Edges_Array.all(E));
                        New_Line(1);
                        Result_Vector.Append(Graph_Edges_Array.all(E));
                   end if;
                end loop;

                -- construct result
                Result := new Edge_Array(Result_Vector.First_Index..Result_Vector.Last_Index);
                for R in Result_Vector.First_Index..Result_Vector.Last_Index loop
                    Result.all(R) := Result_Vector(R);
                end loop;
                Result_Vector.Clear;
                Put_Line("---------------");
            else
                Result := new Edge_Array(1..0);
            end if;
        end if;

        Free_Vertices(Graph_Vertices_Array);
        Free_Edges(Graph_Edges_Array);
    end Find_Min_Spanning_Tree;

    -- sorting function according to the weight
    function "<" (L, R : Edge_Type) return Boolean is
    begin
        return L.Weight < R.Weight;
    end "<";

    -- inspired by https://www.geeksforgeeks.org/union-find-algorithm-set-2-union-by-rank/ 08.07.21
    -- union find algorithm to determine circles
    procedure Union(Subs : in out Subset_Array; ARootIndex : Natural; BRootIndex : Natural) is
    begin
        if Subs(ARootIndex).Rank < Subs(BRootIndex).Rank then
            Subs(ARootIndex).ParentIndex := BRootIndex;
        elsif Subs(ARootIndex).Rank > Subs(BRootIndex).Rank then
            Subs(BRootIndex).ParentIndex := ARootIndex;
        else
            Subs(BRootIndex).ParentIndex := ARootIndex;
            Subs(BRootIndex).Rank := Subs(BRootIndex).Rank + 1;
        end if;

    end Union;

    function Find(Subs : in out Subset_Array; Idx : Natural) return Natural is
        Result : Vertex_Type;
    begin
        if not (Subs(Idx).ParentIndex = Idx) then
            Subs(Idx).ParentIndex := Find(Subs, Subs(Idx).ParentIndex);
        end if;
        return Subs(Idx).ParentIndex;
    end Find;


end Graph_Algorithms;