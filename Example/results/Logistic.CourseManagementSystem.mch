
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
      & not(SelectedCourse = {CalCulusA})
      & not(SelectedCourse = {CalCulusA,C})
      & not(SelectedCourse = {CalCulusA,C,DataStructures})
      & not(SelectedCourse = {LinearAlgebra,C})
      & not(SelectedCourse = {LinearAlgebra,C,DataStructures})
      & not(SelectedCourse = {C})
      & not(SelectedCourse = {C,DataStructures})
      & not(SelectedCourse = {C,Python,DataStructures})
      & not(SelectedCourse = {CalCulusA,LinearAlgebra,C})
      & not(SelectedCourse = {CalCulusA,LinearAlgebra})
      & not(SelectedCourse = {CalCulusA,LinearAlgebra,ComplexFunctions})
      & not(SelectedCourse = {CalCulusA,ComplexFunctions})
      & not(SelectedCourse = {CalCulusA,ComplexFunctions,C})
      & card(SelectedCourse) < N
      & #p.(p <: SelectedCourse & x |-> p : CourseRequirement)
    THEN
        SelectedCourse := SelectedCourse \/ {x}
      ;
        IF SelectedCourse = {C,Python,DataStructures,ParallelProgramming} THEN
          SelectedCourse := {CalCulusA,LinearAlgebra,C}
        END
      ;
        IF SelectedCourse = {LinearAlgebra,C,DataStructures,ParallelProgramming} THEN
          SelectedCourse := {CalCulusA,LinearAlgebra,C}
        END
      ;
        IF SelectedCourse = {CalCulusA,C,DataStructures,ParallelProgramming} THEN
          SelectedCourse := {CalCulusA,LinearAlgebra,C}
        END
    END;
  
  cancel(x) = 
    PRE 
        not(SelectedCourse = {CalCulusA,C,DataStructures})
      & not(SelectedCourse = {LinearAlgebra,C,DataStructures})
      & not(SelectedCourse = {C,Python,DataStructures})
      & not(SelectedCourse = {CalCulusA,LinearAlgebra,ComplexFunctions})
      & not(SelectedCourse = {CalCulusA,ComplexFunctions,C})
      & not(SelectedCourse = {CalCulusA,ComplexFunctions})
      & not(SelectedCourse = {C,DataStructures})
      & x : SelectedCourse
    THEN
        SelectedCourse := SelectedCourse - {x}
      ;
        IF SelectedCourse = {C,ParallelProgramming} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {DataStructures,ParallelProgramming} THEN
          SelectedCourse := {}
        END
    END
END
