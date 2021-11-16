# Title     : Automata Modulo Rule
# Objective : A new automata rule
# Created by: Think
# Created on: 16/11/2021

AutomataModuloRule <- function (i, j, k) {

  if ( any( !( c(i, j, k) %in% c(0, 1) ) ) ) {

    stop('Each argument must be a binary number, i.e., either 0 or 1')

  } else {

    decimal <-  (i * 2^2) + (j * 2) + (k * 1)

    return(decimal %% 2)

  }

}