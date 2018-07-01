// Config: CART, Number of Groups of Trees = 64, Scope of Maximum Variances = [e^-9,e^-2]

MACHINE EnergyManagementSystem
CONCRETE_CONSTANTS
  MaxEnergy
ABSTRACT_VARIABLES
  Load,
  Oven,
  Fridge,
  AirCond,
  Light
PROPERTIES
    MaxEnergy : INTEGER
  & MaxEnergy = 10
INVARIANT
    Oven : BOOL
  & Fridge : BOOL
  & AirCond : BOOL
  & Light : BOOL
  & Load : 0 .. MaxEnergy
INITIALISATION
    BEGIN
        Load := 0
      ;
        Oven,Fridge,AirCond,Light := FALSE,FALSE,FALSE,FALSE
    END
OPERATIONS
  Oven_On = 
    PRE 
        not(Load = 5 & Oven = FALSE & Fridge = FALSE & AirCond = TRUE & Light = FALSE)
      & not(Load = 8 & Oven = FALSE & Fridge = TRUE & AirCond = TRUE & Light = TRUE)
      & not(Load = 6 & Oven = FALSE & Fridge = TRUE & AirCond = TRUE & Light = FALSE)
      & not(Load = 5 & Oven = FALSE & Fridge = FALSE & AirCond = TRUE & Light = TRUE)
      & not(Load = 4 & Oven = FALSE & Fridge = FALSE & AirCond = TRUE & Light = FALSE)
      & not(Load = 7 & Oven = FALSE & Fridge = TRUE & AirCond = TRUE & Light = FALSE)
      & not(Load = 7 & Oven = FALSE & Fridge = TRUE & AirCond = TRUE & Light = TRUE)
      & not(Load = 4 & Oven = FALSE & Fridge = FALSE & AirCond = TRUE & Light = TRUE)
      & not(Load = 6 & Oven = FALSE & Fridge = TRUE & AirCond = TRUE & Light = TRUE)
      & not(Load = 5 & Oven = FALSE & Fridge = TRUE & AirCond = TRUE & Light = FALSE)
      & not(Load = 6 & Oven = FALSE & Fridge = FALSE & AirCond = TRUE & Light = TRUE)
      & not(Load = 9 & Oven = FALSE & Fridge = TRUE & AirCond = TRUE & Light = TRUE)
      & not(Load = 8 & Oven = FALSE & Fridge = TRUE & AirCond = TRUE & Light = FALSE)
      & Oven = FALSE
    THEN
        Oven := TRUE
      ;
        Load := Load + 7
      ;
        IF Load = 11 & Oven = TRUE & Fridge = TRUE & AirCond = FALSE & Light = TRUE THEN
          Load := 10
        END
    END;
  
  Oven_Off = 
    PRE 
        not(Load = 6 & Oven = TRUE & Fridge = FALSE & AirCond = FALSE & Light = FALSE)
      & not(Load = 5 & Oven = TRUE & Fridge = FALSE & AirCond = FALSE & Light = FALSE)
      & not(Load = 6 & Oven = TRUE & Fridge = FALSE & AirCond = FALSE & Light = TRUE)
      & not(Load = 5 & Oven = TRUE & Fridge = FALSE & AirCond = FALSE & Light = TRUE)
      & not(Load = 4 & Oven = TRUE & Fridge = FALSE & AirCond = FALSE & Light = FALSE)
      & Oven = TRUE
    THEN
        Oven := FALSE
      ;
        Load := Load - 7
    END;
  
  Fridge_On = 
    PRE 
        not(Load = 10 & Oven = TRUE & Fridge = FALSE & AirCond = TRUE & Light = FALSE)
      & not(Load = 10 & Oven = TRUE & Fridge = FALSE & AirCond = TRUE & Light = TRUE)
      & not(Load = 9 & Oven = TRUE & Fridge = FALSE & AirCond = TRUE & Light = FALSE)
      & Fridge = FALSE
    THEN
        Fridge := TRUE
      ;
        Load := Load + 3
      ;
        IF Load = 11 & Oven = TRUE & Fridge = TRUE & AirCond = FALSE & Light = TRUE THEN
          Load := 10
        END
    END;
  
  Fridge_Off = 
    PRE 
        not(Load = 1 & Oven = FALSE & Fridge = TRUE & AirCond = FALSE & Light = FALSE)
      & not(Load = 0 & Oven = FALSE & Fridge = TRUE & AirCond = FALSE & Light = FALSE)
      & not(Load = 1 & Oven = FALSE & Fridge = TRUE & AirCond = FALSE & Light = TRUE)
      & Fridge = TRUE
    THEN
        Fridge := FALSE
      ;
        Load := Load - 3
      ;
        IF Load = -1 & Oven = FALSE & Fridge = FALSE & AirCond = FALSE & Light = TRUE THEN
          Load := 0
        END
      ;
        IF Load = -1 & Oven = FALSE & Fridge = FALSE & AirCond = FALSE & Light = FALSE THEN
          Load := 0
        END
    END;
  
  AirCond_On = 
    PRE 
        not(Load = 7 & Oven = TRUE & Fridge = FALSE & AirCond = FALSE & Light = FALSE)
      & not(Load = 10 & Oven = TRUE & Fridge = TRUE & AirCond = FALSE & Light = FALSE)
      & not(Load = 8 & Oven = TRUE & Fridge = FALSE & AirCond = FALSE & Light = TRUE)
      & not(Load = 7 & Oven = TRUE & Fridge = FALSE & AirCond = FALSE & Light = TRUE)
      & not(Load = 10 & Oven = TRUE & Fridge = TRUE & AirCond = FALSE & Light = TRUE)
      & not(Load = 8 & Oven = TRUE & Fridge = TRUE & AirCond = FALSE & Light = FALSE)
      & not(Load = 9 & Oven = TRUE & Fridge = TRUE & AirCond = FALSE & Light = TRUE)
      & not(Load = 8 & Oven = TRUE & Fridge = TRUE & AirCond = FALSE & Light = TRUE)
      & not(Load = 7 & Oven = TRUE & Fridge = TRUE & AirCond = FALSE & Light = FALSE)
      & not(Load = 9 & Oven = TRUE & Fridge = TRUE & AirCond = FALSE & Light = FALSE)
      & AirCond = FALSE
    THEN
        AirCond := TRUE
      ;
        Load := Load + 5
      ;
        IF Load = 11 & Oven = TRUE & Fridge = FALSE & AirCond = TRUE & Light = FALSE THEN
          Load := 10
        END
      ;
        IF Load = 11 & Oven = TRUE & Fridge = FALSE & AirCond = TRUE & Light = TRUE THEN
          Load := 10
        END
    END;
  
  AirCond_Off = 
    PRE 
        not(Load = 3 & Oven = FALSE & Fridge = FALSE & AirCond = TRUE & Light = FALSE)
      & not(Load = 3 & Oven = FALSE & Fridge = FALSE & AirCond = TRUE & Light = TRUE)
      & not(Load = 2 & Oven = FALSE & Fridge = FALSE & AirCond = TRUE & Light = FALSE)
      & AirCond = TRUE
    THEN
        AirCond := FALSE
      ;
        Load := Load - 5
      ;
        IF Load = -1 & Oven = FALSE & Fridge = FALSE & AirCond = FALSE & Light = TRUE THEN
          Load := 0
        END
      ;
        IF Load = -1 & Oven = FALSE & Fridge = FALSE & AirCond = FALSE & Light = FALSE THEN
          Load := 0
        END
    END;
  
  Light_On = 
    PRE 
        Light = FALSE
    THEN
        Light := TRUE
      ;
        Load := Load + 1
      ;
        IF Load = 11 & Oven = TRUE & Fridge = FALSE & AirCond = TRUE & Light = TRUE THEN
          Load := 10
        END
      ;
        IF Load = 11 & Oven = TRUE & Fridge = TRUE & AirCond = FALSE & Light = TRUE THEN
          Load := 10
        END
    END;
  
  Light_Off = 
    PRE 
        Light = TRUE
    THEN
        Light := FALSE
      ;
        Load := Load - 1
      ;
        IF Load = -1 & Oven = FALSE & Fridge = FALSE & AirCond = FALSE & Light = FALSE THEN
          Load := 0
        END
    END
END
