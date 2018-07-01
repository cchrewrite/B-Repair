// Config: CART, Number of Groups of Trees = 64, Scope of Maximum Variances = [e^-9,e^-2]

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
        not(Floor = 15 & Door = closed & EMch = up)
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
    THEN
        EMch := up
      ;
        Floor := Floor + 1
      ;
        IF Floor = 0 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 13 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 14 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 15 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 16 & Door = opened & EMch = up THEN
            Floor := 15
          ;
            Door := closed
        END
      ;
        IF Floor = 16 & Door = closed & EMch = up THEN
          Floor := 15
        END
    END;
  
  go_down = 
    PRE 
        not(Floor = 13 & Door = opened & EMch = idle)
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
        EMch := down
      ;
        Floor := Floor - 1
      ;
        IF Floor = -2 & Door = closed & EMch = down THEN
          Floor := -1
        END
      ;
        IF Floor = 13 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 14 & Door = opened & EMch = down THEN
          Door := closed
        END
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
