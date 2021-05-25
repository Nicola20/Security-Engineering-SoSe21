context with Vectors;
        with Ada.Text_IO;
        use Vectors;
        use Ada.Text_IO;

code    Put_line("Test Vectors package.");
        New_Line;


        Put_line("Test Vector-Equality.");

***** (1.1) Test Equality
define  V1 : constant Vector := (0.0, 0.0, 0.0);
        V2 : constant Vector := (3.0, 2.0, 1.0);
        R1 : Boolean;
test    R1 := (V1 = V2);
pass    (R1 = false)

***** (1.2) Test Equality with Negative
define  V1 : constant Vector := (3.0, 2.0, 1.0);
        V2 : constant Vector := (-3.0, -2.0, -1.0);
        R1 : Boolean;
test    R1 := (V1 = V2);
pass    (R1 = false)

***** (1.3) Test Equality with precision
define  V1 : constant Vector := (3.0, 2.0, 1.0);
        V2 : constant Vector := (3.0000001, 2.00001, 1.01);
        R1 : Boolean;
test    R1 := (V1 = V2);
pass    (R1 = false)

***** (1.4) Test Equality seperate
define  V1 : constant Vector := (3.0000001, 2.00001, 1.01);
        V2 : constant Vector := (3.0000001, 2.00001, 1.01);
        R1 : Boolean;
test    R1 := (V1 = V2);
pass    (R1) AND (V1.X = V2.X) AND (V1.Y = V2.Y) AND (V1.Z = V2.Z)




code    New_Line;
        Put_Line("Test Vector-Addition.");

***** (2.1) Test Vector Addition with zero-vec
define  V1 : constant Vector := (0.0, 0.0, 0.0);
        R1 : constant Vector := (0.0, 0.0, 0.0);
        T1 : Vector;
test    T1 := V1 + V1;
pass    (R1 = T1)

***** (2.2) Test Vector Addition with Negative
define  V1 : constant Vector := (0.0, 0.0, 0.0);
        V2 : constant Vector := (1.0, 0.0, 0.0);
        R1 : constant Vector := (1.0, 0.0, 0.0);
        T1 : Vector;
test    T1 := V1 + V2;
pass    (R1 = T1)

***** (2.3) Test Vector Addition Positive + Negative
define  V1 : constant Vector := (1.0, 0.0, 0.0);
        V2 : constant Vector := (-6.0, -1.0, 0.0);
        R1 : constant Vector := (-5.0, -1.0, 0.0);
        T1 : Vector;
test    T1 := V1 + V2;
pass    (R1 = T1)

***** (2.4) Test Vector Addition Negative + Negative
define  V1 : constant Vector := (-6.0, -1.0, 0.0);
        V2 : constant Vector := (-2.0, -4.0, 5.0);
        R1 : constant Vector := (-8.0, -5.0, 5.0);
        T1 : Vector;
test    T1 := V1 + V2;
pass    (R1 = T1)




code    New_Line;
        Put_Line("Test Vector-Subtraction.");

***** (3.1) Test Vector Subtraction with zero-vec
define  V1 : constant Vector := (0.0, 0.0, 0.0);
        R1 : constant Vector := (0.0, 0.0, 0.0);
        T1 : Vector;
test    T1 := V1 - V1;
pass    (R1 = T1)

***** (3.2) Test Vector Subtraction with Positive
define  V1 : constant Vector := (0.0, 0.0, 0.0);
        V2 : constant Vector := (1.0, 0.0, 0.0);
        R1 : constant Vector := (-1.0, 0.0, 0.0);
        T1 : Vector;
test    T1 := V1 - V2;
pass    (R1 = T1)

***** (3.3) Test Vector Subtraction Negative - Positive
define  V1 : constant Vector := (-6.0, -1.0, 0.0);
        V2 : constant Vector := (1.0, 0.0, 0.0);
        R1 : constant Vector := (-7.0, -1.0, 0.0);
        T1 : Vector;
test    T1 := V1 - V2;
pass    (R1 = T1)

***** (3.4) Test Vector Subtraction Negative - Negative
define  V1 : constant Vector := (-6.0, -1.0, 0.0);
        V2 : constant Vector := (-2.0, -3.0, 5.0);
        R1 : constant Vector := (-4.0, 2.0, -5.0);
        T1 : Vector;
test    T1 := V1 - V2;
pass    (R1 = T1)




code    New_Line;
        Put_Line("Test Vector-Subtraction.");

***** (3.1) Test Vector Subtraction zero-vec
define  V1 : constant Vector := (0.0, 0.0, 0.0);
        R1 : constant Vector := (0.0, 0.0, 0.0);
        T1 : Vector;
test    T1 := V1 - V1;
pass    (R1 = T1)

***** (3.2) Test Vector Subtraction Positive
define  V1 : constant Vector := (0.0, 0.0, 0.0);
        V2 : constant Vector := (1.0, 0.0, 0.0);
        R1 : constant Vector := (-1.0, 0.0, 0.0);
        T1 : Vector;
test    T1 := V1 - V2;
pass    (R1 = T1)

***** (3.3) Test Vector Subtraction Negative - Positive
define  V1 : constant Vector := (-6.0, -1.0, 0.0);
        V2 : constant Vector := (1.0, 0.0, 0.0);
        R1 : constant Vector := (-7.0, -1.0, 0.0);
        T1 : Vector;
test    T1 := V1 - V2;
pass    (R1 = T1)

***** (3.4) Test Vector Subtraction Negative - Negative
define  V1 : constant Vector := (-6.0, -1.0, 0.0);
        V2 : constant Vector := (-2.0, -3.0, 5.0);
        R1 : constant Vector := (-4.0, 2.0, -5.0);
        T1 : Vector;
test    T1 := V1 - V2;
pass    (R1 = T1)




code    New_Line;
        Put_Line("Test Multiplication with scalar.");

***** (4.1) Test Multiplication with zero
define  V1 : constant Vector := (3.0, 2.0, 1.0);
        S1 : constant Float := 0.0;
        R1 : constant Vector := (0.0, 0.0, 0.0);
        T1 : Vector;
test    T1 := V1 * S1;
pass    (R1 = T1)

***** (4.2) Test Multiplication with positive
define  V1 : constant Vector := (3.0, 2.0, 1.0);
        S1 : constant Float := 2.0;
        R1 : constant Vector := (6.0, 4.0, 2.0);
        T1 : Vector;
test    T1 := V1 * S1;
pass    (R1 = T1)

***** (4.3) Test Multiplication with negative
define  V1 : constant Vector := (3.0, -2.0, 1.0);
        S1 : constant Float := (-3.0);
        R1 : constant Vector := (-9.0, 6.0, -3.0);
        T1 : Vector;
test    T1 := V1 * S1;
pass    (R1 = T1)




code    New_Line;
        Put_Line("Test scalar-multiplication.");

***** (5.1) Test Scalar-Multiplication with zero
define  V1 : constant Vector := (3.0, 2.0, 1.0);
        V2 : constant Vector := (0.0, 0.0, 0.0);
        R1 : constant Float := 0.0;
        T1 : Float;
test    T1 := V1 * V2;
pass    (R1 = T1)

***** (5.2) Test Scalar-Multiplication with positive
define  V1 : constant Vector := (3.0, 2.0, 1.0);
        V2 : constant Vector := (2.0, 1.0, 3.0);
        R1 : constant Float := 11.0;
        T1 : Float;
test    T1 := V1 * V2;
pass    (R1 = T1)

***** (5.3) Test Scalar-Multiplication with negative
define  V1 : constant Vector := (3.0, -2.0, 1.0);
        V2 : constant Vector := (-3.0, -2.0, 0.0);
        R1 : constant Float := -5.0;
        T1 : Float;
test    T1 := V1 * V2;
pass    (R1 = T1)




code    New_Line;
        Put_Line("Test orthogonality check.");

***** (6.1) Test Orthogonal with positive
define  V1 : constant Vector := (0.0, 1.0, 0.0);
        V2 : constant Vector := (1.0, 0.0, 0.0);
        R1 : Boolean;
test    R1 := Are_Orthogonal(V1,V2);
pass    (R1)

***** (6.2) Test Orthogonal with negative
define  V1 : constant Vector := (0.0, 1.0, 0.0);
        V2 : constant Vector := (-1.0, 0.0, 0.0);
        R1 : Boolean;
test    R1 := Are_Orthogonal(V1,V2);
pass    (R1)

***** (6.3) Test Orthogonal Non-Orthogonal
define  V1 : constant Vector := (0.0, 1.0, 0.0);
        V2 : constant Vector := (-4.0, 3.0, 0.0);
        R1 : Boolean;
test    R1 := Are_Orthogonal(V1,V2);
pass    (R1 = false)




code    New_Line;
        Put_Line("Test Cross-Product.");

***** (7.1) Test Cross-Product with negative
define  V1 : constant Vector := (-1.0, -2.0, 3.0);
        V2 : constant Vector := (4.0, -5.0, -6.0);
        R1 : constant Vector := (27.0, 6.0, 13.0);
        T1 : Vector;
test    T1 := Cross_Product(V1,V2);
pass    (R1 = T1)

***** (7.2) Test Cross-Product with positive
define  V1 : constant Vector := (1.0, 2.0, 3.0);
        V2 : constant Vector := (4.0, 5.0, 6.0);
        R1 : constant Vector := (-3.0, 6.0, -3.0);
        T1 : Vector;
test    T1 := Cross_Product(V1,V2);
pass    (R1 = T1)




code    New_Line;
        Put_Line("Test Distance.");

***** (8.1) Test Distance zero
define  V1 : constant Vector := (1.0, 2.0, 3.0);
        V2 : constant Vector := (1.0, 2.0, 3.0);
        R1 : constant Float := 0.0;
        T1 : Float;
test    T1 := Distance(V1,V2);
pass    (R1 = T1)

***** (8.2) Test Distance positive
define  V1 : constant Vector := (1.0, 2.0, 3.0);
        V2 : constant Vector := (4.0, 5.0, 9.0);
        R1 : constant Float := 7.3484692283495342945918522241177;
        T1 : Float;
test    T1 := Distance(V1,V2);
pass    (R1 = T1)

***** (8.3) Test Distance negative
define  V1 : constant Vector := (1.0, 2.0, 3.0);
        V2 : constant Vector := (-3.0, -2.0, -1.0);
        R1 : constant Float := 6.9282032302755091741097853660235;
        T1 : Float;
test    T1 := Distance(V1,V2);
pass    (R1 = T1)




code    New_Line;
        Put_Line("Test Distance to Origin.");

***** (9.1) Test Distance zero
define  V1 : constant Vector := (0.0, 0.0, 0.0);
        R1 : constant Float := 0.0;
        T1 : Float;
test    T1 := Distance_To_Origin(V1);
pass    (R1 = T1)

***** (9.2) Test Distance positive
define  V1 : constant Vector := (1.0, 2.0, 3.0);
        R1 : constant Float := 3.7416573867739413855837487323165;
        T1 : Float;
test    T1 := Distance_To_Origin(V1);
pass    (R1 = T1)

***** (9.3) Test Distance negative
define  V1 : constant Vector := (-3.0, -2.0, -1.0);
        R1 : constant Float := 3.7416573867739413855837487323165;
        T1 : Float;
test    T1 := Distance_To_Origin(V1);
pass    (R1 = T1)