// Config: CART, Number of Groups of Trees = 256, Scope of Maximum Variances = [e^-9,e^-2]


MACHINE CourseManagementSystem
SETS /* enumerated */
  Course={CalCulusA,CalCulusB,LinearAlgebra,ProbabilityAndStatistics,ComplexFunctions,Mechanics,Thermodynamics,Electromagnetics,C,Python,DataStructures,ParallelProgramming}
CONCRETE_CONSTANTS
  N,
  CourseRequirement
ABSTRACT_VARIABLES
  SelectedCourse
PROPERTIES
    CourseRequirement : POW(Course * POW(Course))
  & N : NATURAL
  & N = 4
  & CourseRequirement = {CalCulusA |-> {},CalCulusB |-> {CalCulusA},LinearAlgebra |-> {},ProbabilityAndStatistics |-> {CalCulusA},ComplexFunctions |-> {CalCulusA},Mechanics |-> {CalCulusA,CalCulusB,LinearAlgebra},Thermodynamics |-> {Mechanics,ProbabilityAndStatistics},Electromagnetics |-> {Mechanics,ComplexFunctions},C |-> {},Python |-> {C},DataStructures |-> {C},ParallelProgramming |-> {C,DataStructures}}
INVARIANT
    SelectedCourse : POW(Course)
  & card(SelectedCourse) < N
  & !(u,r).(u : Course & r : POW(Course) & u |-> r : CourseRequirement => not(u : SelectedCourse & not(r <: SelectedCourse)))
INITIALISATION
    BEGIN
      SelectedCourse := {}
    END
OPERATIONS
  select(x) = 
    PRE 
        x : Course
      & not(SelectedCourse = {CalCulusA,CalCulusB,LinearAlgebra})
      & not(SelectedCourse = {CalCulusA,LinearAlgebra,ProbabilityAndStatistics})
      & not(SelectedCourse = {CalCulusA,LinearAlgebra,ComplexFunctions})
      & not(SelectedCourse = {CalCulusA,CalCulusB,ComplexFunctions})
      & not(SelectedCourse = {CalCulusA,ProbabilityAndStatistics,ComplexFunctions})
      & not(SelectedCourse = {CalCulusA,CalCulusB,ProbabilityAndStatistics})
      & not(SelectedCourse = {CalCulusA,CalCulusB,C})
      & not(SelectedCourse = {CalCulusA,ProbabilityAndStatistics,C})
      & not(SelectedCourse = {CalCulusA,ComplexFunctions,C})
      & not(SelectedCourse = {LinearAlgebra,C,Python})
      & not(SelectedCourse = {LinearAlgebra,C,DataStructures})
      & not(SelectedCourse = {C,Python,DataStructures})
      & not(SelectedCourse = {C,DataStructures,ParallelProgramming})
      & card(SelectedCourse) < N
      & #p.(p <: SelectedCourse & x |-> p : CourseRequirement)
    THEN
        SelectedCourse := SelectedCourse \/ {x}
      ;
        IF SelectedCourse = {LinearAlgebra,C,DataStructures,ParallelProgramming} THEN
          SelectedCourse := {LinearAlgebra,C,DataStructures}
        END
      ;
        IF SelectedCourse = {CalCulusA,C,DataStructures,ParallelProgramming} THEN
          SelectedCourse := {CalCulusA,C,DataStructures}
        END
      ;
        IF SelectedCourse = {CalCulusA,C,Python,DataStructures} THEN
          SelectedCourse := {CalCulusA,C,DataStructures}
        END
      ;
        IF SelectedCourse = {CalCulusA,ComplexFunctions,C,DataStructures} THEN
          SelectedCourse := {CalCulusA,C,DataStructures}
        END
      ;
        IF SelectedCourse = {CalCulusA,ProbabilityAndStatistics,C,DataStructures} THEN
          SelectedCourse := {CalCulusA,C,DataStructures}
        END
      ;
        IF SelectedCourse = {CalCulusA,LinearAlgebra,C,DataStructures} THEN
          SelectedCourse := {CalCulusA,C,DataStructures}
        END
      ;
        IF SelectedCourse = {CalCulusA,CalCulusB,C,DataStructures} THEN
          SelectedCourse := {CalCulusA,C,DataStructures}
        END
      ;
        IF SelectedCourse = {CalCulusA,ComplexFunctions,C,Python} THEN
          SelectedCourse := {CalCulusA,C,Python}
        END
      ;
        IF SelectedCourse = {CalCulusA,ProbabilityAndStatistics,C,Python} THEN
          SelectedCourse := {CalCulusA,C,Python}
        END
      ;
        IF SelectedCourse = {CalCulusA,LinearAlgebra,C,Python} THEN
          SelectedCourse := {CalCulusA,C,Python}
        END
      ;
        IF SelectedCourse = {CalCulusA,CalCulusB,C,Python} THEN
          SelectedCourse := {CalCulusA,C,Python}
        END
      ;
        IF SelectedCourse = {CalCulusA,LinearAlgebra,ComplexFunctions,C} THEN
          SelectedCourse := {CalCulusA,LinearAlgebra,C}
        END
      ;
        IF SelectedCourse = {CalCulusA,LinearAlgebra,ProbabilityAndStatistics,C} THEN
          SelectedCourse := {CalCulusA,LinearAlgebra,C}
        END
      ;
        IF SelectedCourse = {CalCulusA,CalCulusB,LinearAlgebra,C} THEN
          SelectedCourse := {CalCulusA,LinearAlgebra,C}
        END
    END;
  
  cancel(x) = 
    PRE 
        x : SelectedCourse
    THEN
        SelectedCourse := SelectedCourse - {x}
      ;
        IF SelectedCourse = {DataStructures} THEN
          SelectedCourse := {C}
        END
      ;
        IF SelectedCourse = {C,ParallelProgramming} THEN
          SelectedCourse := {C}
        END
      ;
        IF SelectedCourse = {DataStructures,ParallelProgramming} THEN
          SelectedCourse := {C}
        END
      ;
        IF SelectedCourse = {Python,DataStructures} THEN
          SelectedCourse := {C}
        END
      ;
        IF SelectedCourse = {LinearAlgebra,DataStructures} THEN
          SelectedCourse := {C}
        END
      ;
        IF SelectedCourse = {CalCulusA,DataStructures} THEN
          SelectedCourse := {C}
        END
      ;
        IF SelectedCourse = {Python} THEN
          SelectedCourse := {C}
        END
      ;
        IF SelectedCourse = {LinearAlgebra,Python} THEN
          SelectedCourse := {C}
        END
      ;
        IF SelectedCourse = {CalCulusA,Python} THEN
          SelectedCourse := {C}
        END
      ;
        IF SelectedCourse = {ComplexFunctions} THEN
          SelectedCourse := {CalCulusA}
        END
      ;
        IF SelectedCourse = {ComplexFunctions,C} THEN
          SelectedCourse := {CalCulusA}
        END
      ;
        IF SelectedCourse = {ProbabilityAndStatistics} THEN
          SelectedCourse := {CalCulusA}
        END
      ;
        IF SelectedCourse = {ProbabilityAndStatistics,C} THEN
          SelectedCourse := {CalCulusA}
        END
      ;
        IF SelectedCourse = {CalCulusB} THEN
          SelectedCourse := {CalCulusA}
        END
      ;
        IF SelectedCourse = {CalCulusB,C} THEN
          SelectedCourse := {CalCulusA}
        END
      ;
        IF SelectedCourse = {CalCulusB,ProbabilityAndStatistics} THEN
          SelectedCourse := {CalCulusA}
        END
      ;
        IF SelectedCourse = {ProbabilityAndStatistics,ComplexFunctions} THEN
          SelectedCourse := {CalCulusA}
        END
      ;
        IF SelectedCourse = {CalCulusB,ComplexFunctions} THEN
          SelectedCourse := {CalCulusA}
        END
      ;
        IF SelectedCourse = {LinearAlgebra,ComplexFunctions} THEN
          SelectedCourse := {CalCulusA}
        END
      ;
        IF SelectedCourse = {LinearAlgebra,ProbabilityAndStatistics} THEN
          SelectedCourse := {CalCulusA}
        END
      ;
        IF SelectedCourse = {CalCulusB,LinearAlgebra} THEN
          SelectedCourse := {CalCulusA}
        END
    END
END
