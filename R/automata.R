# Title     : Automata
# Objective : Automata
# Created by: Think
# Created on: 15/11/2021

source(file = 'R/functions/AutomataRule.R')
source(file = 'R/functions/UpdateCell.R')
source(file = 'R/functions/UpdateRow.R')
source(file = 'R/functions/AutomataMatrix.R')
source(file = 'R/functions/UpdateTensor.R')


# Testing AutomataRule
mapply(AutomataRule,
       i = c(0, 0, 0, 0, 1, 1, 1, 1),
       j = c(0, 0, 1, 1, 0, 0, 1, 1),
       k = c(0, 1, 0, 1, 0, 1, 0, 1))


# Testing UpdateCell
N <- 11

tensor <- sample(x = 0:1, size = N, replace = TRUE)

element <- median(c(1, N))
tensor <- numeric(length = N)
tensor[element] <- 1

mapply(UpdateCell,
       index = seq(from = 1, to = N),
       MoreArgs = list('tensor' = tensor, 'FUN' = AutomataRule))


# Testing UpdateRow
iterations <- 3
T <- tensor
pattern <- tensor
while (iterations > 1) {
  T <- UpdateRow(tensor = T, FUN = AutomataRule)
  pattern <- rbind(pattern, T)
  iterations <- iterations - 1
}
print(pattern)



# Tesing UpdateTensor
iterations <- 3
T <- tensor
pattern <- tensor
while (iterations > 1) {
  T <- UpdateTensor(tensor = T, FUN = AutomataRule)
  pattern <- rbind(pattern, T)
  iterations <- iterations - 1
}
print(pattern)



# Testing AutomataMatrix
N <- 21
element <- median(c(1, N))
tensor <- numeric(length = N)
tensor[element] <- 1
pattern <- AutomataMatrix(iterations = 10, tensor = tensor, FUN = AutomataRule)
print(pattern)




