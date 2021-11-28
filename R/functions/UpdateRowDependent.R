# Title     : Update Row Dependent
# Objective : Update automata rows via the UpdateCell() function
# Created by: 36112985
# Created on: 16/11/2021


#' UpdateRowDependent
#'
#' @description For creating the new/next row vector of a cellular automaton
#'
#' @param tensor: The row vector that will update the next row.
#' @param FUN: The function of an automata rule.
#'
#' @return The new/next row vector, i.e., the cellular automaton's next generation row.
#'
UpdateRowDependent <- function (tensor, FUN) {

  return (mapply(UpdateCell,
         index = seq(from = 1, to = length(tensor)),
         MoreArgs = list('tensor' = tensor, 'FUN' = FUN)))

}