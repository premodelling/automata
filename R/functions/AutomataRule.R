# Title     : Automata Rule
# Objective : Automata Rule
# Created by: Think
# Created on: 15/11/2021

AutomataRule <- function (i, j, k) {

  I <- c(0, 1, 1, 1, 1, 0, 0, 0)

  if ( any( !( c(i, j, k) %in% c(0, 1) ) ) ) {

    stop('Each argument must be a binary number, i.e., either 0 or 1')

  } else {

    decimal <-  (i * 2^2) + (j * 2) + (k * 1)

    return(I[decimal + 1])
  }

}