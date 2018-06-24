MACHINE
  NDiningPhil

CONSTANTS
  N //, LIdx, RIdx

PROPERTIES
  N : NATURAL &
  N = 3 /*&
  LIdx = (1..N) --> (1..N) &
  LIdx = { xx, yy | xx : (1..N) & yy : (1..N) & yy = xx } &
  RIdx = (1..N) --> (1..N) &
  RIdx = { xx, yy | xx : (1..N) & yy : (1..N) & yy = xx mod N + 1 }
  */
VARIABLES
  Left, Right, Table

INVARIANT
  Left  : (1..N) --> BOOL &
  Right : (1..N) --> BOOL &
  Table : (1..N) --> BOOL &

  !(j).(j : (1..N) => not(Left(j)=TRUE & Table(j)=TRUE)) &
  !(j).(j : (1..N) => not(Right(j)=TRUE & Table(j mod N + 1)=TRUE)) &
  !(j).(j : (1..N) => not(Right(j)=TRUE & Left(j mod N + 1)=TRUE)) &
  !(j).(j : (1..N) => not(Right(j)=FALSE & Table(j mod N + 1)=FALSE & Left(j mod N + 1)=FALSE))

INITIALISATION
  Left  :: (1..N) --> {FALSE} ;
  Right :: (1..N) --> {FALSE} ;
  Table :: (1..N) --> {TRUE}

OPERATIONS
  pl(i) =
    PRE
      i : (1..N) &
      Left(i) = FALSE &
      Table(i) = TRUE
    THEN
      Left(i) := TRUE ;
      Table(i) := FALSE
    END ;

  pr(i) =
    PRE
      i : (1..N) &
      Right(i) = FALSE &
      Table(i mod N + 1) = TRUE
    THEN
      Right(i) := TRUE ;
      Table(i mod N + 1) := FALSE
    END ;

  pd(i) = 
    PRE
      i : (1..N) &
      Left(i) = TRUE &
      Right(i) = TRUE
    THEN
      Left(i) := FALSE ;
      Right(i) := FALSE ;
      Table(i) := TRUE ;
      Table(i mod N + 1) := TRUE
    END
END

  
