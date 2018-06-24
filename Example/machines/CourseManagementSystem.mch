MACHINE
  CourseManagementSystem

SETS
  Course = {CalCulusA,CalCulusB,LinearAlgebra,ProbabilityAndStatistics,ComplexFunctions,Mechanics,Thermodynamics,Electromagnetics,C,Python,DataStructures,ParallelProgramming}
CONSTANTS
  N, CourseRequirement
PROPERTIES
  N : NATURAL &
  N = 4 &
  CourseRequirement : POW(Course * POW(Course)) &
  CourseRequirement = {
    (CalCulusA,{}),
    (CalCulusB,{CalCulusA}),
    (LinearAlgebra,{}),
    (ProbabilityAndStatistics,{CalCulusA}),
    (ComplexFunctions,{CalCulusA}),
    (Mechanics,{CalCulusA,CalCulusB,LinearAlgebra}),
    (Thermodynamics,{Mechanics,ProbabilityAndStatistics}),
    (Electromagnetics,{Mechanics,ComplexFunctions}),
    (C,{}),
    (Python,{C}),
    (DataStructures,{C}),
    (ParallelProgramming,{C,DataStructures})
  }
VARIABLES
  SelectedCourse

INVARIANT
  SelectedCourse : POW(Course) &
  card(SelectedCourse) < N &
  !(u,r).((u,r) : CourseRequirement => not(u : SelectedCourse & not(r <: SelectedCourse)))

INITIALISATION
  SelectedCourse := {}

OPERATIONS

  select(x) =
    PRE
      x : Course &
      card(SelectedCourse) < N &
      #(p).(p <: SelectedCourse & (x,p) : CourseRequirement)
    THEN
      SelectedCourse := SelectedCourse \/ {x}
    END ;

  cancel(x) =
    PRE
      x : SelectedCourse
    THEN
      SelectedCourse := SelectedCourse - {x}
    END
END

  
