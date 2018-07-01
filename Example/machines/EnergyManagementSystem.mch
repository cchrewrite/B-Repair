MACHINE
  EnergyManagementSystem

CONSTANTS
  MaxEnergy

PROPERTIES
  MaxEnergy = 10

VARIABLES
  Load, 
  Oven, Fridge, AirCond, Light 
INVARIANT
  Load : 0..MaxEnergy &
  Oven : BOOL &
  Fridge : BOOL &
  AirCond : BOOL &
  Light : BOOL
INITIALISATION
  Load := 0 ;
  Oven, Fridge, AirCond, Light := FALSE, FALSE, FALSE, FALSE
OPERATIONS

  Oven_On =
    PRE
      Oven = FALSE
    THEN
      Oven := TRUE ;
      Load := Load + 7
    END ;

  Oven_Off =
    PRE
      Oven = TRUE
    THEN
      Oven := FALSE ;
      Load := Load - 7
    END ;

  Fridge_On =
    PRE
      Fridge = FALSE
    THEN
      Fridge := TRUE ;
      Load := Load + 3
    END ;

  Fridge_Off =
    PRE
      Fridge = TRUE
    THEN
      Fridge := FALSE ;
      Load := Load - 3
    END ;

  AirCond_On =
    PRE
      AirCond = FALSE
    THEN
      AirCond := TRUE ;
      Load := Load + 5
    END ;

  AirCond_Off =
    PRE
      AirCond = TRUE
    THEN
      AirCond := FALSE ;
      Load := Load - 5
    END ;

  Light_On =
    PRE
      Light = FALSE
    THEN
      Light := TRUE ;
      Load := Load + 1
    END ;

  Light_Off =
    PRE
      Light = TRUE
    THEN
      Light := FALSE ;
      Load := Load - 1
    END
END

  
