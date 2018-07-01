// Config: ResNet, Depth of Residual Blocks = 5, Dimensionality of Residual Blocks = 64, Learning Rate = 2^-7, Number of Training Epochs = 1000

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
    BEGIN
        EMch := up
      ;
        Floor := Floor + 1
      ;
        IF Floor = 0 & Door = opened & EMch = up THEN
            Floor := 3
          ;
            Door := closed
        END
      ;
        IF Floor = 4 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 3 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 2 & Door = opened & EMch = up THEN
            Floor := 3
          ;
            Door := closed
        END
      ;
        IF Floor = 1 & Door = opened & EMch = up THEN
            Floor := 3
          ;
            Door := closed
        END
      ;
        IF Floor = 5 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 6 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 7 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 8 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 9 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 10 & Door = opened & EMch = up THEN
            Floor := 11
          ;
            Door := closed
        END
      ;
        IF Floor = 12 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 11 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 13 & Door = opened & EMch = up THEN
            Floor := 14
          ;
            Door := closed
        END
      ;
        IF Floor = 15 & Door = opened & EMch = up THEN
          Door := closed
        END
      ;
        IF Floor = 14 & Door = opened & EMch = up THEN
            Floor := 15
          ;
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
    BEGIN
        EMch := down
      ;
        Floor := Floor - 1
      ;
        IF Floor = -2 & Door = opened & EMch = down THEN
            Floor := -1
          ;
            Door := closed
        END
      ;
        IF Floor = 2 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 1 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 0 & Door = opened & EMch = down THEN
            Floor := -1
          ;
            Door := closed
        END
      ;
        IF Floor = -1 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 3 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 4 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 5 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 6 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 7 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 8 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 10 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 9 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 11 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 13 & Door = opened & EMch = down THEN
          Door := closed
        END
      ;
        IF Floor = 12 & Door = opened & EMch = down THEN
            Floor := 11
          ;
            Door := closed
        END
      ;
        IF Floor = 14 & Door = opened & EMch = down THEN
            Floor := 13
          ;
            Door := closed
        END
      ;
        IF Floor = -2 & Door = closed & EMch = down THEN
          Floor := -1
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
