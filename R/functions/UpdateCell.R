# Title     : Update Cell
# Objective : Update Cell
# Created by: Think
# Created on: 15/11/2021

UpdateCell <- function (index, tensor, FUN) {

  N <- length(tensor)
  R <- c(N, seq(from = 1, to = N - 1))

  coordinates <- tensor[c(R[index], index, (index %% N) + 1)]
  state <- FUN(i = coordinates[1], j = coordinates[2], k = coordinates[3])

  return(state)

}