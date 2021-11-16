# Title     : Automata Matrix
# Objective : Automata Matrix
# Created by: Think
# Created on: 15/11/2021

AutomataMatrix <- function (N, tensor, FUN) {

  T <- tensor
  pattern <- tensor
  while (N > 1) {
    T <- UpdateRow(tensor = T, FUN = FUN)
    pattern <- rbind(pattern, T)
    N <- N - 1
  }

  return(pattern)

}