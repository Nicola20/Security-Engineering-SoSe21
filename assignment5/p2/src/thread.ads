package Thread
    with SPARK_Mode => On
is
    type State  is (None, Ready, Running, Stopped, Sleeping, Waiting);
    type Action is (Notify, Resume, Sleep, Start, Stop, Wait);

    S: State := None;

    procedure Initialize with
        Global => (Output => S);
    -- Sets S to Ready.

    procedure Do_Action(A: Action) with
        Global => (In_Out => S),
        Depends => (S => (A,S));
        -- Updates the state S according to the given input state S, and the
        -- given action A. Sets S to None if the transition is not defined

    function Get_State return State with
        Global => S;


    private

    procedure Set_State(NS: State) with
        Global => (Output => S),
        Depends => (S => NS);

end Thread;
