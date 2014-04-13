#**************************************************************************
# stdPrePost.R -------------------------------------------------------------
source('data/starRmake.R')
fml <- 'scale(posttest) ~ stark + scale(pretest) + gender + ethnicity + 
lunchk + schoolk'
df <- star
# reading -----------------------------------------------------------------
posttest <- star$read1
pretest <- star$readk
readmod.spp <- lm(fml,df)

# math --------------------------------------------------------------------
posttest <- star$math1
pretest <- star$mathk
mathmod.spp <- lm(fml,df)

# tables ------------------------------------------------------------------
# library(texreg)
# screenreg(list(readmod.spp, mathmod.spp))
# END ---------------------------------------------------------------------