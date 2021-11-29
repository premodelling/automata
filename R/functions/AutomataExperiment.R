# Title     : Automata Experiment
# Objective : Draw automata patterns w.r.t. a provided rule and other parameters
# Created by: 36112985
# Created on: 28/11/2021


#' AutomataExperiment
#'
#' @description Creates the image of a cellular automaton matrix w.r.t. an automaton rule function, a
#'              starting row vector, and an iterations value that dictates the number of
#'              automata arrays.
#'
#' @param N: the row vector length.
#' @param prob: The distribution of 0 & 1 in the starting row ... e.g. c('0' = 0.95, '1' = 0.05)
#' @param iterations: The number of automata matrix rows, including the starting row.
#' @param FUN: An automaton rule.
AutomataExperiment <- function (N, prob, iterations, FUN) {

  tensor <- sample(x = 0:1, size = N, replace = TRUE, prob = prob)

  pattern <- AutomataMatrix(iterations = iterations, tensor = tensor, FUN = FUN)
  image(pattern, col = c('white', 'black'), axes = FALSE)

}