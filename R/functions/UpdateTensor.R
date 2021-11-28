# Title     : Update Tensor
# Objective : For testing the cellular automaton row functions UpdateRowIndependent() & UpdateRowDependent()
# Created by: 36112985
# Created on: 28/11/2021


#' UpdateTensor
#'
#' @description For testing the cellular automaton row functions UpdateRowIndependent() & UpdateRowDependent()
#'
#' @param iterations: The number of rows, including 'tensor', to preview.
#' @param tensor: The row vector that will determine the states of the new/next generation row vector.
#' @param FUN: The function of an automata rule.
#'
#' @note Only prints a pattern, no return.
#'
#' @return
#'
UpdateTensor <- function (iterations, tensor, FUN) {

  T <- tensor
  pattern <- tensor
  while (iterations > 1) {
    T <- FUN(tensor = T, FUN = AutomataRule)
    pattern <- rbind(pattern, T)
    iterations <- iterations - 1
  }
  print(pattern)

}