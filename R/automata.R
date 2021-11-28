# Title     : Automata
# Objective : Automata
# Created by: Think
# Created on: 15/11/2021

source(file = 'R/functions/AutomataRule.R')
source(file = 'R/functions/UpdateCell.R')
source(file = 'R/functions/UpdateRow.R')
source(file = 'R/functions/UpdateTensor.R')
source(file = 'R/functions/AutomataMatrix.R')
source(file = 'R/functions/AutomataModuloRule.R')
source(file = 'R/functions/AutomataRandomRule.R')
source(file = 'R/functions/AutomataSummationRule.R')

source(file = 'R/functions/UpdateTE.R')



# Testing AutomataRule
mapply(AutomataRule,
       i = c(0, 0, 0, 0, 1, 1, 1, 1),
       j = c(0, 0, 1, 1, 0, 0, 1, 1),
       k = c(0, 1, 0, 1, 0, 1, 0, 1))


# Testing UpdateCell
N <- 11
element <- median(c(1, N))
tensor <- numeric(length = N)
tensor[element] <- 1

mapply(UpdateCell,
       index = seq(from = 1, to = N),
       MoreArgs = list('tensor' = tensor, 'FUN' = AutomataRule))


# Testing either
iterations <- 3
UpdateTE(iterations = 3, tensor = tensor, FUN = UpdateRow)
UpdateTE(iterations = 3, tensor = tensor, FUN = UpdateTensor)


# Testing AutomataMatrix
N <- 21
element <- median(c(1, N))
tensor <- numeric(length = N)
tensor[element] <- 1

pattern <- AutomataMatrix(iterations = 10, tensor = tensor, FUN = AutomataRule)

print(pattern)
image(pattern, col = c('white', 'black'), axes = FALSE)



# Testing Random Starting Tensors
N <- 50
tensor <- sample(x = 0:1, size = N, replace = TRUE, prob = c('0' = 0.5, '1' = 0.5))
pattern <- AutomataMatrix(iterations = 25, tensor = tensor, FUN = AutomataRule)

print(pattern)
image(pattern, col = c('white', 'black'), axes = FALSE)



# Testing AutomataModuloRule
mapply(AutomataModuloRule,
       i = c(0, 0, 0, 0, 1, 1, 1, 1),
       j = c(0, 0, 1, 1, 0, 0, 1, 1),
       k = c(0, 1, 0, 1, 0, 1, 0, 1))

N <- 50
tensor <- sample(x = 0:1, size = N, replace = TRUE, prob = c('0' = 0.6, '1' = 0.4))
pattern <- AutomataMatrix(iterations = 25, tensor = tensor, FUN = AutomataModuloRule)

print(pattern)
image(pattern, col = c('white', 'black'), axes = FALSE)


# Testing AutomataRandomRule
mapply(AutomataRandomRule,
       i = c(0, 0, 0, 0, 1, 1, 1, 1),
       j = c(0, 0, 1, 1, 0, 0, 1, 1),
       k = c(0, 1, 0, 1, 0, 1, 0, 1))

N <- 50
tensor <- sample(x = 0:1, size = N, replace = TRUE, prob = c('0' = 0.5, '1' = 0.5))
pattern <- AutomataMatrix(iterations = 25, tensor = tensor, FUN = AutomataRandomRule)

print(pattern)
image(pattern, col = c('white', 'black'), axes = FALSE)



# Testing AutomataSummationRule
mapply(AutomataSummationRule,
       i = c(0, 0, 0, 0, 1, 1, 1, 1),
       j = c(0, 0, 1, 1, 0, 0, 1, 1),
       k = c(0, 1, 0, 1, 0, 1, 0, 1))

N <- 49
tensor <- sample(x = 0:1, size = N, replace = TRUE, prob = c('0' = 0.9, '1' = 0.1))
pattern <- AutomataMatrix(iterations = 25, tensor = tensor, FUN = AutomataSummationRule)

print(pattern)
image(pattern, col = c('white', 'black'), axes = FALSE)






