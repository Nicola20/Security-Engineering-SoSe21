-- Nicola Lea Libera (117073)
-- Philipp Tornow (118332)
-- Lucas Hübner (116232)

with Ada.Text_IO, Vectors;
use Ada.Text_IO, Vectors;

procedure Test is
    V1 : Vector := (Float(1), Float(0), Float(0));
    V2 : Vector := (Float(0), Float(1), Float(0));
begin
    Put_Line("Test vector arethmetics:");
    Put("V1: "); Put(V1);
    New_Line;
    Put("V2: "); Put(V2);
    New_Line(2);
    
    Put ("V1 + V2 = "); Put (V1 + V2); New_Line;
    Put ("V1 - V2 = "); Put (V1 - V2); New_Line;
    Put ("V1 * V2 = "); Put (Float'Image(V1 * V2)); New_Line;
    Put ("V1 * 0.5 = "); Put(V1 * Float(0.5)); New_Line;
    Put ("V1 == V2 = "); Put(Boolean'Image(V1 = V2)); New_Line;
    Put ("V1 x V2 = "); Put(Cross_Product(V1, V2)); New_Line;
    Put ("V1 orthogonal V2 = "); Put(Boolean'Image(Are_Orthogonal(V1, V2))); New_Line;
    Put ("V1 distance V2 = "); Put(Float'Image(Distance(V1, V2))); New_Line;
    Put ("V1 distance origin = "); Put(Float'Image(Distance_To_Origin(V1)));   
    
end Test;