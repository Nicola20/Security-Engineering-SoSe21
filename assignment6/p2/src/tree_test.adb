-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       /mnt/c/wsl_share/1_FS_Master/Security_Engineering/Security-Engineering-SoSe21/assignment6/p2/src/tree_test.adb
  -- Script:     /mnt/c/wsl_share/1_FS_Master/Security_Engineering/Security-Engineering-SoSe21/assignment6/p2/src/tree_test.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Tree;
with Ada.Text_IO;
use Tree;
use Ada.Text_IO;

procedure tree_test is

  package Driver_Internals is
    -- Global Data
    Program_Terminate     : exception;
    Fail_Result           : Boolean := False;
    Unexpected_Error      : Boolean := False;
    Status                : Ada.Command_Line.Exit_Status := 0;
    -- Data of last Test Case
    Test_Case_Passed      : Boolean := False;
    -- Access Routines
    procedure Set_Path (Path : in String);
    function Path_Was (Path : in String) return Boolean;
    function Taken_Path return String;
    function Passed return Boolean;
    function Failed return Boolean;
  end Driver_Internals;

  package body Driver_Internals is
    -- Data of last Test Case
    Test_Case_Path        : String (1.. 256);
    Test_Case_Path_Length : Natural := 0;
    -- Access Routines
    procedure Set_Path (Path : in String) is
      begin
        Test_Case_Path (Test_Case_Path'First..Path'Length) := Path;
        Test_Case_Path_Length := Path'Length;
      end Set_Path;
    function Path_Was (Path : in String) return Boolean is
      begin
        return Test_Case_Path_Length = Path'Length
            and then Test_Case_Path (1..Path'Length) = Path;
      end Path_Was;
    function Taken_Path return String is
      begin return Test_Case_Path (1..Test_Case_Path_Length); end Taken_Path;
    function Passed return Boolean is
      begin return Test_Case_Passed; end Passed;
    function Failed return Boolean is
      begin return not Test_Case_Passed; end Failed;
  end Driver_Internals;

begin  -- unit main block

  -- Code section
  begin
    Put_line("Test Tree package.");
  end;  -- code block

  -- Code section
  begin
    New_Line;
  end;  -- code block

  -- Code section
  begin
    Put_line("Test Root Creation.");
  end;  -- code block

  -- Test Case (1)   (1) Test Root Creation
  declare
    Result: Node_Access;
    Value: Integer;
  begin  -- test case
    begin  -- test part
      Value := 42;
      Result := Create_Root(Value);
      Tree.Put(Result);
      Put_line("");
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Result.Value = Value)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  (1) Test Root Creation");
          Put_Line ("           Script name:'tree_test.ts'; Line:10 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(1)  (1) Test Root Creation");
        Put_Line ("           Script name:'tree_test.ts'; Line:10 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 1.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Put_line("");
    Put_line("Test Add Left.");
  end;  -- code block

  -- Test Case (2)   (2) Test Add_Left
  declare
    Root: Node_Access;
    Value: Integer;
    Value1: constant Integer := 77;
    Value2: constant Integer := 69;
  begin  -- test case
    begin  -- test part
      Value := 42;
      Root := Create_Root(Value);
      Add_Left(Root, Value1);
      Add_Left(Root.Left_Child, Value2);
      Tree.Put(Root);
      Put_line("");
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Root.Left_Child.Value = Value1) AND (Root.Left_Child.Left_Child.Value = Value2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(2)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(2)  (2) Test Add_Left");
          Put_Line ("           Script name:'tree_test.ts'; Line:22 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(2)  (2) Test Add_Left");
        Put_Line ("           Script name:'tree_test.ts'; Line:22 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 2.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Put_line("");
    Put_line("Test Add_Right.");
  end;  -- code block

  -- Test Case (3)   (3) Test Add_Right
  declare
    Root: Node_Access;
    Value: Integer;
    Value1: constant Integer := 77;
    Value2: constant Integer := 69;
  begin  -- test case
    begin  -- test part
      Value := 42;
      Root := Create_Root(Value);
      Add_Right(Root, Value1);
      Add_Right(Root.Right_Child, Value2);
      Tree.Put(Root);
      Put_line("");
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Root.Right_Child.Value = Value1) AND (Root.Right_Child.Right_Child.Value = Value2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(3)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(3)  (3) Test Add_Right");
          Put_Line ("           Script name:'tree_test.ts'; Line:38 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(3)  (3) Test Add_Right");
        Put_Line ("           Script name:'tree_test.ts'; Line:38 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 3.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Put_line("");
    Put_line("Test Delete_Left.");
  end;  -- code block

  -- Test Case (4)   (4) Test Delete_Left
  declare
    Root: Node_Access;
    Value: Integer;
    Value1: constant Integer := 77;
    Value2: constant Integer := 69;
  begin  -- test case
    begin  -- test part
      Value := 42;
      Root := Create_Root(Value);
      Add_Left(Root, Value1);
      Add_Right(Root, Value2);
      Put_line("");
      Tree.Put(Root);
      Delete_Left(Root);
      Put_line("");
      Put_line("Deleted left:");
      Tree.Put(Root);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Root.Left_Child = null) AND (Root.Right_Child.Value = Value2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(4)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(4)  (4) Test Delete_Left");
          Put_Line ("           Script name:'tree_test.ts'; Line:54 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(4)  (4) Test Delete_Left");
        Put_Line ("           Script name:'tree_test.ts'; Line:54 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 4.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Put_line("");
    Put_line("Test Delete_Right.");
  end;  -- code block

  -- Test Case (5)   (5) Test Delete_Right
  declare
    Root: Node_Access;
    Value: Integer;
    Value1: constant Integer := 77;
    Value2: constant Integer := 69;
  begin  -- test case
    begin  -- test part
      Value := 42;
      Root := Create_Root(Value);
      Add_Left(Root, Value1);
      Add_Right(Root, Value2);
      Put_line("");
      Tree.Put(Root);
      Delete_Right(Root);
      Put_line("Deleted Right.");
      Tree.Put(Root);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Root.Left_Child.Value = Value1) AND (Root.Right_Child = null)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(5)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(5)  (5) Test Delete_Right");
          Put_Line ("           Script name:'tree_test.ts'; Line:74 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(5)  (5) Test Delete_Right");
        Put_Line ("           Script name:'tree_test.ts'; Line:74 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 5.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  --  End of test cases
  New_Line;
  Put ("Script name 'tree_test.ts'");
  Put ("; total test result: ");
  if Driver_Internals.Fail_Result then
    Put ("FAIL");
    Driver_Internals.Status := 1;
  else
    Put ("pass");
    Driver_Internals.Status := 0;
  end if;
  Put_Line (".");
  New_Line;
  Ada.Command_Line.Set_Exit_Status (Driver_Internals.Status);

exception
  when Driver_Internals.Program_Terminate =>
    New_Line;
    Put ("Total test result: ");
    if Driver_Internals.Fail_Result then
      Put ("FAIL");
      Driver_Internals.Status := 1;
    else
      Put ("UNDEFINED");
      Driver_Internals.Status := -1;
    end if;
    if Driver_Internals.Unexpected_Error then
      Put_Line (",");
      Put_Line ("        there were one or more errors outside of test cases.");
      Driver_Internals.Status := -1;
    else
      Put_Line (".");
    end if;
    New_Line;
    Ada.Command_Line.Set_Exit_Status (Driver_Internals.Status);
  when E: others =>
    New_Line;
    Put_Line ("Unexpected exception " & Ada.Exceptions.Exception_Name (E) & " propagating out of driver.");
    Put_Line ("Results are undefined.");
    Driver_Internals.Status := -1;
    Ada.Command_Line.Set_Exit_Status (Driver_Internals.Status);

end tree_test;
