-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       /mnt/c/wsl_share/1_FS_Master/Security Engineering/Security-Engineering-SoSe21/assignment3/p3/tests/frac_test_tg.adb
  -- Script:     /mnt/c/wsl_share/1_FS_Master/Security Engineering/Security-Engineering-SoSe21/assignment3/p3/tests/frac_test_tg.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Rational_Numbers;
with Ada.Text_IO;
use Ada.Text_IO;
use Rational_Numbers;

procedure frac_test_tg is

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
    Put_line("Test Rational_Number package.");
    New_Line;
    Put_line("Test Create Fraction");
  end;  -- code block

  -- Test Case (1)   (1) Generate Fraction
  declare
    I1 : constant Integer := 1;
    I2 : constant Integer := 2;
    R1 : Integer;
    R2 : Integer;
    F1 : Fraction;
  begin  -- test case
    begin  -- test part
      F1 := Create_Fraction(I1, I2);
      R1 := Get_Numerator(F1);
      R2 := Get_Denumerator(F1);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (R1 = I1) AND (R2 = I2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  (1) Generate Fraction");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:10 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(1)  (1) Generate Fraction");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:10 ");
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
    Put_line("Test Create Negative Fraction");
  end;  -- code block

  -- Test Case (2)   (2) Generate Negative Fraction
  declare
    I1 : constant Integer := -1;
    I2 : constant Integer := 2;
    R1 : Integer;
    R2 : Integer;
    F1 : Fraction;
  begin  -- test case
    begin  -- test part
      F1 := Create_Fraction(I1, I2);
      R1 := Get_Numerator(F1);
      R2 := Get_Denumerator(F1);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (R1 = I1) AND (R2 = I2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(2)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(2)  (2) Generate Negative Fraction");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:23 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(2)  (2) Generate Negative Fraction");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:23 ");
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
    Put_line("Test Create Fraction and input negative components");
  end;  -- code block

  -- Test Case (3)   (3) Generate Fraction with Negative Components
  declare
    I1 : constant Integer := -1;
    I2 : constant Integer := -2;
    R1 : Integer;
    R2 : Integer;
    F1 : Fraction;
  begin  -- test case
    begin  -- test part
      F1 := Create_Fraction(I1, I2);
      R1 := Get_Numerator(F1);
      R2 := Get_Denumerator(F1);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (R1 = 1) AND (R2 = 2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(3)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(3)  (3) Generate Fraction with Negative Components");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:36 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(3)  (3) Generate Fraction with Negative Components");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:36 ");
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
    Put_line("Test Fraction Addition");
  end;  -- code block

  -- Test Case (4)   (4) Fraction Addition
  declare
    F1_p : Fraction;
    F2_p : Fraction;
    F3_n : Fraction;
    F4_0 : Fraction;
    R1_p : Fraction;
    R2_p : Fraction;
    R3_1 : Fraction;
    R4_n : Fraction;
    R5_0 : Fraction;
    R6_n : Fraction;
    R7_n : Fraction;
    R8_p : Fraction;
  begin  -- test case
    begin  -- prepare part
      F1_p := Create_Fraction(1,2);
      F2_p := Create_Fraction(1,4);
      F3_n := Create_Fraction(-3,4);
      F4_0 := Create_Fraction(0,5);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 4.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      R1_p := F1_p + F2_p;
      R2_p := F1_p + F2_p + F1_p;
      R3_1 := F1_p + F1_p;
      R4_n := F2_p + F3_n;
      R5_0 := F1_p + F2_p + F3_n;
      R6_n := F3_n + F1_P;
      R7_n := F3_n + F3_n;
      R8_p := F1_p + F4_0;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Get_Numerator(R1_p) = 3)
           AND (Get_Denumerator(R1_p) = 4)
           AND (Get_Numerator(R2_p) = 5)
           AND (Get_Denumerator(R2_p) = 4)
           AND (Get_Numerator(R3_1) = 1)
           AND (Get_Denumerator(R3_1) = 1)
           AND (Get_Numerator(R4_n) = -1)
           AND (Get_Denumerator(R4_n) = 2)
           AND (Get_Numerator(R5_0) = 0)
           AND (Get_Denumerator(R5_0) = 1)
           AND (Get_Numerator(R6_n) = -1)
           AND (Get_Denumerator(R6_n) = 4)
           AND (Get_Numerator(R7_n) = -3)
           AND (Get_Denumerator(R7_n) = 2)
           AND (Get_Numerator(R8_p) = 1)
           AND (Get_Denumerator(R8_p) = 2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(4)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(4)  (4) Fraction Addition");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:49 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(4)  (4) Fraction Addition");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:49 ");
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
    Put_line("Test Fraction Subtraction");
  end;  -- code block

  -- Test Case (5)   (5) Fraction Subtraction
  declare
    F1_p : Fraction;
    F2_p : Fraction;
    F3_n : Fraction;
    F4_0 : Fraction;
    F5_1 : Fraction;
    F6_p : Fraction;
    R1_p : Fraction;
    R2_p : Fraction;
    R3_1 : Fraction;
    R4_n : Fraction;
    R5_0 : Fraction;
    R6_n : Fraction;
    R7_n : Fraction;
    R8_p : Fraction;
  begin  -- test case
    begin  -- prepare part
      F1_p := Create_Fraction(1,2);
      F2_p := Create_Fraction(1,4);
      F3_n := Create_Fraction(-3,4);
      F4_0 := Create_Fraction(0,5);
      F5_1 := Create_Fraction(3,3);
      F6_p := Create_Fraction(6,2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 5.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      R1_p := F1_p - F2_p;
      R2_p := F6_p - F2_p  - F1_p;
      R3_1 := F6_p - F5_1 - F5_1;
      R4_n := F2_p - F1_p;
      R5_0 := F1_p - F2_p - F2_p;
      R6_n := F3_n - F2_P;
      R7_n := R4_n - F3_n;
      R8_p := F1_p - F4_0;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Get_Numerator(R1_p) = 1)
           AND(Get_Denumerator(R1_p) = 4)
           AND(Get_Numerator(R2_p) = 9)
           AND(Get_Denumerator(R2_p) = 4)
           AND(Get_Numerator(R3_1) = 1)
           AND(Get_Denumerator(R3_1) = 1)
           AND(Get_Numerator(R4_n) = -1)
           AND(Get_Denumerator(R4_n) = 4)
           AND(Get_Numerator(R5_0) = 0)
           AND(Get_Denumerator(R5_0) = 1)
           AND(Get_Numerator(R6_n) = -1)
           AND(Get_Denumerator(R6_n) = 1)
           AND(Get_Numerator(R7_n) = 1)
           AND(Get_Denumerator(R7_n) = 2)
           AND(Get_Numerator(R8_p) = 1)
           AND(Get_Denumerator(R8_p) = 2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(5)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(5)  (5) Fraction Subtraction");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:104 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(5)  (5) Fraction Subtraction");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:104 ");
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

  -- Code section
  begin
    Put_line("Test Fraction Multiplication");
  end;  -- code block

  -- Test Case (6)   (6) Fraction Multiplication
  declare
    F1_p : Fraction;
    F2_p : Fraction;
    F3_n : Fraction;
    F4_0 : Fraction;
    F5_1 : Fraction;
    R1_p : Fraction;
    R2_n : Fraction;
    R3_p : Fraction;
    R4_0 : Fraction;
  begin  -- test case
    begin  -- prepare part
      F1_p := Create_Fraction(1,2);
      F2_p := Create_Fraction(1,4);
      F3_n := Create_Fraction(-3,4);
      F4_0 := Create_Fraction(0,5);
      F5_1 := Create_Fraction(3,3);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 6.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      R1_p := F5_1 * F1_p;
      R2_n := F3_n * F1_p;
      R3_p := R2_n * F3_n;
      R4_0 := F2_p * F4_0;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Get_Numerator(R1_p) = 1)
              AND (Get_Denumerator(R1_p) = 2)
              AND (Get_Numerator(R2_n) = -3)
              AND (Get_Denumerator(R2_n) = 8)
              AND (Get_Numerator(R3_p) = 9)
              AND (Get_Denumerator(R3_p) = 32)
              AND (Get_Numerator(R4_0) = 0)
              AND (Get_Denumerator(R4_0) = 1)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(6)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(6)  (6) Fraction Multiplication");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:164 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(6)  (6) Fraction Multiplication");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:164 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 6.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Put_line("Test Fraction Division");
  end;  -- code block

  -- Test Case (7)   (7) Fraction Division
  declare
    F1_p : Fraction;
    F2_p : Fraction;
    F3_n : Fraction;
    R1_p : Fraction;
    R2_n : Fraction;
    R3_p : Fraction;
  begin  -- test case
    begin  -- prepare part
      F1_p := Create_Fraction(1,2);
      F2_p := Create_Fraction(1,4);
      F3_n := Create_Fraction(-3,4);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 7.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      R1_p := F1_p / F2_p;
      R2_n := F3_n / F1_p;
      R3_p := R2_n / F3_n;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Get_Numerator(R1_p) = 2)
           AND(Get_Denumerator(R1_p) = 1)
           AND(Get_Numerator(R2_n) = -3)
           AND(Get_Denumerator(R2_n) = 2)
           AND(Get_Numerator(R3_p) = 2)
           AND(Get_Denumerator(R3_p) = 1)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(7)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(7)  (7) Fraction Division");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:203 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(7)  (7) Fraction Division");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:203 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 7.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Put_line("Test Fraction Equality");
  end;  -- code block

  -- Test Case (8)   (8) Fraction Equality
  declare
    F1_p : Fraction;
    F2_p : Fraction;
    F7_p : Fraction;
    F8_n : Fraction;
  begin  -- test case
    begin  -- test part
      F1_p := Create_Fraction(1,2);
      F2_p := Create_Fraction(1,4);
      F7_p := Create_Fraction(2,4);
      F8_n :=  Create_Fraction(-1,2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (F1_p /= F2_p)
           AND (F1_p = F7_p)
           AND (F1_p /= F8_n)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(8)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(8)  (8) Fraction Equality");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:231 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(8)  (8) Fraction Equality");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:231 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 8.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Put_line("Test Fraction Smaller Comparison");
  end;  -- code block

  -- Test Case (9)   (9) Fraction Smaller Comparison
  declare
    F1_p : Fraction;
    F2_p : Fraction;
    F3_n : Fraction;
    F4_0 : Fraction;
  begin  -- test case
    begin  -- test part
      F1_p := Create_Fraction(1,2);
      F2_p := Create_Fraction(1,4);
      F3_n := Create_Fraction(-3,4);
      F4_0 := Create_Fraction(0,5);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (F2_p < F1_p)
           AND (F3_n < F2_p)
           AND (F4_0 < F1_p)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(9)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(9)  (9) Fraction Smaller Comparison");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:248 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(9)  (9) Fraction Smaller Comparison");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:248 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 9.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Put_line("Test Fraction Greater Comparison");
  end;  -- code block

  -- Test Case (10)   (10) Fraction Greater Comparison
  declare
    F1_p : Fraction;
    F2_p : Fraction;
    F3_n : Fraction;
    F4_0 : Fraction;
  begin  -- test case
    begin  -- test part
      F1_p := Create_Fraction(1,2);
      F2_p := Create_Fraction(1,4);
      F3_n := Create_Fraction(-3,4);
      F4_0 := Create_Fraction(0,5);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (F1_p > F2_P)
           AND(F2_p > F3_n)
           AND(F1_p > F4_0)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(10)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(10)  (10) Fraction Greater Comparison");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:266 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(10)  (10) Fraction Greater Comparison");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:266 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 10.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Put_line("Test Sign Positive Fraction");
  end;  -- code block

  -- Test Case (11)   (11) Fraction Sign Positive
  declare
    Result : Sign_Type;
    F1_p : Fraction;
  begin  -- test case
    begin  -- prepare part
      F1_p := Create_Fraction(1,2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 11.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result := Sign(F1_p);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result = 1
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(11)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(11)  (11) Fraction Sign Positive");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:283 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(11)  (11) Fraction Sign Positive");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:283 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 11.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Put_line("Test Sign Negative");
  end;  -- code block

  -- Test Case (12)   (12) Fraction Sign Negative
  declare
    Result : Sign_Type;
    F3_n : Fraction;
  begin  -- test case
    begin  -- prepare part
      F3_n := Create_Fraction(-3,4);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 12.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result := Sign(F3_n);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result = -1
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(12)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(12)  (12) Fraction Sign Negative");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:293 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(12)  (12) Fraction Sign Negative");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:293 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 12.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Put_line("Test Fraction Sign 0");
  end;  -- code block

  -- Test Case (13)   (13) Fraction Sign Null
  declare
    Result : Sign_Type;
    F4_0 : Fraction;
  begin  -- test case
    begin  -- prepare part
      F4_0 := Create_Fraction(0,5);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 13.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result := Sign(F4_0);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result = 0
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(13)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(13)  (13) Fraction Sign Null");
          Put_Line ("           Script name:'frac_test_tg.ts'; Line:303 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(13)  (13) Fraction Sign Null");
        Put_Line ("           Script name:'frac_test_tg.ts'; Line:303 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 13.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Ada.Text_IO.Put_line("All tests done.");
  end;  -- code block

  --  End of test cases
  New_Line;
  Put ("Script name 'frac_test_tg.ts'");
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

end frac_test_tg;
