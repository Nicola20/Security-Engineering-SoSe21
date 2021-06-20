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

    procedure Put(Node: access constant Node_Type);
    -- Prints the Value of the node and its chidlren
    function Create_Root(Value : Integer) return Node_Access;
    procedure Add_Left(Node : in Node_Access; Value : Integer);
    procedure Add_Right(Node : in Node_Access; Value : Integer);
    procedure Delete_Right(Node : Node_Access);
    -- use temp var to swap
    -- deallocate

    -- Allows to delete the right child, if it has no children itself
    procedure Delete_Left(Node : Node_Access);
    -- Allows to delete the left child, if it has no children itself


end Tree;
