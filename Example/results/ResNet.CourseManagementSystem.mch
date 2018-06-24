
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
      & not(SelectedCourse = {CalCulusA,LinearAlgebra,C})
      & not(SelectedCourse = {CalCulusA,CalCulusB,LinearAlgebra})
      & not(SelectedCourse = {CalCulusA,LinearAlgebra,ProbabilityAndStatistics})
      & not(SelectedCourse = {CalCulusA,LinearAlgebra,ComplexFunctions})
      & not(SelectedCourse = {CalCulusA,CalCulusB,ComplexFunctions})
      & not(SelectedCourse = {CalCulusA,ProbabilityAndStatistics,ComplexFunctions})
      & not(SelectedCourse = {CalCulusA,CalCulusB,ProbabilityAndStatistics})
      & not(SelectedCourse = {CalCulusA,CalCulusB,C})
      & not(SelectedCourse = {CalCulusA,ProbabilityAndStatistics,C})
      & not(SelectedCourse = {CalCulusA,ComplexFunctions,C})
      & not(SelectedCourse = {CalCulusA,C,Python})
      & not(SelectedCourse = {LinearAlgebra,C,Python})
      & not(SelectedCourse = {CalCulusA,C,DataStructures})
      & not(SelectedCourse = {LinearAlgebra,C,DataStructures})
      & not(SelectedCourse = {C,Python,DataStructures})
      & not(SelectedCourse = {C,DataStructures,ParallelProgramming})
      & card(SelectedCourse) < N
      & #p.(p <: SelectedCourse & x |-> p : CourseRequirement)
    THEN
      SelectedCourse := SelectedCourse \/ {x}
    END;
  
  cancel(x) = 
    PRE 
        x : SelectedCourse
    THEN
        SelectedCourse := SelectedCourse - {x}
      ;
        IF SelectedCourse = {DataStructures} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {C,ParallelProgramming} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {DataStructures,ParallelProgramming} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {Python,DataStructures} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {LinearAlgebra,DataStructures} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {CalCulusA,DataStructures} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {Python} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {LinearAlgebra,Python} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {CalCulusA,Python} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {ComplexFunctions} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {ComplexFunctions,C} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {ProbabilityAndStatistics} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {ProbabilityAndStatistics,C} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {CalCulusB} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {CalCulusB,C} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {CalCulusB,ProbabilityAndStatistics} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {ProbabilityAndStatistics,ComplexFunctions} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {CalCulusB,ComplexFunctions} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {LinearAlgebra,ComplexFunctions} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {LinearAlgebra,ProbabilityAndStatistics} THEN
          SelectedCourse := {}
        END
      ;
        IF SelectedCourse = {CalCulusB,LinearAlgebra} THEN
          SelectedCourse := {}
        END
    END
END
