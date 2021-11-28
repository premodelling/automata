# Title     : Update Row
# Objective : Update automata rows independent of, without using, external function UpdateCell()
# Created by: Think
# Created on: 15/11/2021


#' @param tensor: the row vector that will update the next row
#' @param FUN: the function of an automata rule type
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