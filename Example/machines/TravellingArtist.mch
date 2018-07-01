MACHINE
  TravellingArtist
SETS
  City = {city_1, city_2, city_3, city_4, city_5, city_6, city_7}
CONSTANTS
  max_energy,
  connections,
  disliked_city

PROPERTIES
  max_energy = 4 &
  connections = {(city_1, city_2),(city_1, city_3),(city_1, city_4),(city_2,city_3),(city_2, city_5),(city_4,city_6),(city_4,city_7),(city_6,city_7)} &
  disliked_city = {city_5}
 
VARIABLES
  pos,energy

INVARIANT
  pos : City &
  energy : 0..max_energy &
  not(pos : disliked_city)

INITIALISATION
  pos := city_1 ;
  energy := 0

OPERATIONS
  eat =
    PRE
      pos = city_1
    THEN
      energy := energy + 1
    END ;

  move(city_x,city_y) =
    PRE
      energy >= 1 &
      pos = city_x &
      city_x : City &
      city_y : City &
      (((city_x, city_y) : connections) or ((city_y, city_x) : connections))
      
    THEN
      pos := city_y ;
      energy := energy - 1
    END

END

