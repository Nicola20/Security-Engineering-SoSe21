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
    -- maby unnecessary, because the parameter is an observer itself?
    NodeObserver : access constant Node_Type:= Node;
begin
    if NodeObserver.Left_Child /= null then
        Put(NodeObserver.Left_Child);
    end if;
    TEXTIO.Put(NodeObserver.Value'image);
    if NodeObserver.Right_Child /= null then
        Put(NodeObserver.Right_Child);
    end if;
end Put;

function Create_Root(Value : Integer) return not null Node_Access is
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
        --recursive call
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
-- borrower of Node was marked by the compiler warning as unneccessary
begin
    -- No explicit borrower allowed, because when we set the borrower as Left or Right child, the borrower never gets out of scope
    Delete_Node(Node.Right_Child);
end Delete_Right;

procedure Delete_Left(Node : Node_Access) is
begin
    Delete_Node(Node.Left_Child);
end Delete_Left;

end Tree;
