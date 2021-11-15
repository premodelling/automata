# Title     : Update Cell
# Objective : Update Cell
# Created by: Think
# Created on: 15/11/2021

UpdateCell <- function (i, tensor, FUN) {

  N <- length(tensor)
  reference <- c(N, seq(from = 1, to = N - 1))

  coordinates <- tensor[c(reference[i], i, (i %% N) + 1)]

  state <- FUN(i = coordinates[1], j = coordinates[2], k = coordinates[3])

  return(state)

}