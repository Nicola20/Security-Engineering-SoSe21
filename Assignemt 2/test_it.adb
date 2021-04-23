with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;

package body Test_It is

    procedure Test_This( F : F_Type_D; A : A_Type; B : B_Type; R : R_Type) is 
        result : R_Type;
        startTime, endTime : time;
        milliS : Duration;
    begin
        startTime := Clock;
        result := F(A,B);
        endTime := Clock;
        milliS := (endTime - startTime) * 1000;

        
        if R = result then 
            put_line(Description & " (" & Duration'Image(milliS) & " ms ) -> Pass!");
        else 
            put_line(Description & " (" & Duration'Image(milliS) & " ms ) -> Failed!");
        end if;
        new_line;
    end Test_This;

    procedure Test_This( F : F_Type_S; A : A_Type; R : R_Type) is 
        result : R_Type;
        startTime, endTime : time;
        milliS : Duration;
    begin
        startTime := Clock;
        result := F(A);
        endTime := Clock;
        milliS := (endTime - startTime) * 1000;
        
        if R = result then 
            put_line(Description & " (" & Duration'Image(milliS) & " ms ) -> Pass!");
        else 
            put_line(Description & " (" & Duration'Image(milliS) & " ms ) -> Failed!");
        end if;
        new_line;
    end Test_This;

end Test_It;