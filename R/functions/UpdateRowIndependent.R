# Title     : Update Row Independent
# Objective : Update automata rows independent of, without using, external function UpdateCell()
# Created by: 36112985
# Created on: 15/11/2021


#' UpdateRowIndependent
#'
#' @description For creating the new/next generation row vector of a cellular automaton
#'
#' @param tensor: The row vector that will determine the states of the new/next generation row vector.
#' @param FUN: The function of an automata rule.
#'
#' @return The new/next generation row vector.
#'
UpdateRowIndependent <- function (tensor, FUN) {

  # The length of the tensor (N) and a
  # cyclically shifted vector of indices (R) ... it ensures that index - 1 picks the last ... if index == 1
  N <- length(tensor)
  R <- c(N, seq(from = 1, to = N - 1))


  #' A private function that evaluates the state of a cell parallel
  #' to the one in focus
  #'
  #' @param index: cell index
  #'
  #' @return state of parallel cell
  #'
  .UpdateCell <- function(index) {
    coordinates <- tensor[c(R[index], index, (index %% N) + 1)]
    state <- FUN(i = coordinates[1], j = coordinates[2], k = coordinates[3])

    return(state)
  }


  return( mapply(.UpdateCell, index = seq(from = 1, to = N)) )

}