# Title     : Update Row Dependent
# Objective : Update automata rows via the UpdateCell() function
# Created by: Think
# Created on: 16/11/2021


#' @param tensor: the row vector that will update the next row
#' @param FUN: the function of an automata rule type
UpdateRowDependent <- function (tensor, FUN) {

  return (mapply(UpdateCell,
         index = seq(from = 1, to = length(tensor)),
         MoreArgs = list('tensor' = tensor, 'FUN' = FUN)))

}