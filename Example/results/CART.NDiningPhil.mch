// Config: CART, Scale = [e^-9,e^-2], Num_Tree = 256

MACHINE NDiningPhil
CONCRETE_CONSTANTS
  N
ABSTRACT_VARIABLES
  Left,
  Right,
  Table
PROPERTIES
    N : NATURAL
  & N = 3
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
        i : 1 .. N
      & Left(i) = FALSE
      & Table(i) = TRUE
    THEN
        Left(i) := TRUE
      ;
        Table(i) := FALSE
      ;
        IF Left(1) = TRUE & Left(2) = TRUE & Left(3) = TRUE & Right(1) = FALSE & Right(2) = FALSE & Right(3) = FALSE & Table(1) = FALSE & Table(2) = FALSE & Table(3) = FALSE THEN
            Left(3) := FALSE
          ;
            Table(3) := TRUE
        END
    END;
  
  pr(i) = 
    PRE 
        i : 1 .. N
      & Right(i) = FALSE
      & Table(i mod N + 1) = TRUE
    THEN
        Right(i) := TRUE
      ;
        Table(i mod N + 1) := FALSE
      ;
        IF Left(1) = FALSE & Left(2) = FALSE & Left(3) = FALSE & Right(1) = TRUE & Right(2) = TRUE & Right(3) = TRUE & Table(1) = FALSE & Table(2) = FALSE & Table(3) = FALSE THEN
            Right(3) := FALSE
          ;
            Table(1) := TRUE
        END
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
