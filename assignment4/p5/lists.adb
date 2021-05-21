with Lists, Ada.Unchecked_Deallocation;
package body Lists is

    function First(List: List_Type) return List_Iterator_Type is
    begin
        if List.List.Count < 1 then
            raise Iterator_Error;
        else
            return (List => List.List, Current => List.List.First);
        end if;
    end First;

    function Last (List: List_Type) return List_Iterator_Type is
    begin
        if List.List.Count < 1 then
            raise Iterator_Error;
        else
            return (List => List.List, Current => null);
        end if;
    end Last;

    function Succ (Iterator: List_Iterator_Type) return List_Iterator_Type is
    begin
        if Iterator.List = null or else Iterator.Current = null then
            raise Iterator_Error;
        else 
            return(List => Iterator.List, Current => Iterator.Current.Next);
        end if;
    end Succ;

    function Pred (Iterator: List_Iterator_Type) return List_Iterator_Type is
    begin
        if Iterator.List = null or else Iterator.Current = Iterator.List.First then
            raise Iterator_Error;
        else 
            return(List => Iterator.List, Current => Iterator.Current.Prev);
        end if;
    end Pred;

    function Value(Iterator: List_Iterator_Type) return Item_Type is 
    begin
        if Iterator.List = null or else Iterator.Current = null then
            raise Iterator_Error;
        else
            return Iterator.Current.Value;
        end if;
    end Value;

    function Size (List: List_Type) return Natural is 
    begin
        return List.List.Count;
    end Size;

    function Create_List return List_Type is
    begin 
        return (List => new List_header);
    end Create_List;

    procedure Append(List: List_Type; Item: Item_Type) is
        New_Entry : Item_Access;
    begin
        New_Entry := new Item_Record;
        New_Entry.Value := Item;
        New_Entry.Next := null;
        New_Entry.Prev := List.List.Last;
        List.List.Last.Next := New_Entry;
        List.List.Last := New_Entry;
    end Append;

    procedure Prepend(List: List_Type; Item: Item_Type) is
        New_Entry : Item_Access;
    begin
        New_Entry := new Item_Record;
        New_Entry.Value := Item;
        New_Entry.Prev := null;
        New_Entry.Next := List.List.First;
        List.List.First.Prev := New_Entry;
        List.List.First := New_Entry;
    end Prepend;

    procedure Insert(Iterator: in out List_Iterator_Type; Item: Item_Type) is 
        New_Entry : Item_Access;
    begin
        if Iterator.List = null then
            raise Iterator_Error;
        else
            New_Entry := new Item_Record;
            New_Entry.Next := Iterator.Current;
            New_Entry.Value := Item;

            if Iterator.Current = null then
                New_Entry.Prev := Iterator.List.Last;
                Iterator.List.Last := New_Entry;
            else
                New_Entry.Prev := Iterator.Current.Prev;
                Iterator.Current.Prev := New_Entry;
            end if;

            if Iterator.Current = Iterator.List.First then
                Iterator.List.First := New_Entry;
            else
                New_Entry.Prev.Next := New_Entry;
            end if;

            Iterator.List.Count := Iterator.List.Count + 1;
        end if;
    end Insert;

    procedure Delete(Iterator: in out List_Iterator_Type) is
        Value : Item_Access;
        procedure Free is new Ada.Unchecked_Deallocation (Item_Record, Item_Access);
    begin
        if Iterator.List = null or else Iterator.Current = null then
            raise Iterator_Error;
        else
            if Iterator.Current.Next = null then
                Iterator.List.Last := Iterator.Current.Prev;
            else
                Iterator.Current.Next.Prev := Iterator.Current.Prev;
            end if;

            if Iterator.Current.Prev = null then
                Iterator.List.First := Iterator.Current.Next;
            else
                Iterator.Current.Prev.Next := Iterator.Current.Next;
            end if;

            Value := Iterator.Current;
            Free (Value);
            Iterator.List.Count := Iterator.List.Count - 1;
        end if;
    end Delete;

end Lists;