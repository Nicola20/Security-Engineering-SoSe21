--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Definition of rgb saturation arithmetic
--------------------------------------------------------------

with Ada.Text_IO;

package body RGB is

package TEXTIO renames Ada.Text_IO;

function "+"(Left: Color_RGB; Right: Color_RGB) return Color_RGB is
    Result: Color_RGB;
    Accumulated_R: constant Integer := Integer(Left.Red) + Integer(Right.Red);
    Accumulated_G: constant Integer := Integer(Left.Green) + Integer(Right.Green);
    Accumulated_B: constant Integer := Integer(Left.Blue) + Integer(Right.Blue);
begin
    if Accumulated_R in Intensity then
        result.Red := Intensity(Accumulated_R);
    else
        result.Red := Intensity'last;
    end if;

    if Accumulated_G in Intensity then
        result.Green := Intensity(Accumulated_G);
    else
        result.Green := Intensity'last;
    end if;

    if Accumulated_B in Intensity then
        result.Blue := Intensity(Accumulated_B);
    else
        result.Blue := Intensity'last;
    end if;

    return Result;
end "+";

function "-"(Left: Color_RGB; Right: Color_RGB) return Color_RGB is
    Result: Color_RGB;
    Differenz_R: constant Integer := Integer(Left.Red) - Integer(Right.Red);
    Differenz_G: constant Integer := Integer(Left.Green) - Integer(Right.Green);
    Differenz_B: constant Integer := Integer(Left.Blue) - Integer(Right.Blue);
begin
    if Differenz_R in Intensity then
        result.Red := Intensity(Differenz_R);
    else
        result.Red := Intensity'first;
    end if;

    if Differenz_G in Intensity then
        result.Green := Intensity(Differenz_G);
    else
        result.Green := Intensity'first;
    end if;

    if Differenz_B in Intensity then
        result.Blue := Intensity(Differenz_B);
    else
        result.Blue := Intensity'first;
    end if;

    return Result;
end "-";

function "*"(Left: Color_RGB; Right: Color_RGB) return Color_RGB is
    Result: Color_RGB;
    Product_R: constant Integer := (Integer(Left.Red) * Integer(Right.Red))/255;
    Product_G: constant Integer := (Integer(Left.Green) * Integer(Right.Green))/255;
    Product_B: constant Integer := (Integer(Left.Blue) * Integer(Right.Blue))/255;
begin
    result.Red := Intensity(Product_R);
    result.Green := Intensity(Product_G);
    result.Blue := Intensity(Product_B);
    return Result;
end "*";

function RGB_To_HSV(Item: in Color_RGB) return Color_HSV is
    -- Idea from https://www.rapidtables.com/convert/color/rgb-to-hsv.html
    Result: Color_HSV;
    R: Float;
    G: Float;
    B: Float;
    C_Max: Float;
    C_Min: Float;
    D: Float;
    Hue: Integer;

begin
    R := Float(Item.Red)/255.0;
    G := Float(Item.Green)/255.0;
    B := Float(Item.Blue)/255.0;
    C_Max := Float'Max(R,Float'Max(G,B));
    C_Min := Float'Min(R,Float'Min(G,B));
    D := C_Max - C_Min;

    -- HUE --
    if D < Float'small then
        Result.Hue := 0;
        Result.Saturation := 0;
        Result.Value := 0;
        return Result;
    elsif C_Max = R then
        Hue := Integer(60.0 * Float'Remainder((G - B)/D,6.0));
    elsif C_Max = G then
        Hue := Integer(60.0 * (B - R)/D + 2.0);
    else
        Hue := Integer(60.0 * (R - G)/D + 4.0);
    end if;

    -- check if hue is negative
    if Hue in Degree then
        Result.Hue := Degree(Hue);
    else
        Result.Hue := Degree(Hue+360);
    end if;

    -- SATURATION --
    Result.Saturation := Percentage((D/C_Max) * 100.0);

    -- VALUE --
    Result.Value := Percentage(C_Max * 100.0);
    return Result;
end RGB_To_HSV;

function RGB_To_CMYK(Item: in Color_RGB) return Color_CMYK is
    -- Idea from https://www.rapidtables.com/convert/color/rgb-to-cmyk.html
    Result: Color_CMYK;
    R: Float;
    G: Float;
    B: Float;
    K: Float;
begin
    R := Float(Item.Red)/255.0;
    G := Float(Item.Green)/255.0;
    B := Float(Item.Blue)/255.0;
    K := 1.0 - Float'Max(R,Float'Max(G,B));

    Result.Key := Percentage(K * 100.0);
    Result.Cyan := Percentage((1.0 - R - K)/(1.0 - K) * 100.0);
    Result.Magenta := Percentage((1.0 - G - K)/(1.0 - K) * 100.0);
    Result.Yellow := Percentage((1.0 - B - K)/(1.0 - K) * 100.0);
    return Result;
end RGB_To_CMYK;

procedure Put(Item: in Color_RGB) is
begin
    TEXTIO.Put('(');
    TEXTIO.Put(Item.Red'Image & ", ");
    TEXTIO.Put(Item.Green'Image & ", ");
    TEXTIO.Put(Item.Blue'Image);
    TEXTIO.Put(')');
end Put;

procedure Put(Item: in Color_HSV) is
begin
    TEXTIO.Put('(');
    TEXTIO.Put(Item.Hue'Image & ", ");
    TEXTIO.Put(Item.Saturation'Image & ", ");
    TEXTIO.Put(Item.Value'Image);
    TEXTIO.Put(')');
end Put;

procedure Put(Item: in Color_CMYK) is
begin
    TEXTIO.Put('(');
    TEXTIO.Put(Item.Cyan'Image & ", ");
    TEXTIO.Put(Item.Magenta'Image & ", ");
    TEXTIO.Put(Item.Yellow'Image & ", ");
    TEXTIO.Put(Item.Key'Image);
    TEXTIO.Put(')');
end Put;

end rgb;