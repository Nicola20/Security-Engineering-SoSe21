--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Child of the RGB Package to access private scope
--------------------------------------------------------------

with Ada.Text_IO;

package body RGB.Child is

    package TEXTIO renames Ada.Text_IO;

    procedure Test is

        Color1: Color_RGB;
        Color2: Color_RGB;
        Color3: Color_HSV;
        Color4: Color_CMYK;

    begin
        Color1 := (235, 52, 192);
        Color2 := (10, 255, 43);
        TEXTIO.Put_Line("Input colors: ");
        Put(Color1);
        TEXTIO.New_Line;
        Put(Color2);
        TEXTIO.New_Line;

        TEXTIO.Put_Line("Color1 + Color2 = ");
        Put(Color1+Color2);
        TEXTIO.New_Line;

        TEXTIO.Put_Line("Color2 - Color1 = ");
        Put(Color2-Color1);
        TEXTIO.New_Line;

        TEXTIO.Put_Line("Color1 * Color2 = ");
        Put(Color1*Color2);
        TEXTIO.New_Line;

        TEXTIO.Put_Line("Color1 to HSV: ");
        Color3 := RGB_To_HSV(Color1);
        Put(Color3);
        TEXTIO.New_Line;

        TEXTIO.Put_Line("Color1 to CMYK: ");
        Color4 := RGB_To_CMYK(Color1);
        Put(Color4);
        end Test;

    end RGB.Child;