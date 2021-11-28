# Title     : TODO
# Objective : TODO
# Created by: Think
# Created on: 28/11/2021


UpdateTE <- function (iterations, tensor, FUN) {

  T <- tensor
  pattern <- tensor
  while (iterations > 1) {
    T <- FUN(tensor = T, FUN = AutomataRule)
    pattern <- rbind(pattern, T)
    iterations <- iterations - 1
  }
  print(pattern)

}