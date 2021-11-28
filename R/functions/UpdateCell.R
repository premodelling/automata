# Title     : Update Cell
# Objective : Update Cell
# Created by: 36112985
# Created on: 15/11/2021


#' UpdateCell
#'
#' @description For determining the state of a new/next generation cell
#'
#' @param index: The row index of the next generation cell whose state is being determined
#' @param tensor: The row vector that is updating the cells of the next generation.
#' @param FUN: The function of an automata rule.
#'
#' @return The state of a next generation cell
#'
UpdateCell <- function (index, tensor, FUN) {

  N <- length(tensor)
  R <- c(N, seq(from = 1, to = N - 1))

  coordinates <- tensor[c(R[index], index, (index %% N) + 1)]
  state <- FUN(i = coordinates[1], j = coordinates[2], k = coordinates[3])

  return(state)

}