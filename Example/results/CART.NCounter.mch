// Config: CART, Number of Groups of Trees = 64, Scope of Maximum Variances = [e^-9,e^-2]

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
          x := 512
        END
    END
END
