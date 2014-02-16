#**************************************************************************
# stdPrePost.R -------------------------------------------------------------
source('data/starRmake.R')
fml <- 'scale(posttest) ~ tx + scale(pretest) + gender + ethnicity + 
degreek + school1'
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