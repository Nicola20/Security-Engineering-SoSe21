generic
    Description : String;
    type A_Type is private;
    type B_Type is private;
    type R_Type is private;
package Test_It is
    type F_Type_S is access function (a : A_Type) return R_Type;
    type F_Type_D is access function (a : A_Type; b : B_Type) return R_Type;
    procedure Test_This(F : F_Type_S; A : A_Type; R : R_Type);
    procedure Test_This(F : F_Type_D; A : A_Type; B : B_Type; R : R_Type);
end Test_It;