with Vectors, Test_It, Ada.Text_IO; 
use Vectors, Ada.Text_IO;

procedure test is 
    package T1 is new Test_It (Description => "V+V", A_Type => Vector, B_Type => Vector, R_Type => Vector);
    package T2 is new Test_It (Description => "V-V", A_Type => Vector, B_Type => Vector, R_Type => Vector);
    package T3 is new Test_It (Description => "V*V", A_Type => Vector, B_Type => Vector, R_Type => Float);
    package T4 is new Test_It (Description => "V*F", A_Type => Vector, B_Type => Float, R_Type => Vector);
    package T5 is new Test_It (Description => "V=V", A_Type => Vector, B_Type => Vector, R_Type => Boolean);
    package T6 is new Test_It (Description => "Orth(v,v)", A_Type => Vector, B_Type => Vector, R_Type => Boolean);
    package T7 is new Test_It (Description => "VxV", A_Type => Vector, B_Type => Vector, R_Type => Vector);
    package T8 is new Test_It (Description => "Distance(v,v)", A_Type => Vector, B_Type => Vector, R_Type => Float);
    package T9 is new Test_It (Description => "Distance_orig(v)", A_Type => Vector,  B_Type => Vector, R_Type => Float);
    
    V1 : Vector := (1.0, 0.0, 0.0);
    V2 : Vector := (0.0, 0.0, 0.0);
begin
    New_Line;
    Put("Testing for " ); Put(V1); Put(", "); Put(V2); New_Line(2);
    T1.Test_This("+"'Access, v1, v2, (1.0, 0.0, 0.0));
    T2.Test_This("-"'Access, v1, v2, (1.0, 0.0, 0.0));
    T3.Test_This("*"'Access, v1, v2, 0.0);
    T4.Test_This("*"'Access, v1, 1.0, (1.0, 0.0, 0.0));
    T5.Test_This("="'Access, v1, v2, FALSE);
    T7.Test_This(Cross_Product'Access, v1, v2, (0.0, 0.0, 0.0));
    T6.Test_This(Are_Orthogonal'Access, v1, v2, TRUE);
    T8.Test_This(Distance'Access, v1, v2, 1.0);
    T9.Test_This(Distance_To_Origin'Access, v1, 1.0);
end test;