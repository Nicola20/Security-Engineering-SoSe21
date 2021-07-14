with Ada.Text_IO;
package body Graph_Algorithms is
    use Ada.Text_IO;

    -- Implements Dijkstra’s shortest-path algorithm in the given graph with
    -- edge weights. If a path exists, Path contains of the ordered sequence
    -- of vertices from From to To, excluding From and To.
    -- If no such path exists, Path will be empty.
    procedure Find_Shortest_Path(From: Vertex_Type; To: Vertex_Type; Path: out Vertex_Array_Access) is
        Graph_Vertices_Array: Vertex_Array_Access := new Vertex_Array'(To_Vertex_Array); --convert to vertex array access
        From_Index : constant Natural := Get_Index_Of(From);
        To_Index : constant Natural := Get_Index_Of(To);
        Idx : Natural := 0;

        Smallest_Distance : Integer := Integer'Last;
        Next_Vertex_Idx : Natural := From_Index;

        Subsets : Subset_Array(0..Graph_Vertices_Array.all'Length-1); --used for backtracking and to store distances to start

    begin
        Result_Vertex_Vector.Clear;

        if Graph_Vertices_Array.all'Length = 0 then
            Path := new Vertex_Array(0..1);
        elsif not (To_Edge_Array'Length = 0) then
                -- initialize subsets / setting previous vertex for backtracking and distances to max
                for S in Subsets'Range loop
                    Subsets(S).ParentIndex := S;
                    Subsets(S).Rank := Integer'Last;
                    Subsets(S).Visited := False;
                end loop;

                Subsets(From_Index).Rank:= 0;
                Subsets(From_Index).Visited:= True;

                --itterate by shortest weight edge and update distances to start node
                Update_Distances(Subsets, Graph_Vertices_Array, Next_Vertex_Idx);

                -- itterate over all vertices driven by the smallest edge weight
                for I in 0..Graph_Vertices_Array.all'Length-1 loop

                    Smallest_Distance := Integer'Last;

                    -- itterate over all Vertices to determine vertex with minimal distance value
                    for V in Subsets'Range loop
                        if not (Subsets(V).Visited) AND Subsets(V).Rank <= Smallest_Distance AND NOT(V=From_Index) then
                            Smallest_Distance := Subsets(V).Rank;
                            Next_Vertex_Idx := V;
                        end if;
                    end loop;
                    Update_Distances(Subsets, Graph_Vertices_Array, Next_Vertex_Idx);
                    Subsets(Next_Vertex_Idx).Visited := True;
                end loop;

                Next_Vertex_Idx := To_Index;

                if Subsets(To_Index).ParentIndex = To_Index then
                    Path := new Vertex_Array(1..0);
                else
                    Put_Line(Subsets(To_Index).Rank'Image & ", " & Subsets(To_Index).ParentIndex'Image);
                    while not (Next_Vertex_Idx = From_Index) AND Idx < Graph_Vertices_Array.all'Length-1 loop
                        Next_Vertex_Idx := Subsets(Next_Vertex_Idx).ParentIndex;
                        Result_Vertex_Vector.Append(Graph_Vertices_Array.all(Next_Vertex_Idx));
                        Idx:= Idx +1;
                    end loop;

                    --construct result vector
                    Path := new Vertex_Array(Result_Vertex_Vector.First_Index..Result_Vertex_Vector.Last_Index-1);
                    New_Line(1);
                    Put_Line("Path:");
                    Idx := 0;
                    for R in reverse Result_Vertex_Vector.First_Index..Result_Vertex_Vector.Last_Index-1 loop
                        Path.all(Idx) := Result_Vertex_Vector(R);
                        Put_Vert(Result_Vertex_Vector(R));
                        New_Line(1);
                        Idx := Idx+1;
                    end loop;
                    Put_Line("Minimal length: " & Subsets(To_Index).Rank'Image);
                    Put_Line("---------------");

                    Result_Vertex_Vector.Clear;
                    Free_Vertices(Graph_Vertices_Array);
                end if;
            else
                Path := new Vertex_Array(1..0);
            end if;
    end Find_Shortest_Path;

    -- updates distances of verts if an edge vert-adjver exists, the weight of the edge distance of vert is smaller
    -- than the current distance and the adjvert is not visited yet
    procedure Update_Distances (Subsets : in out Subset_Array; Graph_Vertices_Array: Vertex_Array_Access; Vert_Idx : in Natural) is
        Weight : Integer := Integer'Last;
        Vert : constant Vertex_Type := Graph_Vertices_Array.all(Vert_Idx);
    begin
        --itterate over all vertices to check for an edge
        for V in 0..Graph_Vertices_Array.all'Length-1 loop
            if Has_Edge(Vert, Graph_Vertices_Array.all(V)) AND Not(Subsets(Vert_Idx).Rank = Integer'Last) then
                Weight := Get_Edge_Weight(Vert, Graph_Vertices_Array.all(V)) + Subsets(Vert_Idx).Rank;
                if Weight < Subsets(V).Rank then
                    Subsets(V).Rank := Weight;
                    Subsets(V).ParentIndex := Vert_Idx;
                end if;
                Weight := Integer'Last;
            end if;
        end loop;
    end Update_Distances;

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
        Result_Edge_Vector.Clear;
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
                   Subsets(S).Visited := False;
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
                        Result_Edge_Vector.Append(Graph_Edges_Array.all(E));
                   end if;
                end loop;

                -- construct result
                Result := new Edge_Array(Result_Edge_Vector.First_Index..Result_Edge_Vector.Last_Index);
                for R in Result_Edge_Vector.First_Index..Result_Edge_Vector.Last_Index loop
                    Result.all(R) := Result_Edge_Vector(R);
                end loop;
                Result_Edge_Vector.Clear;
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
    begin
        if not (Subs(Idx).ParentIndex = Idx) then
            Subs(Idx).ParentIndex := Find(Subs, Subs(Idx).ParentIndex);
        end if;
        return Subs(Idx).ParentIndex;
    end Find;


end Graph_Algorithms;