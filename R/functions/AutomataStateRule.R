# Title     : Automata Summation Rule
# Objective : A new automata rule
# Created by: Think
# Created on: 16/11/2021

AutomataSummationRule <- function (i, j, k) {

  if ( any( !( c(i, j, k) %in% c(0, 1) ) ) ) {

    stop('Each argument must be a binary number, i.e., either 0 or 1')

  } else {

    return(sum(i, j, k) %% 2)

  }

}