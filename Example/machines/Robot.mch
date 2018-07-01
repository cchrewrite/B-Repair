MACHINE
  RobotCleaner
SETS
  Room = {room_1, room_2, room_3, room_4, room_5, room_6, room_7}
CONSTANTS
  battery_capacity,
  energy_move,
  connections

PROPERTIES
  battery_capacity = 20 &
  energy_move = 3 &
  connections : POW(Room * Room) &
  connections = {(room_1, room_2), (room_2, room_3), (room_3, room_1), (room_1, room_4), (room_1, room_5), (room_4, room_5), (room_4, room_6), (room_4, room_7), (room_6, room_7)}


VARIABLES
  pos,energy

INVARIANT
  pos : Room &
  energy : NATURAL

INITIALISATION
  pos := room_1 ;
  energy := 0

OPERATIONS

  charge =
    PRE
      pos = room_1 &
      energy < battery_capacity
    THEN
      energy := battery_capacity
    END ;

  move(room_x,room_y) =
    PRE
      energy >= energy_move &
      pos = room_x &
      room_x : Room &
      room_y : Room &
      ((room_x, room_y) : connections or (room_y, room_x) : connections)
      
    THEN
      pos := room_y ;
      energy := energy - energy_move
    END


END


