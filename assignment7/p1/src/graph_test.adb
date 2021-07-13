--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Testing the graph package
--------------------------------------------------------------

with Ada.Text_IO, Graph;
use Ada.Text_IO;

procedure Graph_Test is
    subtype Vertex_Type is Integer;
    package G is new Graph(Vertex_Type, "=");
    use G;
    Edge_Weight: Integer := 0;
    Contains_Edge: Boolean := False;
    Removed_Edge: Boolean := False;

begin
    Put_Line("Test graphs:");
    Add_Vertex(3);
    Add_Vertex(8);
    Add_Vertex(5);
    Add_Vertex(9);
    Add_Vertex(4);
    Add_Vertex(7);
    --Add_Edge(3, 8, 13);
    Add_Edge(9, 5, 4);
    Add_Edge(3, 8, 7);
    Add_Edge(5, 7, 4);
    Add_Edge(7, 5, 4);
    --Add_Edge(1, 7, 9);
    Edge_Weight := Get_Edge_Weight(7, 5);
    Edge_Weight := Get_Edge_Weight(3, 8);
    Contains_Edge := Has_Edge(3, 8);
    Put(Boolean'Image(Contains_Edge));
    New_Line;
    Contains_Edge := Has_Edge(8, 3);
    Put(Boolean'Image(Contains_Edge));
    New_Line;
    Removed_Edge := Remove_Edge(3, 8);
    --Add_Vertex(9);
    --Add_Vertex(3);
    declare
    	Graph_Vertices_Array: Vertex_Array := To_Vertex_Array;
    begin
    	Put_Line("Converted vertices to array");
        Put_Line(Integer'Image(Graph_Vertices_Array'Length));
    end;
    Clear;
    Contains_Edge := Has_Edge(3, 8);
    Put(Boolean'Image(Contains_Edge));
    New_Line;
end Graph_Test;