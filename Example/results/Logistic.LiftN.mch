// Config: Logistic, Learning Rate = 2^-7, Number of Training Epochs = 1000

MACHINE LiftN
SETS /* enumerated */
  EM={up,down,idle};
  DR={opened,closed}
CONCRETE_CONSTANTS
  MinFloor,
  MaxFloor
ABSTRACT_VARIABLES
  Floor,
  Door,
  EMch
PROPERTIES
    MinFloor : INTEGER
  & MaxFloor : INTEGER
  & MinFloor = -1
  & MaxFloor = 15
INVARIANT
    Door : DR
  & EMch : EM
  & Floor : MinFloor .. MaxFloor
  & not(Door = opened & not(EMch = idle))
INITIALISATION
    BEGIN
        Floor := MinFloor
      ;
        EMch := idle
      ;
        Door := closed
    END
OPERATIONS
  go_up = 
    PRE 
        not(Floor = 15 & Door = closed & EMch = idle)
      & not(Floor = 15 & Door = closed & EMch = up)
      & not(Floor = 15 & Door = opened & EMch = idle)
      & not(Floor = 14 & Door = opened & EMch = idle)
      & not(Floor = 13 & Door = opened & EMch = idle)
      & not(Floor = 12 & Door = opened & EMch = idle)
      & not(Floor = 11 & Door = opened & EMch = idle)
      & not(Floor = 10 & Door = opened & EMch = idle)
      & not(Floor = 9 & Door = opened & EMch = idle)
      & not(Floor = 8 & Door = opened & EMch = idle)
      & not(Floor = 7 & Door = opened & EMch = idle)
      & not(Floor = 6 & Door = opened & EMch = idle)
      & not(Floor = 5 & Door = opened & EMch = idle)
      & not(Floor = 4 & Door = opened & EMch = idle)
      & not(Floor = 3 & Door = opened & EMch = idle)
      & not(Floor = 2 & Door = opened & EMch = idle)
      & not(Floor = 1 & Door = opened & EMch = idle)
      & not(Floor = 0 & Door = opened & EMch = idle)
      & not(Floor = -1 & Door = opened & EMch = idle)
    THEN
        EMch := up
      ;
        Floor := Floor + 1
    END;
  
  go_down = 
    PRE 
        not(Floor = 15 & Door = opened & EMch = idle)
      & not(Floor = 14 & Door = opened & EMch = idle)
      & not(Floor = 13 & Door = opened & EMch = idle)
      & not(Floor = 12 & Door = opened & EMch = idle)
      & not(Floor = 11 & Door = opened & EMch = idle)
      & not(Floor = 10 & Door = opened & EMch = idle)
      & not(Floor = 9 & Door = opened & EMch = idle)
      & not(Floor = 8 & Door = opened & EMch = idle)
      & not(Floor = 7 & Door = opened & EMch = idle)
      & not(Floor = 6 & Door = opened & EMch = idle)
      & not(Floor = 5 & Door = opened & EMch = idle)
      & not(Floor = 4 & Door = opened & EMch = idle)
      & not(Floor = 3 & Door = opened & EMch = idle)
      & not(Floor = 2 & Door = opened & EMch = idle)
      & not(Floor = 1 & Door = opened & EMch = idle)
      & not(Floor = -1 & Door = closed & EMch = down)
      & not(Floor = 0 & Door = opened & EMch = idle)
      & not(Floor = -1 & Door = closed & EMch = idle)
      & not(Floor = -1 & Door = opened & EMch = idle)
    THEN
        EMch := down
      ;
        Floor := Floor - 1
    END;
  
  open_door = 
    BEGIN
        EMch := idle
      ;
        Door := opened
    END;
  
  close_door = 
    BEGIN
      Door := closed
    END
END
