MACHINE
  LiftN

SETS
  EM = {up,down,idle} ;
  DR = {opened,closed}

CONSTANTS
  MinFloor, MaxFloor

PROPERTIES
  MinFloor = -1 &
  MaxFloor = 15

VARIABLES
  Floor, Door, EMch

INVARIANT

  Floor : MinFloor..MaxFloor &
  EMch : EM &
  Door : DR &
  not(Door = opened & not(EMch = idle))
INITIALISATION
  Floor := MinFloor ;
  EMch := idle ;
  Door := closed

OPERATIONS
  go_up =
    BEGIN
      EMch := up ;
      Floor := Floor + 1
    END ;

  go_down =
    BEGIN
      EMch := down ;
      Floor := Floor - 1
    END ;

  open_door =
    BEGIN
      EMch := idle ;
      Door := opened
    END ;

  close_door =
    BEGIN
      Door := closed
    END

END

  
