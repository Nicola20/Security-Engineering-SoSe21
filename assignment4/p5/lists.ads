--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: Lists baby
--------------------------------------------------------------

generic
    type Item_Type is private;
package Lists is
    type Item_Record is private;
    type List_Header is private;
    type List_Type is tagged private;
    type List_Iterator_Type is private;
    
    function First(List: List_Type) return List_Iterator_Type;
    -- Returns an Iterator that points to the first item of the list.
    -- Raises Iterator_Error if list is empty.
    function Last (List: List_Type) return List_Iterator_Type;
    -- Returns an Iterator that points to the last item of the list.
    -- Raises Iterator_Error if list is empty.
    function Succ (Iterator: List_Iterator_Type) return List_Iterator_Type;
    -- Returns an Iterator that points to the next item in the list.
    -- Returns Iterator_Error if Iterator is null or points to the last item.
    function Pred (Iterator: List_Iterator_Type) return List_Iterator_Type;
    -- Returns an Iterator that points to the previous item in the list.
    -- Returns Iterator_Error if Iterator is null or points to the first item.
    function Value(Iterator: List_Iterator_Type) return Item_Type;
    -- Returns the value at the current position of Iterator.
    -- Returns Iterator_Error if Iterator is null or list is empty.
    function Size (List: List_Type) return Natural;
    -- Returns the number of items in List.

    function Create_List return List_Type;
    -- Creates and returns a new empty List

    procedure Append(List: List_Type; Item: Item_Type);
    -- Appends Item to the last position of the list.
    procedure Prepend(List: List_Type; Item: Item_Type);
    -- Adds Item at the first position of the list.
    procedure Insert(Iterator: in out List_Iterator_Type; Item: Item_Type);
    -- Inserts Item before the current position of Iterator.
    -- Sets Iterator to the new item.
    -- Raises Iterator_Error if the list of Iterator is null.
    procedure Delete(Iterator: in out List_Iterator_Type);
    -- Deletes the current Item of Iterator.
    -- Sets Iterator to the Item that came after the deleted item or to
    -- the new last Item if the previous last Item was deleted.
    -- Raises Iterator_Error if Iterator is null or points to no item.
    
    Iterator_Error: exception;
    
    private 
        type Item_Type_Access is access Item_Type;
        type Item_Access is access Item_Record;
        type Item_Record is record 
            Value   : Item_Type;
            Next    : Item_Access;
            Prev    : Item_Access;
        end record;

        type List_Access is access List_Header;
        type List_Header is record
            First   : Item_Access;
            Last    : Item_Access;
            Count   : Natural := 0;
        end record;

        type List_Type is tagged record
            List : List_Access;
        end record;

        type List_Iterator_Type is record
            List    : List_Access;
            Current : Item_Access;
        end record;

end Lists;
