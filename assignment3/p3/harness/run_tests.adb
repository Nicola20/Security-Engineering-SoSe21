with AUnit.Run;
with AUnit.Reporter.Text;
with Test_Suite;

use AUnit.Run;
use AUnit.Reporter.Text;

procedure Run_Tests is
    procedure Run is new Test_Runner(Test_Suite.Suite);
    Reporter: Text_Reporter;
begin
    Run(Reporter);
end Run_Tests;
