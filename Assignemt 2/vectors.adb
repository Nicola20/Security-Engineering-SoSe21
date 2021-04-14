-- Nicola Lea Libera (117073)
-- Philipp Tornow (118332)
-- Lucas Hübner (116232)

with Ada.Text_IO, Ada.Numerics.Elementary_Functions;

package body Vectors is
    
    function "+" (Left: Vector; Right: Vector) return Vector is
    begin
        return (X => Left.X + Right.X,  Y => Left.Y + Right.Y, Z => Left.Z + Right.Z);
    end "+";


    function "-" (Left: Vector; Right: Vector) return Vector is
    begin
        return (X => Left.X - Right.X,  Y => Left.Y - Right.Y, Z => Left.Z - Right.Z);
    end "-";

    function "*"(Left: Vector; Right: Float) return Vector is
    begin
        return (X => Left.X * Right,  Y => Left.Y * Right, Z => Left.Z * Right);
    end "*";

    function "*"(Left: Vector; Right: Vector) return Float is
    begin
        return Float(Left.X * Right.X + Left.Y * Right.Y + Left.Z * Right.Z);
    end "*";

    function "=" (Left: Vector; Right: Vector) return Boolean is
    begin
        if Left.X /= Right.X or Left.Y /= Right.Y or Left.Z /= Right.Z then
            return FALSE;
        end if;
        return TRUE;
    end "=";

    function Are_Orthogonal(Left: Vector; Right: Vector) return Boolean is
    begin
        if Left * Right = Float(0) then
            return TRUE;
        end if;
        return False;
    end Are_Orthogonal;

    function Cross_Product(Left: Vector; Right: Vector) return Vector is
    begin
        return (
            Left.Y * Right.Z - Left.Z * Right.Y,
            Left.Z * Right.X - Left.X * Right.Z,
            Left.X * Right.Y - Left.Y * Right.X
        );
    end Cross_Product;

    function Distance(Left: Vector; Right: Vector) return Float is 
    begin
        return ( Ada.Numerics.Elementary_Functions.Sqrt( Float(
            (Left.X - Right.X) * (Left.X - Right.X) +
            (Left.Y - Right.Y) * (Left.Y - Right.Y) +
            (Left.Z - Right.Z) * (Left.Z - Right.Z)
        )));
    end Distance;

    function Distance_To_Origin(Item: Vector) return Float is
    begin
        return ( Ada.Numerics.Elementary_Functions.Sqrt( Float(
            (Item.X - Float(0)) * (Item.X - Float(0)) +
            (Item.Y - Float(0)) * (Item.Y - Float(0)) +
            (Item.Z - Float(0)) * (Item.Z - Float(0))
        )));
    end Distance_To_Origin;

    procedure Put(Item: Vector) is
    package ATIO renames Ada.Text_IO;
    begin
        ATIO.Put("(" & Float'Image(Item.X) & ", " & Float'Image(Item.Y) & ", " & Float'Image(Item.Z) & ")");
    end Put;

end Vectors;