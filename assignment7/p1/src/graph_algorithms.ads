-- Authors: Nicola Lea Libera (117073), Lucas Hübner (116232)
-- Philipp Tornow (118332)
--------------------------------------------------------------

with Ada.Unchecked_Deallocation;
with Ada.Containers.Generic_Array_Sort;
with Ada.Containers.Vectors;
with Graph;

generic
    type Vertex_Type is private;
    with function "="(Left: Vertex_Type; Right: Vertex_Type) return Boolean;
    with package Graph_Instance is new Graph(Vertex_Type, "=");
package Graph_Algorithms is
    use Graph_Instance;

    type Vertex_Array_Access is access all Vertex_Array;
    type Edge_Array_Access is access all Edge_Array;

    procedure Free_Vertices is new Ada.Unchecked_Deallocation(
        Vertex_Array, Vertex_Array_Access);

    procedure Free_Edges is new Ada.Unchecked_Deallocation(
        Edge_Array, Edge_Array_Access);

    -- Implements Dijkstra’s shortest-path algorithm in the given graph with
    -- edge weights. If a path exists, Path contains of the ordered sequence
    -- of vertices from From to To, excluding From and To.
    -- If no such path exists, Path will be empty.
    procedure Find_Shortest_Path(From: Vertex_Type; To: Vertex_Type; Path: out Vertex_Array_Access);

    -- Implements Kruskal’s minimal-spanning-tree algorithm in the given graph
    -- with edge weights. If the graph is connected, Result will hold the
    -- minimal spanning tree; otherwise, Result will hold the minimal spanning
    -- forest.
    procedure Find_Min_Spanning_Tree(Result: out Edge_Array_Access);

    private

        type Subset is record
           ParentIndex : Natural;
           Rank : Integer;
           Visited : Boolean;
        end record;

        type Subset_Array is array(Natural range <>) of Subset;

        procedure Update_Distances (Subsets : in out Subset_Array; Graph_Vertices_Array: Vertex_Array_Access; Vert_Idx : in Natural);

        function "<" (L, R : Edge_Type) return Boolean;
        procedure Sort is new Ada.Containers.Generic_Array_Sort(
            Index_Type => Natural,
            Element_Type => Edge_Type,
            Array_Type => Edge_Array
        );

        -- using Union-Find in O(log n) to determine if a cycle exists
        procedure Union(Subs : in out Subset_Array; ARootIndex : Natural; BRootIndex : Natural);
        function Find(Subs : in out Subset_Array; Idx : Natural) return Natural;

        package Result_Vertex_Vectors is new Ada.Containers.Vectors(
            Element_Type => Vertex_Type,
            Index_Type => Natural);

        package Result_Edge_Vectors is new Ada.Containers.Vectors(
            Element_Type => Edge_Type,
            Index_Type => Natural);

        use Result_Vertex_Vectors;
        use Result_Edge_Vectors;

        Result_Vertex_Vector: Result_Vertex_Vectors.Vector;
        Result_Edge_Vector: Result_Edge_Vectors.Vector;
        -- result vectors to itterativly push elements to the result

end Graph_Algorithms;