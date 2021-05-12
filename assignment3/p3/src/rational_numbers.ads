--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Rational numbers declaration
--------------------------------------------------------------

package Rational_Numbers is
    type Fraction is tagged private;
    subtype Sign_Type is Integer range -1..1;

    function Create_Fraction(N, D : Integer) return Fraction
    with
        Pre => (D /= 0),
        Post => (if Sign(Create_Fraction'Result) = 0 then Float(N/D) = FLoat(0)) or
                (if Sign(Create_Fraction'Result) = -1 then Float(N/D) < Float(0)) or
                (if Sign(Create_Fraction'Result) = 1 then Float(N/D) > Float(0));
    -- Constructor

    procedure Put(X: Fraction);
    -- Should print "Num / Den" in canonical form with a line break at the end

    function "+"(Lhs : Fraction; Rhs : Fraction) return Fraction;
    function "-"(Lhs : Fraction; Rhs : Fraction) return Fraction;
    function "*"(Lhs : Fraction; Rhs : Fraction) return Fraction;
    function "/"(Lhs : Fraction; Rhs : Fraction) return Fraction
    with
        Pre => (Get_Numerator(Rhs) /= 0) and (Get_Numerator(Lhs) /= 0);
    function "="(Lhs : Fraction; Rhs : Fraction) return Boolean;
    function "<"(Lhs : Fraction; Rhs : Fraction) return Boolean;
    function ">"(Lhs : Fraction; Rhs : Fraction) return Boolean;

    function Get_Numerator(F : Fraction) return Integer;
    function Get_Denumerator(F : Fraction) return Integer;
    function Sign(X : Fraction) return Sign_Type;
    -- returns -1 if X < 0; 0 if X = 0; 1 if X > 0

private

    type Fraction is tagged record
       Num, Den : Integer;
    end record;

    procedure reduce (F : in out Fraction)
    -- shortest snipped for gcd without binary parsing
    -- is inspired by https://cs.fit.edu/~ryan/ada/programs/fraction/gcd-adb.html
     with
        Pre => (F.Den /= 0),
        Post =>(F.Den /= 0) and (Float(F.Num/F.Den) = Float(F'Old.Num/F'Old.Den));


end Rational_Numbers;
