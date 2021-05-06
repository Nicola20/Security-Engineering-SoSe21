package Rational_Numbers is
    type Fraction is private;
    subtype Sign_Type is Integer range -1..1;

    function Create_Fraction(N, D : Integer) return Fraction;
    -- Constructor

    procedure Put(X: Fraction);
    -- Should print "Num / Den" in canonical form with a line break at the end

    function "+"(Lhs : Fraction; Rhs : Fraction) return Fraction;
    function "-"(Lhs : Fraction; Rhs : Fraction) return Fraction;
    function "*"(Lhs : Fraction; Rhs : Fraction) return Fraction;
    function "/"(Lhs : Fraction; Rhs : Fraction) return Fraction;
    function "="(Lhs : Fraction; Rhs : Fraction) return Boolean;
    function "<"(Lhs : Fraction; Rhs : Fraction) return Boolean;
    function ">"(Lhs : Fraction; Rhs : Fraction) return Boolean;

    function Sign(X : Fraction) return Sign_Type;
    -- returns -1 if X < 0; 0 if X = 0; 1 if X > 0


private

    type Fraction is record
        Num, Den : Integer;
    end record;

end Rational_Numbers;
