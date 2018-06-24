
MACHINE DoubleAutoBus
SETS /* enumerated */
  Location={S0,S1,C0,C1,C2}
CONCRETE_CONSTANTS
  N,
  Station,
  Street
ABSTRACT_VARIABLES
  loc,
  mv,
  op
PROPERTIES
    N : INTEGER
  & Station : POW(Location)
  & Street : POW(Location * Location)
  & N = 2
  & Station = {S0,S1}
  & Street = {S0 |-> C0,S1 |-> C1,C0 |-> C1,C0 |-> C2,C1 |-> C2}
INVARIANT
    loc : 1 .. N --> Location
  & mv : 1 .. N --> BOOL
  & op : 1 .. N --> BOOL
  & !i.(i : 1 .. N => not(mv(i) = TRUE & op(i) = TRUE))
  & not(#i.(i : 1 .. N & (not(loc(i) : Station) & mv(i) = FALSE)))
INITIALISATION
    BEGIN
        loc :: 1 .. N --> {S0}
      ;
        mv :: 1 .. N --> {FALSE}
      ;
        op :: 1 .. N --> {FALSE}
    END
OPERATIONS
  move(u,x,y) = 
    PRE 
        x : Location
      & y : Location
      & not(loc(1) = S0 & loc(2) = S0 & mv(1) = FALSE & mv(2) = FALSE & op(1) = TRUE & op(2) = FALSE)
      & not(loc(1) = S0 & loc(2) = C1 & mv(1) = FALSE & mv(2) = TRUE & op(1) = TRUE & op(2) = FALSE)
      & not(loc(1) = S0 & loc(2) = C2 & mv(1) = FALSE & mv(2) = TRUE & op(1) = TRUE & op(2) = FALSE)
      & not(loc(1) = S1 & loc(2) = S0 & mv(1) = TRUE & mv(2) = FALSE & op(1) = FALSE & op(2) = TRUE)
      & not(loc(1) = S1 & loc(2) = S0 & mv(1) = FALSE & mv(2) = FALSE & op(1) = FALSE & op(2) = TRUE)
      & not(loc(1) = S1 & loc(2) = S0 & mv(1) = FALSE & mv(2) = FALSE & op(1) = TRUE & op(2) = TRUE)
      & not(loc(1) = S1 & loc(2) = S0 & mv(1) = FALSE & mv(2) = FALSE & op(1) = TRUE & op(2) = FALSE)
      & not(loc(1) = S1 & loc(2) = C0 & mv(1) = FALSE & mv(2) = TRUE & op(1) = TRUE & op(2) = FALSE)
      & not(loc(1) = S1 & loc(2) = C2 & mv(1) = FALSE & mv(2) = TRUE & op(1) = TRUE & op(2) = FALSE)
      & not(loc(1) = S1 & loc(2) = S0 & mv(1) = FALSE & mv(2) = TRUE & op(1) = TRUE & op(2) = FALSE)
      & not(loc(1) = C1 & loc(2) = S0 & mv(1) = TRUE & mv(2) = FALSE & op(1) = FALSE & op(2) = TRUE)
      & not(loc(1) = C2 & loc(2) = S0 & mv(1) = TRUE & mv(2) = FALSE & op(1) = FALSE & op(2) = TRUE)
      & not(loc(1) = C2 & loc(2) = S1 & mv(1) = TRUE & mv(2) = FALSE & op(1) = FALSE & op(2) = TRUE)
      & not(loc(1) = S0 & loc(2) = S1 & mv(1) = TRUE & mv(2) = FALSE & op(1) = FALSE & op(2) = TRUE)
      & not(loc(1) = C0 & loc(2) = S1 & mv(1) = TRUE & mv(2) = FALSE & op(1) = FALSE & op(2) = TRUE)
      & not(loc(1) = S0 & loc(2) = S1 & mv(1) = FALSE & mv(2) = TRUE & op(1) = TRUE & op(2) = FALSE)
      & not(loc(1) = S0 & loc(2) = S1 & mv(1) = FALSE & mv(2) = FALSE & op(1) = TRUE & op(2) = FALSE)
      & not(loc(1) = S0 & loc(2) = S1 & mv(1) = FALSE & mv(2) = FALSE & op(1) = TRUE & op(2) = TRUE)
      & not(loc(1) = S0 & loc(2) = S1 & mv(1) = FALSE & mv(2) = FALSE & op(1) = FALSE & op(2) = TRUE)
      & not(loc(1) = S0 & loc(2) = S0 & mv(1) = FALSE & mv(2) = FALSE & op(1) = FALSE & op(2) = TRUE)
      & not(loc(1) = S0 & loc(2) = S0 & mv(1) = FALSE & mv(2) = FALSE & op(1) = TRUE & op(2) = TRUE)
      & u : 1 .. N
      & loc(u) = x
      & (x |-> y : Street or y |-> x : Street)
      & !v.(v : 1 .. N & u /= v => loc(v) /= y)
    THEN
        mv(u) := TRUE
      ;
        loc(u) := y
    END;
  
  stop(u) = 
    PRE 
        u : 1 .. N
      & loc(u) : Station
    THEN
      mv(u) := FALSE
    END;
  
  open(u) = 
    PRE 
        u : 1 .. N
      & mv(u) = FALSE
    THEN
      op(u) := TRUE
    END;
  
  close(u) = 
    PRE 
        u : 1 .. N
    THEN
      op(u) := FALSE
    END
END
