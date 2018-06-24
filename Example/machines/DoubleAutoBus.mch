MACHINE
  DoubleAutoBus

SETS
  //Location = {S0,S1,S2,S3,S4,C0,C1,C2,C3,C4}
  Location = {S0,S1,C0,C1,C2}
CONSTANTS
  N, Station , Street

PROPERTIES
  N = 2 &
  Station : POW(Location) & 
  //Station = {S0,S1,S2,S3,S4} &
  Station = {S0,S1} &
  Street : POW(Location * Location) &
  /* Street = {(S0,C0),(S0,C3),
            (S1,S2),(S1,C1),
            (S2,S3),(S2,C2),
            (S3,S4),(S3,C4),
            (S4,C3),(S4,C4),
            (C0,C1),(C0,C2),(C0,C3),(C0,C4),
            (C1,C2),
            (C2,C4),
            (C3,C4)} */
  Street = {(S0,C0),(S1,C1),(C0,C1),(C0,C2),(C1,C2)}

VARIABLES
  loc, mv, op

INVARIANT
  loc : (1..N) --> Location &
  mv : (1..N) --> BOOL & 
  op : (1..N) --> BOOL &
  !(i).((i : 1..N) => (not(mv(i)=TRUE & op(i)=TRUE))) &
  not(#(i).(i : 1..N & (not(loc(i) : Station) & mv(i) = FALSE)))

INITIALISATION
  loc :: (1..N) --> {S0} ;
  mv :: (1..N) --> {FALSE} ;
  op :: (1..N) --> {FALSE}

OPERATIONS
  move(u,x,y) =
    PRE u : 1..N & x : Location & y : Location & 
        loc(u) = x & ((x,y) : Street or (y,x) : Street) &
        !(v).((v : 1..N & u /= v) => (loc(v) /= y))
    THEN mv(u) := TRUE ; loc(u) := y
    END;
  stop(u) =
    PRE u : 1..N & loc(u) : Station
    THEN mv(u) := FALSE
    END;
  open(u) = 
    PRE u : 1..N & mv(u) = FALSE
    THEN op(u) := TRUE
    END;
  close(u) = 
    PRE u : 1..N
    THEN op(u) := FALSE
    END
END

  
