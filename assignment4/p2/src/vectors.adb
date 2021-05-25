--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Lucas Hübner (116232),
-- Philipp Tornow (118332)
-- Description: Vector package definition
--------------------------------------------------------------

with Ada.Numerics.Elementary_Functions; -- , Ada.Text_IO, Ada.Strings.Unbounded;

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
        return (Left.X * Right.X + Left.Y * Right.Y + Left.Z * Right.Z);
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
        return ( Ada.Numerics.Elementary_Functions.Sqrt((
            (Left.X - Right.X) * (Left.X - Right.X) +
            (Left.Y - Right.Y) * (Left.Y - Right.Y) +
            (Left.Z - Right.Z) * (Left.Z - Right.Z)
        )));
    end Distance;

    function Distance_To_Origin(Item: Vector) return Float is
    begin
        return ( Ada.Numerics.Elementary_Functions.Sqrt((
            (Item.X - Float(0)) * (Item.X - Float(0)) +
            (Item.Y - Float(0)) * (Item.Y - Float(0)) +
            (Item.Z - Float(0)) * (Item.Z - Float(0))
        )));
    end Distance_To_Origin;

    --https;//www.adahome.com/rm95/rm9x-A-10.09.html

    --function Put(Item: Vector) return Ada.Strings.Unbounded.Unbounded_String is
    --package ATIO renames Ada.Text_IO;
    --package UBST renames Ada.Strings.Unbounded;
    --Output : UBST.Unbounded_String := UBST.Null_Unbounded_String;
    --begin
    --    UBST.Append(Output,"(" & Float'Image(Item.X) & ", " & Float'Image(Item.Y) & ", " & Float'Image(Item.Z) & ")");
    --    ATIO.Put(UBST.To_String(Output));
    --    return Output;
    --end Put;

    -------EXAMPLE TESTCASE-------
    --code    New_Line;
    --    Put_Line("Test Put Output.");

    --***** (10.1) Test Put Output
    --define  V1 : constant Vector := (12.1, -2.0, 7.224);
    --        R1 : constant String := "(12.10000E+00, -2.00000E+00, 7.22400E+00)";
    --        T1 : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
    --        R2 : Boolean := false;
    --test    T1 := Vectors.Put(V1);
    --        R2 := Ada.Strings.Equal_Case_Insensitive(Ada.Strings.Unbounded.To_String(T1),R1);
    --pass    (R2)

end Vectors;