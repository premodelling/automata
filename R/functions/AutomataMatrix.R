# Title     : Automata Matrix
# Objective : Automata Matrix
# Created by: Think
# Created on: 15/11/2021

#' Automata Matrix Function
AutomataMatrix <- function (iterations, tensor, FUN) {

  T <- tensor
  pattern <- tensor
  while (iterations > 1) {
    T <- UpdateRow(tensor = T, FUN = FUN)
    pattern <- rbind(pattern, T)
    iterations <- iterations - 1
  }

  return(pattern)

}