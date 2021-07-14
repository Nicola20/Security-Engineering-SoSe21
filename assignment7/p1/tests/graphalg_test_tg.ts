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
        AND Has_Edge(2, 1)
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

code    New_Line;
code    Put_line("Test Kruskal Algorithm with connected Testgraph.");

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

pass    (Result_Spanning_Tree.all'Length = 7)
        AND (Result_Spanning_Tree.all(0).Weight = 2)
        AND (Result_Spanning_Tree.all(1).Weight = 2)
        AND (Result_Spanning_Tree.all(2).Weight = 3)
        AND (Result_Spanning_Tree.all(3).Weight = 3)
        AND (Result_Spanning_Tree.all(4).Weight = 4)
        AND (Result_Spanning_Tree.all(5).Weight = 5)
        AND (Result_Spanning_Tree.all(6).Weight = 5)


code    New_Line;
code    Put_line("Test Kruskal Algorithm with empty graph.");

***** (3) Test Kruskal Algorithm with empty graph
define
        subtype Vertex_Type is Integer;
        package Test_Graph is new Graph(Vertex_Type, "=");
        use Test_Graph;
        package Graph_Algorithms_Instance is new Graph_Algorithms(Vertex_Type, "=", Test_Graph);
        use Graph_Algorithms_Instance;
        Result_Spanning_Tree : Edge_Array_Access;
test
        Find_Min_Spanning_Tree(Result_Spanning_Tree);

pass        (Result_Spanning_Tree.all'Length = 0)


code    New_Line;
code    Put_line("Test Kruskal Algorithm with disconnected Test Graph.");

***** (4) Test Kruskal Algorithm with disconnected Testgraph
define
        subtype Vertex_Type is Integer;
        package Test_Graph is new Graph(Vertex_Type, "=");
        use Test_Graph;
        package Graph_Algorithms_Instance is new Graph_Algorithms(Vertex_Type, "=", Test_Graph);
        use Graph_Algorithms_Instance;
        Result_Spanning_Tree : Edge_Array_Access;
test
        Add_Vertex(10);
        Add_Vertex(20);
        Add_Vertex(30);
        Add_Vertex(40);
        Add_Vertex(50);
        Add_Vertex(60);
        Add_Vertex(70);
        Add_Vertex(80);
        Add_Vertex(90);

        Add_Edge(10,20,1);
        Add_Edge(10,30,3);
        Add_Edge(10,80,5);
        Add_Edge(20,30,8);
        Add_Edge(20,80,2);
        Add_Edge(30,40,4);
        Add_Edge(40,70,2);
        Add_Edge(70,80,4);

        Add_Edge(50,60,8);
        Add_Edge(50,90,7);
        Add_Edge(60,90,11);


        Find_Min_Spanning_Tree(Result_Spanning_Tree);

pass    (Result_Spanning_Tree.all'Length = 7)
        AND (Result_Spanning_Tree.all(0).Weight = 1)
        AND (Result_Spanning_Tree.all(1).Weight = 2)
        AND (Result_Spanning_Tree.all(2).Weight = 2)
        AND (Result_Spanning_Tree.all(3).Weight = 3)
        AND (Result_Spanning_Tree.all(4).Weight = 4)
        AND (Result_Spanning_Tree.all(5).Weight = 7)
        AND (Result_Spanning_Tree.all(6).Weight = 8)


code    New_Line;
code    Put_line("Test Djikstra Algorithm with connected Test Graph.");

***** (5) Test Djikstra Algorithm with connected Test Graph
define
        subtype Vertex_Type is Integer;
        package Test_Graph is new Graph(Vertex_Type, "=");
        use Test_Graph;
        package Graph_Algorithms_Instance is new Graph_Algorithms(Vertex_Type, "=", Test_Graph);
        use Graph_Algorithms_Instance;
        Result_Shortest_Path : Vertex_Array_Access;
        Graph_Vertices_Array: Vertex_Array(1..9);
test
        Add_Vertex(10);
        Add_Vertex(20);
        Add_Vertex(30);
        Add_Vertex(40);
        Add_Vertex(50);
        Add_Vertex(60);
        Add_Vertex(70);
        Add_Vertex(80);
        Add_Vertex(90);

        Add_Edge(10,20,1);
        Add_Edge(10,30,3);
        Add_Edge(10,80,5);
        Add_Edge(20,30,8);
        Add_Edge(20,80,2);
        Add_Edge(30,40,4);
        Add_Edge(30,50,6);
        Add_Edge(40,50,10);
        Add_Edge(40,70,2);
        Add_Edge(40,60,8);
        Add_Edge(50,90,7);
        Add_Edge(60,90,11);
        Add_Edge(70,80,4);

        Graph_Vertices_Array := To_Vertex_Array;
        Find_Shortest_Path(From => Graph_Vertices_Array(8), To => Graph_Vertices_Array(9), Path => Result_Shortest_Path);

pass    (Result_Shortest_Path.all(0)=20)
        AND (Result_Shortest_Path.all(1)=10)
        AND (Result_Shortest_Path.all(2)=30)
        AND (Result_Shortest_Path.all(3)=50)


code    New_Line;
code    Put_line("Test Djikstra Algorithm with unconnected Start and Target.");

***** (6) Test Djikstra Algorithm with unconnected Start and Target
define
        subtype Vertex_Type is Integer;
        package Test_Graph is new Graph(Vertex_Type, "=");
        use Test_Graph;
        package Graph_Algorithms_Instance is new Graph_Algorithms(Vertex_Type, "=", Test_Graph);
        use Graph_Algorithms_Instance;
        Result_Shortest_Path : Vertex_Array_Access;
        Graph_Vertices_Array: Vertex_Array(1..9);
test
        Add_Vertex(10);
        Add_Vertex(20);
        Add_Vertex(30);
        Add_Vertex(40);
        Add_Vertex(50);
        Add_Vertex(60);
        Add_Vertex(70);
        Add_Vertex(80);
        Add_Vertex(90);

        Add_Edge(10,20,1);
        Add_Edge(10,30,3);
        Add_Edge(10,80,5);
        Add_Edge(20,30,8);
        Add_Edge(20,80,2);
        Add_Edge(30,40,4);
        Add_Edge(40,70,2);
        Add_Edge(70,80,4);

        Add_Edge(50,60,8);
        Add_Edge(50,90,7);
        Add_Edge(60,90,11);

        Graph_Vertices_Array := To_Vertex_Array;

        Find_Shortest_Path(From => Graph_Vertices_Array(8), To => Graph_Vertices_Array(9), Path => Result_Shortest_Path);

pass    (Result_Shortest_Path.all'Length = 0)


