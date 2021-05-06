with AUnit.Assertions;
with Rational_Numbers;

use AUnit.Assertions;
use Rational_Numbers;

package body Frac_Tests is

    procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
    begin
    end Register_Tests;

    -- ---------------------------------------------------------------

    function Name(T: Test) return Test_String is
        pragma Unreferenced(T);
    begin
        return Format("Vector_Tests");
    end Name;

    -- ---------------------------------------------------------------

end Frac_Tests;
