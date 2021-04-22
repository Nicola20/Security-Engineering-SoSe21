with Ada.Text_IO, Graph;
use Ada.Text_IO;

procedure Graph_Test is
    subtype Vertex_Type is Integer;
    package G is new Graph(Vertex_Type, "=");
    use G;  
     
begin
    Put_Line("Test graphs:");
    Add_Vertex(3);
    Add_Vertex(5);
    Add_Vertex(9);
    Add_Vertex(3);
    --Clear;
    --Add_Vertex(3);
    Add_Edge(3, 8, 13);
    Add_Edge(9, 5, 4);
    Add_Edge(3, 8, 7);
    Add_Edge(5, 9, 4);


    Put_Line("Hello");
    --Graph_Vertices := To_Vertex_Array; 
    
end Graph_Test;