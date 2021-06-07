context with Thread;
        with Ada.Text_IO;
        use Thread;
        use Ada.Text_IO;

code    Put_line("Test Thread package.");
        New_Line;

        Put_line("Test Thread initialization.");

***** (1.1) Test Init
define Result: State;
test Initialize;
     Result := Get_State;
pass (Result = Ready)

***** (1.2) Test Start
define Result: State;
test Do_Action(Start);
     Result := Get_State;
pass (Result = Running)

***** (1.3) Test Wait
define Result: State;
test Do_Action(Wait);
     Result := Get_State;
pass (Result = Waiting)

***** (1.4) Test Notify
define Result: State;
test Do_Action(Notify);
     Result := Get_State;
pass (Result = Running)

***** (1.5) Test Sleep
define Result: State;
test Do_Action(Sleep);
     Result := Get_State;
pass (Result = Sleeping)

***** (1.6) Test Resume
define Result: State;
test Do_Action(Resume);
     Result := Get_State;
pass (Result = Ready)

***** (1.7) Test Stop
define Result: State;
test Do_Action(Start);
     Do_Action(Stop);
     Result := Get_State;
pass (Result = Stopped)

