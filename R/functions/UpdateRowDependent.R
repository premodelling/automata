# Title     : TODO
# Objective : TODO
# Created by: Think
# Created on: 16/11/2021

UpdateTensor <- function (tensor, FUN) {

  return (mapply(UpdateCell,
         index = seq(from = 1, to = length(tensor)),
         MoreArgs = list('tensor' = tensor, 'FUN' = FUN)))

}