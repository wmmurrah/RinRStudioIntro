# starRmake.R -------------------------------------------------------------
star <- read.csv(file='data/star.csv')
names(star)[1] <- 'id'
# Create treatment variable. Always set seed values when using functions
# utilize random number generation, so your numbers can be exactly 
# replicated.
set.seed(111) 
tx <- rbinom(n=100, size=1, prob=.50)
star$tx <- factor(tx, labels=c('control', 'treatment'))
mathEffect <- tx*(13 + rnorm(100, 0, 1))
star$math1 <- star$math1 + mathEffect
# END ---------------------------------------------------------------------


