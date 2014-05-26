
# createStarDemoData.R ----------------------------------------------------

library(AER)

data(STAR)

library(VIMGUI)
vmGUImenu()
star <- STAR[!is.na(STAR$stark), ]
star <- star[sample(nrow(star), 150,replace=FALSE), ]
summary(lm(mathk~stark,star))
write.csv(star, file='data/star.csv')
