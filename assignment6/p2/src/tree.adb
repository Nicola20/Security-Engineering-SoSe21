--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Lucas Hübner (116232),
-- Philipp Tornow (118332)
-- Description: Tree package definition
--------------------------------------------------------------

with ada.Text_IO;
with ada.Unchecked_Deallocation;

package body Tree is
    pragma SPARK_Mode (On);

package TEXTIO renames Ada.Text_IO;

procedure Delete_Node is new Ada.Unchecked_Deallocation(Node_Type, Node_Access);

procedure Put(Node: access constant Node_Type) is
    PrintValue : Integer;
    LeftNode : Node_Access;
    RightNode : Node_Access;
begin
    LeftNode := Node.Left_Child;
    RightNode := Node.Right_Child;
    PrintValue := Node.Value;
    if LeftNode /= null then
        Put(LeftNode);
    end if;
    TEXTIO.Put(PrintValue'image);
    if RightNode /= null then
        Put(RightNode);
    end if;
end Put;

function Create_Root(Value : Integer) return Node_Access is
    Root: Node_Access;
begin
    Root := new Node_Type'(null, null, Value);
    return Root;
end Create_Root;

procedure Add_Left(Node : in Node_Access; Value : Integer) is
begin
    if Node.Left_Child = null then
        Node.Left_Child := new Node_Type'(null, null, Value);
    else
        Add_Left(Node.Left_Child, Value);
    end if;
end Add_Left;

procedure Add_Right(Node : in Node_Access; Value : Integer) is
begin
    if Node.Right_Child = null then
        Node.Right_Child := new Node_Type'(null, null, Value);
    else
        Add_Right(Node.Right_Child, Value);
    end if;
end Add_Right;

procedure Delete_Right(Node : Node_Access) is
    RightNode : Node_Access;
begin
    RightNode := Node.Right_Child;
    if RightNode /= null then
        if RightNode.Left_Child /= null then
            Delete_Left(RightNode.Left_Child);
        end if;

        if RightNode.Right_Child /= null then
            Delete_Right(RightNode.Right_Child);
        end if;
        Delete_Node(Node.Right_Child);
    end if;
end Delete_Right;

procedure Delete_Left(Node : Node_Access) is
    LeftNode : Node_Access;
begin
    LeftNode := Node.Left_Child;
    if LeftNode /= null then
        if LeftNode.Left_Child /= null then
            Delete_Left(LeftNode.Left_Child);
        end if;

        if LeftNode.Right_Child /= null then
            Delete_Right(LeftNode.Right_Child);
        end if;
        Delete_Node(Node.Left_Child);
    end if;
end Delete_Left;

end Tree;
