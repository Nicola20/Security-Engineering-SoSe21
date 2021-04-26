--------------------------------------------------------------
-- Authors: Nicola Lea Libera (117073), Philipp Tornow (118332)
--          Lucas Hübner (116232)
-- Description: A programm which displays 2 random playing cards.
--------------------------------------------------------------

with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;

procedure Cards is

    package TEXTIO renames Ada.Text_IO;
    package Symbol_IO is new TEXTIO.Enumeration_IO(Symbol);

    -- define enums for suits and symbols
    type Suit is (Club,Diamond,Heart,Spade);
    type Symbol is (Ace,Jack,Queen,King);

    -- declare values
    type Value is range 1..13;

    -- define card record to check equality
    type Card is record
        S : Suit;
        V : Value;
    end record;

    -- define random card function
    function Rand_Card return Card is
        package Random_Suit is new Ada.Numerics.Discrete_Random(Suit);
        package Random_Index is new Ada.Numerics.Discrete_Random(Value);
        Suit_G : Random_Suit.Generator;
        Index_G : Random_Index.Generator;
        Res : Card;

    begin
        -- get random suit
        Random_Suit.Reset(Suit_G);
        Res.S := Random_Suit.Random(Suit_G);

        -- get random value index
        Random_Index.Reset(Index_G);
        Res.V := Random_Index.Random(Index_G);

        return Res;

    end Rand_Card;

    -- Results
    Card_1 : Card;
    Card_2 : Card;

begin
    -- query 2 cards
    Card_1 := Rand_Card;
    loop
        Card_2 := Rand_Card;
        exit when Card_1 /= Card_2;
    end loop;
    -- in case of querying any number of cards, a vector has to be used

    -- print corresponding cards
    if Card_1.V = 1 then
        TEXTIO.Put("Card 1: " & Card_1.S'Image & " ");
        Symbol_IO.Put(Symbol'Val(0));
        TEXTIO.New_Line;
    elsif Card_1.V > 10 then
        TEXTIO.Put("Card 1: " & Card_1.S'Image & " ");
        Symbol_IO.Put(Symbol'Val(Card_1.V-10));
        TEXTIO.New_Line;
    else
        TEXTIO.Put_Line("Card 1: " & Card_1.S'Image & Card_1.V'Image);
    end if;

    if Card_2.V = 1 then
        TEXTIO.Put("Card 2: " & Card_2.S'Image & " ");
        Symbol_IO.Put(Symbol'Val(0));
        TEXTIO.New_Line;
    elsif Card_2.V > 10 then
        TEXTIO.Put("Card 2: " & Card_2.S'Image & " ");
        Symbol_IO.Put(Symbol'Val(Card_2.V-10));
        TEXTIO.New_Line;
    else
        TEXTIO.Put_Line("Card 2: " & Card_2.S'Image & Card_2.V'Image);
    end if;
end Cards;