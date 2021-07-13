context with Graph;
        with Graph_Algorithms;
        with Ada.Text_IO;

        use Ada.Text_IO;

code    Put_line("Test Graph_Algorithms package.");
code    New_Line;
code    Put_line("Test Graph Creation.");

***** (1) Test Graph Creation
define
        subtype Vertex_Type is Integer;
        package Test_Graph is new Graph(Vertex_Type, "=");
        use Test_Graph;
        package Graph_Algorithms_Instance is new Graph_Algorithms(Vertex_Type, "=", Test_Graph);
        use Graph_Algorithms_Instance;
        Graph_Vertices_Array: Vertex_Array(1..8);
test

        Add_Vertex(1);
        Add_Vertex(2);
        Add_Vertex(3);
        Add_Vertex(4);
        Add_Vertex(5);
        Add_Vertex(6);
        Add_Vertex(7);
        Add_Vertex(8);

        Add_Edge(1,2,4);
        Add_Edge(1,3,3);
        Add_Edge(1,4,5);
        Add_Edge(2,4,3);
        Add_Edge(2,6,6);
        Add_Edge(3,4,2);
        Add_Edge(3,6,8);
        Add_Edge(4,5,5);
        Add_Edge(4,6,6);
        Add_Edge(4,7,5);
        Add_Edge(4,8,7);
        Add_Edge(5,8,6);
        Add_Edge(6,7,4);
        Add_Edge(7,8,2);

        Graph_Vertices_Array := To_Vertex_Array;
pass (Graph_Vertices_Array'Length = 8)
        AND Has_Edge(1, 2)
        AND Has_Edge(1, 3)
        AND Has_Edge(1, 4)
        AND Has_Edge(2, 4)
        AND Has_Edge(2, 6)
        AND Has_Edge(3, 4)
        AND Has_Edge(3, 6)
        AND Has_Edge(4, 5)
        AND Has_Edge(4, 6)
        AND Has_Edge(4, 7)
        AND Has_Edge(4, 8)
        AND Has_Edge(5, 8)
        AND Has_Edge(6, 7)
        AND Has_Edge(7, 8)
        AND (Graph_Vertices_Array(1) = 1)
        AND (Graph_Vertices_Array(2) = 2)
        AND (Graph_Vertices_Array(3) = 3)
        AND (Graph_Vertices_Array(4) = 4)
        AND (Graph_Vertices_Array(5) = 5)
        AND (Graph_Vertices_Array(6) = 6)
        AND (Graph_Vertices_Array(7) = 7)
        AND (Graph_Vertices_Array(8) = 8)

code    Put_line("Test Kruskal Algorithm.");

***** (2) Test Kruskal Algorithm with connected Testgraph
define
        subtype Vertex_Type is Integer;
        package Test_Graph is new Graph(Vertex_Type, "=");
        use Test_Graph;
        package Graph_Algorithms_Instance is new Graph_Algorithms(Vertex_Type, "=", Test_Graph);
        use Graph_Algorithms_Instance;
        Result_Spanning_Tree : Edge_Array_Access;
test
        Add_Vertex(1);
        Add_Vertex(2);
        Add_Vertex(3);
        Add_Vertex(4);
        Add_Vertex(5);
        Add_Vertex(6);
        Add_Vertex(7);
        Add_Vertex(8);

        Add_Edge(1,2,4);
        Add_Edge(1,3,3);
        Add_Edge(1,4,5);
        Add_Edge(2,4,3);
        Add_Edge(2,6,6);
        Add_Edge(3,4,2);
        Add_Edge(3,6,8);
        Add_Edge(4,5,5);
        Add_Edge(4,6,6);
        Add_Edge(4,7,5);
        Add_Edge(4,8,7);
        Add_Edge(5,8,6);
        Add_Edge(6,7,4);
        Add_Edge(7,8,2);

        Find_Min_Spanning_Tree(Result_Spanning_Tree);

pass        (Result_Spanning_Tree.all(0).Weight = 2)
        AND (Result_Spanning_Tree.all(1).Weight = 2)
        AND (Result_Spanning_Tree.all(2).Weight = 3)
        AND (Result_Spanning_Tree.all(3).Weight = 3)
        AND (Result_Spanning_Tree.all(4).Weight = 4)
        AND (Result_Spanning_Tree.all(5).Weight = 5)
        AND (Result_Spanning_Tree.all(6).Weight = 5)
