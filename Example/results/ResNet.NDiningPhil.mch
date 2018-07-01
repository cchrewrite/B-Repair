// Config: ResNet, Depth of Residual Blocks = 5, Dimensionality of Residual Blocks = 64, Learning Rate = 2^-7, Number of Training Epochs = 1000

MACHINE NDiningPhil
CONCRETE_CONSTANTS
  N
ABSTRACT_VARIABLES
  Left,
  Right,
  Table
PROPERTIES
    N : NATURAL
  & N = 4
INVARIANT
    Left : 1 .. N --> BOOL
  & Right : 1 .. N --> BOOL
  & Table : 1 .. N --> BOOL
  & !j.(j : 1 .. N => not(Left(j) = TRUE & Table(j) = TRUE))
  & !j.(j : 1 .. N => not(Right(j) = TRUE & Table(j mod N + 1) = TRUE))
  & !j.(j : 1 .. N => not(Right(j) = TRUE & Left(j mod N + 1) = TRUE))
  & !j.(j : 1 .. N => not(Right(j) = FALSE & Table(j mod N + 1) = FALSE & Left(j mod N + 1) = FALSE))
INITIALISATION
    BEGIN
        Left :: 1 .. N --> {FALSE}
      ;
        Right :: 1 .. N --> {FALSE}
      ;
        Table :: 1 .. N --> {TRUE}
    END
OPERATIONS
  pl(i) = 
    PRE 
        not(Left(1) = FALSE & Left(2) = TRUE & Left(3) = TRUE & Left(4) = TRUE & Right(1) = FALSE & Right(2) = FALSE & Right(3) = FALSE & Right(4) = FALSE & Table(1) = TRUE & Table(2) = FALSE & Table(3) = FALSE & Table(4) = FALSE)
      & not(Left(1) = TRUE & Left(2) = TRUE & Left(3) = TRUE & Left(4) = FALSE & Right(1) = FALSE & Right(2) = FALSE & Right(3) = FALSE & Right(4) = FALSE & Table(1) = FALSE & Table(2) = FALSE & Table(3) = FALSE & Table(4) = TRUE)
      & not(Left(1) = TRUE & Left(2) = TRUE & Left(3) = FALSE & Left(4) = TRUE & Right(1) = FALSE & Right(2) = FALSE & Right(3) = FALSE & Right(4) = FALSE & Table(1) = FALSE & Table(2) = FALSE & Table(3) = TRUE & Table(4) = FALSE)
      & not(Left(1) = TRUE & Left(2) = FALSE & Left(3) = TRUE & Left(4) = TRUE & Right(1) = FALSE & Right(2) = FALSE & Right(3) = FALSE & Right(4) = FALSE & Table(1) = FALSE & Table(2) = TRUE & Table(3) = FALSE & Table(4) = FALSE)
      & i : 1 .. N
      & Left(i) = FALSE
      & Table(i) = TRUE
    THEN
        Left(i) := TRUE
      ;
        Table(i) := FALSE
    END;
  
  pr(i) = 
    PRE 
        not(Left(1) = FALSE & Left(2) = FALSE & Left(3) = FALSE & Left(4) = FALSE & Right(1) = TRUE & Right(2) = TRUE & Right(3) = TRUE & Right(4) = FALSE & Table(1) = TRUE & Table(2) = FALSE & Table(3) = FALSE & Table(4) = FALSE)
      & not(Left(1) = FALSE & Left(2) = FALSE & Left(3) = FALSE & Left(4) = FALSE & Right(1) = TRUE & Right(2) = TRUE & Right(3) = FALSE & Right(4) = TRUE & Table(1) = FALSE & Table(2) = FALSE & Table(3) = FALSE & Table(4) = TRUE)
      & not(Left(1) = FALSE & Left(2) = FALSE & Left(3) = FALSE & Left(4) = FALSE & Right(1) = TRUE & Right(2) = FALSE & Right(3) = TRUE & Right(4) = TRUE & Table(1) = FALSE & Table(2) = FALSE & Table(3) = TRUE & Table(4) = FALSE)
      & not(Left(1) = FALSE & Left(2) = FALSE & Left(3) = FALSE & Left(4) = FALSE & Right(1) = FALSE & Right(2) = TRUE & Right(3) = TRUE & Right(4) = TRUE & Table(1) = FALSE & Table(2) = TRUE & Table(3) = FALSE & Table(4) = FALSE)
      & i : 1 .. N
      & Right(i) = FALSE
      & Table(i mod N + 1) = TRUE
    THEN
        Right(i) := TRUE
      ;
        Table(i mod N + 1) := FALSE
    END;
  
  pd(i) = 
    PRE 
        i : 1 .. N
      & Left(i) = TRUE
      & Right(i) = TRUE
    THEN
        Left(i) := FALSE
      ;
        Right(i) := FALSE
      ;
        Table(i) := TRUE
      ;
        Table(i mod N + 1) := TRUE
    END
END
