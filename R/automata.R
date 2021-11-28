# Title     : Automata
# Objective : Automata
# Created by: Think
# Created on: 15/11/2021

source(file = 'R/functions/AutomataRule.R')
source(file = 'R/functions/UpdateCell.R')

source(file = 'R/functions/UpdateRowIndependent.R')
source(file = 'R/functions/UpdateRowDependent.R')
source(file = 'R/functions/UpdateTensor.R')

source(file = 'R/functions/AutomataMatrix.R')
source(file = 'R/functions/AutomataModuloRule.R')
source(file = 'R/functions/AutomataRandomRule.R')
source(file = 'R/functions/AutomataStateRule.R')
source(file = 'R/functions/AutomataExperiment.R')



# Reference
reference <- data.frame(i = c(0, 0, 0, 0, 1, 1, 1, 1),
                        j = c(0, 0, 1, 1, 0, 0, 1, 1),
                        k = c(0, 1, 0, 1, 0, 1, 0, 1))


# Testing AutomataRule
mapply(AutomataRule,
       i = c(0, 0, 0, 0, 1, 1, 1, 1),
       j = c(0, 0, 1, 1, 0, 0, 1, 1),
       k = c(0, 1, 0, 1, 0, 1, 0, 1))
reference %>%
  mutate(state = mapply(FUN = AutomataRule, i = i, j = j, k = k))

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
UpdateTensor(iterations = 3, tensor = tensor, FUN = UpdateRowIndependent)
UpdateTensor(iterations = 3, tensor = tensor, FUN = UpdateRowDependent)


# Testing AutomataMatrix
N <- 21
element <- median(c(1, N))
tensor <- numeric(length = N)
tensor[element] <- 1

pattern <- AutomataMatrix(iterations = 10, tensor = tensor, FUN = AutomataRule)

print(pattern)
image(pattern, col = c('white', 'black'), axes = FALSE)



# Random Starting Tensors
N <- 50
tensor <- sample(x = 0:1, size = N, replace = TRUE, prob = c('0' = 0.5, '1' = 0.5))
randomstart <- AutomataMatrix(iterations = 25, tensor = tensor, FUN = AutomataRule)

print(randomstart)
image(randomstart, col = c('white', 'black'), axes = FALSE)



# New Rules

# AutomataModuloRule
mapply(AutomataModuloRule,
       i = c(0, 0, 0, 0, 1, 1, 1, 1),
       j = c(0, 0, 1, 1, 0, 0, 1, 1),
       k = c(0, 1, 0, 1, 0, 1, 0, 1))
reference %>%
  mutate(state = mapply(FUN = AutomataModuloRule, i = i, j = j, k = k))

# AutomataRandomRule
mapply(AutomataRandomRule,
       i = c(0, 0, 0, 0, 1, 1, 1, 1),
       j = c(0, 0, 1, 1, 0, 0, 1, 1),
       k = c(0, 1, 0, 1, 0, 1, 0, 1))
reference %>%
  mutate(state = mapply(FUN = AutomataRandomRule, i = i, j = j, k = k))

# AutomataStateRule
mapply(AutomataStateRule,
       i = c(0, 0, 0, 0, 1, 1, 1, 1),
       j = c(0, 0, 1, 1, 0, 0, 1, 1),
       k = c(0, 1, 0, 1, 0, 1, 0, 1))
reference %>%
  mutate(state = mapply(FUN = AutomataStateRule, i = i, j = j, k = k))


# Try
AutomataExperiment(N = 49, prob = c('0' = 0.95, '1' = 0.05), iterations = 25, FUN = AutomataStateRule)

