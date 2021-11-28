# Title     : Automata Experiment
# Objective : Draw automata patterns w.r.t. a provided rule and other parameters
# Created by: Think
# Created on: 28/11/2021


#' @param N: row length
#' @param prob: distribution of 0 & 1 in the starting row ... example -> c('0' = 0.95, '1' = 0.05)
#' @param iterations: the number of automata matrix rows, including the starting row
#' @param FUN: an automata rule
AutomataExperiment <- function (N, prob, iterations, FUN) {

  tensor <- sample(x = 0:1, size = N, replace = TRUE, prob = prob)

  pattern <- AutomataMatrix(iterations = iterations, tensor = tensor, FUN = FUN)
  image(pattern, col = c('white', 'black'), axes = FALSE)

}