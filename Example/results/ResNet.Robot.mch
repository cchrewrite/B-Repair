// Config: ResNet, Depth of Residual Blocks = 5, Dimensionality of Residual Blocks = 64, Learning Rate = 2^-7, Number of Training Epochs = 1000

MACHINE Robot
SETS /* enumerated */
  Room={room_1,room_2,room_3,room_4,room_5,room_6,room_7}
CONCRETE_CONSTANTS
  battery_capacity,
  energy_move,
  connections
ABSTRACT_VARIABLES
  pos,
  energy
PROPERTIES
    battery_capacity : INTEGER
  & energy_move : INTEGER
  & connections : POW(Room * Room)
  & battery_capacity = 20
  & energy_move = 3
  & connections = {room_1 |-> room_2,room_2 |-> room_3,room_3 |-> room_1,room_1 |-> room_4,room_1 |-> room_5,room_4 |-> room_5,room_4 |-> room_6,room_4 |-> room_7,room_6 |-> room_7}
INVARIANT
    pos : Room
  & energy : NATURAL
INITIALISATION
    BEGIN
        pos := room_1
      ;
        energy := 0
    END
OPERATIONS
  charge = 
    PRE 
        pos = room_1
      & energy < battery_capacity
    THEN
      energy := battery_capacity
    END;
  
  move(room_x,room_y) = 
    PRE 
        room_x : Room
      & room_y : Room
      & energy >= energy_move
      & pos = room_x
      & (room_x |-> room_y : connections or room_y |-> room_x : connections)
    THEN
        pos := room_y
      ;
        energy := energy - energy_move
      ;
        IF pos = room_3 & energy = 2 THEN
          pos := room_1
        END
      ;
        IF pos = room_5 & energy = 2 THEN
          pos := room_1
        END
      ;
        IF pos = room_4 & energy = 2 THEN
          pos := room_1
        END
      ;
        IF pos = room_2 & energy = 2 THEN
          pos := room_1
        END
      ;
        IF pos = room_7 & energy = 2 THEN
          pos := room_1
        END
      ;
        IF pos = room_6 & energy = 2 THEN
          pos := room_1
        END
    END
END
