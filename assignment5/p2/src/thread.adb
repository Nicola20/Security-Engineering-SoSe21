package body Thread
    with SPARK_Mode => On
is

procedure Initialize is
begin
    S:= Ready;
end Initialize;

procedure Do_Action(A: Action) is
begin
    case A is
        when Start =>
            if S=Running then
                null;
            elsif S=Ready then
                Set_State(Running);
            else
                Set_State(None);
            end if;

         when Stop =>
            if S=Stopped then
                null;
            elsif S/=Ready then
               Set_State(Stopped);
            else
               Set_State(None);
            end if;

        when Sleep =>
            if S=Sleeping then
                null;
            elsif S=Running then
                Set_State(Sleeping);
            else
                Set_State(None);
            end if;

        when Resume =>
            if S=Sleeping then
                Set_State(Ready);
            else
                Set_State(None);
            end if;

        when Wait =>
            if S = Waiting then
                null;
            elsif S = Running then
                Set_State(Waiting);
            else
                Set_State(None);
            end if;

        when Notify =>
            if S = Waiting then
                Set_State(Running);
            else
                Set_State(None);
            end if;
    end case;
end Do_Action;

function Get_State return State is
begin
    return S;
end Get_State;

procedure Set_State(NS: State) is
begin
    S := NS;
end Set_State;

end Thread;
