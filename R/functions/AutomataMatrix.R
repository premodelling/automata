# Title     : Automata Matrix
# Objective : Automata Matrix
# Created by: 36112985
# Created on: 15/11/2021


#' AutomataMatrix
#'
#' @description Creates a cellular automaton matrix w.r.t. an automaton rule function, a
#'              starting row vector, and an iterations value that dictates the number of
#'              automaton row vectors.
#'
#' @param iterations: The number of cellular automaton row vectors, including 'tensor', to be created.
#' @param tensor: The starting row vector.
#' @param FUN: The update rule function
#'
#' @return a cellular automaton matrix/pattern
#'
AutomataMatrix <- function (iterations, tensor, FUN) {

  T <- tensor
  pattern <- tensor
  while (iterations > 1) {
    T <- UpdateRowIndependent(tensor = T, FUN = FUN)
    pattern <- rbind(pattern, T)
    iterations <- iterations - 1
  }

  return(pattern)

}