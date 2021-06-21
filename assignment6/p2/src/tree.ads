--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Lucas Hübner (116232),
-- Philipp Tornow (118332)
-- Description: Tree package declaration
--------------------------------------------------------------

package Tree is

    pragma Assertion_Policy(Pre => Check);
    pragma Assertion_Policy(Post => Check);
    pragma SPARK_Mode (On);

    type Node_Type;
    type Node_Access is access Node_Type;
    type Node_Type is record
        Left_Child : Node_Access;
        Right_Child : Node_Access;
        Value : Integer;
    end record;

    procedure Put(Node: access constant Node_Type) with
        Pre => Node /= null;
    -- Prints the Value of the node and its chidlren
    function Create_Root(Value : Integer) return not null Node_Access with
        Global => null,
        Depends => (Create_Root'Result => Value),
        Pre => Value < Integer'Last,
        Post => (Create_Root'Result /= null and then Create_Root'Result.all.Value = Value);

    procedure Add_Left(Node : in Node_Access; Value : Integer) with
        Global => null,
        Depends => (Node => (Node,Value)),
        Pre => Value < Integer'Last and Node /= null,
        Post => Node.Left_Child /= null;

    procedure Add_Right(Node : in Node_Access; Value : Integer) with
        Global => null,
        Depends => (Node => (Node,Value)),
        Pre => Value < Integer'Last and then Node /= null,
        Post => Node.Right_Child /= null;

    procedure Delete_Right(Node : Node_Access) with
        Pre => Node /= null and then Node.Right_Child /= null and then Node.Right_Child.Left_Child = null and then Node.Right_Child.Right_Child = null,
        Post => Node.Right_Child = null;
    -- Allows to delete the right child, if it has no children itself
    procedure Delete_Left(Node : Node_Access) with
        Pre => Node /= null and then Node.Left_Child /= null and then Node.Left_Child.Left_Child = null and then Node.Left_Child.Right_Child = null,
        Post => node.Left_Child = null;
    -- Allows to delete the left child, if it has no children itself


end Tree;
