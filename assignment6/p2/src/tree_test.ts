context with Tree;
        with Ada.Text_IO;
        use Tree;
        use Ada.Text_IO;

code    Put_line("Test Tree package.");
code New_Line;
code Put_line("Test Root Creation.");

***** (1) Test Root Creation
define  Result: Node_Access;
        Value: Integer;
test    Value := 42;
        Result := Create_Root(Value);
        Tree.Put(Result);
        Put_line("");
pass    (Result.Value = Value)

code    Put_line("");
        Put_line("Test Add Left.");

***** (2) Test Add_Left
define  Root: Node_Access;
        Value: Integer;
        Value1: constant Integer := 77;
        Value2: constant Integer := 69;
test    Value := 42;
        Root := Create_Root(Value);
        Add_Left(Root, Value1);
        Add_Left(Root.Left_Child, Value2);
        Tree.Put(Root);
        Put_line("");
pass    (Root.Left_Child.Value = Value1) AND (Root.Left_Child.Left_Child.Value = Value2)

code    Put_line("");
        Put_line("Test Add_Right.");

***** (3) Test Add_Right
define  Root: Node_Access;
        Value: Integer;
        Value1: constant Integer := 77;
        Value2: constant Integer := 69;
test    Value := 42;
        Root := Create_Root(Value);
        Add_Right(Root, Value1);
        Add_Right(Root.Right_Child, Value2);
        Tree.Put(Root);
        Put_line("");
pass    (Root.Right_Child.Value = Value1) AND (Root.Right_Child.Right_Child.Value = Value2)

code    Put_line("");
        Put_line("Test Delete_Left.");

***** (4) Test Delete_Left
define  Root: Node_Access;
        Value: Integer;
        Value1: constant Integer := 77;
        Value2: constant Integer := 69;
test    Value := 42;
        Root := Create_Root(Value);
        Add_Left(Root, Value1);
        Add_Right(Root, Value2);
        Put_line("");
        Tree.Put(Root);
        Delete_Left(Root);
        Put_line("");
        Put_line("Deleted left:");
        Tree.Put(Root);
pass    (Root.Left_Child = null) AND (Root.Right_Child.Value = Value2)

code    Put_line("");
        Put_line("Test Delete_Right.");

***** (5) Test Delete_Right
define  Root: Node_Access;
        Value: Integer;
        Value1: constant Integer := 77;
        Value2: constant Integer := 69;
test    Value := 42;
        Root := Create_Root(Value);
        Add_Left(Root, Value1);
        Add_Right(Root, Value2);
        Put_line("");
        Tree.Put(Root);
        Delete_Right(Root);
        Put_line("Deleted Right.");
        Tree.Put(Root);
pass    (Root.Right_Child = null) AND (Root.Left_Child.Value = Value1)

