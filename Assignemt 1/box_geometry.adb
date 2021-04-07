--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
-- Description: A simple calculator that takes three integers
--              representing the length, width and height of
--              a box, and calculates the volume and surface
--              area of this defined box. 
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;            
use  Ada.Text_IO, Ada.Integer_Text_IO; 

procedure Box_Geometry is
    Length, Width, Height, Surface_Area : Integer;                      
begin
    Put ("Please enter three integers representing the length, the " &
        "width and the height of a box in centimeters." &
        " Seperate them by a space: ");                 
    Get (Length);                                  
    Get (Width); 
    Get (Height);                                
    Put ("The volume of the box is ");                           
    Put (Length * Width * Height, Width=>1);
    Put (" cubic centimetre.");                          
    New_Line; 
    Surface_Area := 2 * (Length * Width + Length * Height + 
                    Width * Height); 
    Put ("The surface area of the box is ");                           
    Put (Surface_Area, Width=>1); 
    Put (" square centimetre.");
    New_Line;                              
end Box_Geometry;