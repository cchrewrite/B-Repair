// Config: CART, Number of Groups of Trees = 64, Scope of Maximum Variances = [e^-9,e^-2]

MACHINE TravellingArtist
SETS /* enumerated */
  City={city_1,city_2,city_3,city_4,city_5,city_6,city_7}
CONCRETE_CONSTANTS
  max_energy,
  connections,
  disliked_city
ABSTRACT_VARIABLES
  pos,
  energy
PROPERTIES
    max_energy : INTEGER
  & connections : POW(City * City)
  & disliked_city : POW(City)
  & max_energy = 4
  & connections = {city_1 |-> city_2,city_1 |-> city_3,city_1 |-> city_4,city_2 |-> city_3,city_2 |-> city_5,city_4 |-> city_6,city_4 |-> city_7,city_6 |-> city_7}
  & disliked_city = {city_5}
INVARIANT
    pos : City
  & energy : 0 .. max_energy
  & not(pos : disliked_city)
INITIALISATION
    BEGIN
        pos := city_1
      ;
        energy := 0
    END
OPERATIONS
  eat = 
    PRE 
        pos = city_1
    THEN
        energy := energy + 1
      ;
        IF pos = city_1 & energy = 5 THEN
          energy := 4
        END
    END;
  
  move(city_x,city_y) = 
    PRE 
        city_x : City
      & city_y : City
      & energy >= 1
      & pos = city_x
      & (city_x |-> city_y : connections or city_y |-> city_x : connections)
    THEN
        pos := city_y
      ;
        energy := energy - 1
      ;
        IF pos = city_4 & energy = 0 THEN
            pos := city_3
          ;
            energy := 1
        END
      ;
        IF pos = city_3 & energy = 0 THEN
          energy := 1
        END
      ;
        IF pos = city_2 & energy = 0 THEN
            pos := city_3
          ;
            energy := 1
        END
      ;
        IF pos = city_7 & energy = 0 THEN
          pos := city_1
        END
      ;
        IF pos = city_6 & energy = 0 THEN
          pos := city_1
        END
      ;
        IF pos = city_5 & energy = 0 THEN
          pos := city_1
        END
      ;
        IF pos = city_5 & energy = 1 THEN
          pos := city_3
        END
      ;
        IF pos = city_5 & energy = 2 THEN
          pos := city_3
        END
    END
END
