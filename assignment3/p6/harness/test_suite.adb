with Bank_Accounts_Tests;
with Bank_Accounts_Fees_Tests;
with Bank_Accounts_Overdrawable_Tests;

package body Test_Suite is

    Result: aliased AUnit.Test_Suites.Test_Suite;
    Bank_Accounts_Test: aliased Bank_Accounts_Tests.Test;
    Bank_Accounts_Fees_Test: aliased Bank_Accounts_Fees_Tests.Test;
    Bank_Accounts_Overdrawable_Test: aliased Bank_Accounts_Overdrawable_Tests.Test;

	function Suite return Access_Test_Suite is
	begin
	    Add_Test(Result'Access, Bank_Accounts_Test'Access);
	    Add_Test(Result'Access, Bank_Accounts_Fees_Test'Access);
	    Add_Test(Result'Access, Bank_Accounts_Overdrawable_Test'Access);
		return Result'Access;
	end Suite;

end Test_Suite;
