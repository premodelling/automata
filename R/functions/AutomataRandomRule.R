# Title     : Automata Random Rule
# Objective : A new automata rule
# Created by: 36112985
# Created on: 16/11/2021


#' @param i: The state of the first of three contiguous cells of a row vector.
#' @param j: The state of the second of three contiguous cells of a row vector.
#' @param k: The state of the third of three contiguous cells of a row vector.
#'
#' @return: The state of the new generation cell that is adjacent to the three cells.  A new generation cell
#'          is a cell in the new/next row down.
#'
AutomataRandomRule <- function (i, j, k) {

  if ( any( !( c(i, j, k) %in% c(0, 1) ) ) ) {

    stop('Each argument must be a binary number, i.e., either 0 or 1')

  } else {

    decimal <-  (i * 2^2) + (j * 2) + (k * 1)
    denominator <- -1 + 2^nargs()

    return(round(decimal/denominator))

  }

}