# Title     : Automata Matrix
# Objective : Automata Matrix
# Created by: Think
# Created on: 15/11/2021

#' Automata Matrix
#'
#' @description Creates a cellular automata matrix w.r.t. a automata rule function, a
#'              starting array, and an iterations value that dictates the number of
#'              automata arrays.
#'
#' @param iterations: the number of cellular automata arrays to be created
#' @param tensor: the starting array
#' @param FUN: the update rule function
#'
#' @return a cellular automata matrix/pattern
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