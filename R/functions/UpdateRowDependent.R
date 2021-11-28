# Title     : Update Row Dependent
# Objective : Update automata rows via the UpdateCell() function
# Created by: 36112985
# Created on: 16/11/2021


#' UpdateRowDependent
#'
#' @description For creating the new/next generation row vector of a cellular automaton
#'
#' @param tensor: The row vector that will determine the states of the new/next generation row vector.
#' @param FUN: The function of an automata rule.
#'
#' @return The new/next generation row vector.
#'
UpdateRowDependent <- function (tensor, FUN) {

  return (mapply(UpdateCell,
         index = seq(from = 1, to = length(tensor)),
         MoreArgs = list('tensor' = tensor, 'FUN' = FUN)))

}