# Title     : Update Row
# Objective : Update Row
# Created by: Think
# Created on: 15/11/2021

#' @param tensor: the row vector that will update the next row
#' @param FUN: the function of an automata rule type
UpdateRow <- function (tensor, FUN) {

  # The length of the tensor
  N <- length(tensor)

  # A cyclically shifted vector of indices for ...
  reference <- c(N, seq(from = 1, to = N - 1))

  # A function that evaluates the value of the cell parallel to the cell in focus
  ParallelCell <- function(index) {
    coordinates <- tensor[c(reference[index], index, (index %% N) + 1)]
    state <- FUN(i = coordinates[1], j = coordinates[2], k = coordinates[3])
    return(state)
  }

  return( mapply(ParallelCell, index = seq(from = 1, to = N)) )

}