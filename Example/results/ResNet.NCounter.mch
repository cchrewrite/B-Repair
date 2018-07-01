// Config: ResNet, Depth of Residual Blocks = 5, Dimensionality of Residual Blocks = 64, Learning Rate = 2^-7, Number of Training Epochs = 1000

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
          x := 500
        END
    END
END
