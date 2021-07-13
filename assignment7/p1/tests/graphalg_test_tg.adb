-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       /mnt/c/wsl_share/1_FS_Master/Security_Engineering/Security-Engineering-SoSe21/assignment7/p1/tests/graphalg_test_tg.adb
  -- Script:     /mnt/c/wsl_share/1_FS_Master/Security_Engineering/Security-Engineering-SoSe21/assignment7/p1/tests/graphalg_test_tg.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Graph;
with Graph_Algorithms;
with Ada.Text_IO;
use Ada.Text_IO;

procedure graphalg_test_tg is

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
    Put_line("Test Graph_Algorithms package.");
  end;  -- code block

  -- Code section
  begin
    New_Line;
  end;  -- code block

  -- Code section
  begin
    Put_line("Test Graph Creation.");
  end;  -- code block

  -- Test Case (1)   (1) Test Graph Creation
  declare
    subtype Vertex_Type is Integer;
    package Test_Graph is new Graph(Vertex_Type, "=");
    use Test_Graph;
    package Graph_Algorithms_Instance is new Graph_Algorithms(Vertex_Type, "=", Test_Graph);
    use Graph_Algorithms_Instance;
    Graph_Vertices_Array: Vertex_Array(1..8);
  begin  -- test case
    begin  -- test part
      Add_Vertex(1);
      Add_Vertex(2);
      Add_Vertex(3);
      Add_Vertex(4);
      Add_Vertex(5);
      Add_Vertex(6);
      Add_Vertex(7);
      Add_Vertex(8);
      Add_Edge(1,2,4);
      Add_Edge(1,3,3);
      Add_Edge(1,4,5);
      Add_Edge(2,4,3);
      Add_Edge(2,6,6);
      Add_Edge(3,4,2);
      Add_Edge(3,6,8);
      Add_Edge(4,5,5);
      Add_Edge(4,6,6);
      Add_Edge(4,7,5);
      Add_Edge(4,8,7);
      Add_Edge(5,8,6);
      Add_Edge(6,7,4);
      Add_Edge(7,8,2);
      Graph_Vertices_Array := To_Vertex_Array;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Graph_Vertices_Array'Length = 8)
              AND Has_Edge(1, 2)
              AND Has_Edge(1, 3)
              AND Has_Edge(1, 4)
              AND Has_Edge(2, 4)
              AND Has_Edge(2, 6)
              AND Has_Edge(3, 4)
              AND Has_Edge(3, 6)
              AND Has_Edge(4, 5)
              AND Has_Edge(4, 6)
              AND Has_Edge(4, 7)
              AND Has_Edge(4, 8)
              AND Has_Edge(5, 8)
              AND Has_Edge(6, 7)
              AND Has_Edge(7, 8)
              AND (Graph_Vertices_Array(1) = 1)
              AND (Graph_Vertices_Array(2) = 2)
              AND (Graph_Vertices_Array(3) = 3)
              AND (Graph_Vertices_Array(4) = 4)
              AND (Graph_Vertices_Array(5) = 5)
              AND (Graph_Vertices_Array(6) = 6)
              AND (Graph_Vertices_Array(7) = 7)
              AND (Graph_Vertices_Array(8) = 8)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  (1) Test Graph Creation");
          Put_Line ("           Script name:'graphalg_test_tg.ts'; Line:11 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(1)  (1) Test Graph Creation");
        Put_Line ("           Script name:'graphalg_test_tg.ts'; Line:11 ");
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
    Put_line("Test Kruskal Algorithm.");
  end;  -- code block

  -- Test Case (2)   (2) Test Kruskal Algorithm with connected Testgraph
  declare
    subtype Vertex_Type is Integer;
    package Test_Graph is new Graph(Vertex_Type, "=");
    use Test_Graph;
    package Graph_Algorithms_Instance is new Graph_Algorithms(Vertex_Type, "=", Test_Graph);
    use Graph_Algorithms_Instance;
    Result_Spanning_Tree : Edge_Array_Access;
  begin  -- test case
    begin  -- test part
      Add_Vertex(1);
      Add_Vertex(2);
      Add_Vertex(3);
      Add_Vertex(4);
      Add_Vertex(5);
      Add_Vertex(6);
      Add_Vertex(7);
      Add_Vertex(8);
      Add_Edge(1,2,4);
      Add_Edge(1,3,3);
      Add_Edge(1,4,5);
      Add_Edge(2,4,3);
      Add_Edge(2,6,6);
      Add_Edge(3,4,2);
      Add_Edge(3,6,8);
      Add_Edge(4,5,5);
      Add_Edge(4,6,6);
      Add_Edge(4,7,5);
      Add_Edge(4,8,7);
      Add_Edge(5,8,6);
      Add_Edge(6,7,4);
      Add_Edge(7,8,2);
      Find_Min_Spanning_Tree(Result_Spanning_Tree);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Result_Spanning_Tree.all(0).Weight = 2)
           AND (Result_Spanning_Tree.all(1).Weight = 2)
           AND (Result_Spanning_Tree.all(2).Weight = 3)
           AND (Result_Spanning_Tree.all(3).Weight = 3)
           AND (Result_Spanning_Tree.all(4).Weight = 4)
           AND (Result_Spanning_Tree.all(5).Weight = 5)
           AND (Result_Spanning_Tree.all(6).Weight = 5)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(2)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(2)  (2) Test Kruskal Algorithm with connected Testgraph");
          Put_Line ("           Script name:'graphalg_test_tg.ts'; Line:72 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(2)  (2) Test Kruskal Algorithm with connected Testgraph");
        Put_Line ("           Script name:'graphalg_test_tg.ts'; Line:72 ");
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

  --  End of test cases
  New_Line;
  Put ("Script name 'graphalg_test_tg.ts'");
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

end graphalg_test_tg;
