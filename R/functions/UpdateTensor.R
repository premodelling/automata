# Title     : Update Tensor
# Objective : For testing the row updating functions UpdateRowIndependent() & UpdateRowDependent()
# Created by: Think
# Created on: 28/11/2021


#' @param iterations: the number of rows, including 'tensor', to preview
#' @param tensor: the row vector that will update the next row
#' @param FUN: the function of an automata rule type
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