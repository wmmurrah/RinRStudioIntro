#**************************************************************************
# prePost.R ---------------------------------------------------------------
source('data/starRmake.R')
# Regression formula for 
fml <- 'posttest ~ stark + pretest + gender + ethnicity + lunchk + schoolk'
df <- star
# reading -----------------------------------------------------------------
posttest <- star$read1
pretest <- star$readk
readmod.pp <- lm(fml,df)

# math --------------------------------------------------------------------
posttest <- star$math1
pretest <- star$mathk
mathmod.pp <- lm(fml,df)

# tables ------------------------------------------------------------------
# library(texreg)
# screenreg(list(readmod.pp, mathmod.pp))
# END ---------------------------------------------------------------------


