
MACHINE NCounter
CONCRETE_CONSTANTS
  N
ABSTRACT_VARIABLES
  x
PROPERTIES
    N : NATURAL
  & N = 512
INVARIANT
    x : NATURAL
  & x <= N
INITIALISATION
    BEGIN
      x := 0
    END
OPERATIONS
  inc = 
    BEGIN
        x := x + 1
      ;
        IF x = 513 THEN
          x := 501
        END
    END
END
