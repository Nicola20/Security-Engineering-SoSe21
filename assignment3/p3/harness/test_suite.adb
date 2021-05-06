with Frac_Tests;

package body Test_Suite is

    Result: aliased AUnit.Test_Suites.Test_Suite;
    Test: aliased Frac_Tests.Test;

	function Suite return Access_Test_Suite is
	begin
	    Add_Test(Result'Access, Test'Access);
		return Result'Access;
	end Suite;

end Test_Suite;
