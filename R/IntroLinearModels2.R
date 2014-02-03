#**************************************************************************
# R Tutorial: Introduction to Linear Models -------------------------------
# Compiled by: William Murrah
# Description: This tutorial is an introduction to linear models in R. It
#              consists of code based heavily on chapter 3 of the following 
#              text:
#               Gareth James, Daniela Witten, Trevor Hastie and Rob 
#                  Tibshirani (2013). ISLR: Data for An Introduction 
#                  to Statistical Learning with Applications in R. 
#                  R package version 1.0. 
#                  http://CRAN.R-project.org/package=ISLR
#
# Version history ---------------------------------------------------------
# 2014.02.02: File created.
#**************************************************************************

# Chapter 3 Lab: Linear Regression

library(MASS)
load(file='../demoData/wingsc1')
names(wingsc1)

# Simple Linear Regression ------------------------------------------------
mean(wingsc1$ntvbrw2, na.rm=TRUE)
sd(wingsc1$ntvbrw2, na.rm=TRUE)
summary(wingsc1$ntvbrw2)
summary(wingsc1$ntvbrw1)
hist(wingsc1$ntvbrw2, col='steelblue', breaks=14)
hist(wingsc1$ntvbrw1, col='red', breaks=14)
plot(wingsc1$ntvbrw1, wingsc1$ntvbrw2)
plot(jitter(wingsc1$ntvbrw1),wingsc1$ntvbrw2)

lmfit <- lm(ntvbrw2 ~ ntvbrw1) # didn't this work?

lmfit <- lm(ntvbrw2 ~ ntvbrw1,data=wingsc1)
lmfit
summary(lmfit)
names(lmfit)
coef(lmfit) # What is the value of this sparse output?

# We will often take advantage of model objects during our 
# report generation.
confint(lmfit) # confidence intervals

predict(lmfit,data.frame(ntvbrw1=(c(5,10,15))), interval="confidence")

plot(jitter(wingsc1$ntvbrw1), wingsc1$ntvbrw2)
# Or, we can use the fomula argument:
plot(ntvbrw2 ~ jitter(ntvbrw1), data=wingsc1, col='blue', pch=20)
abline(lmfit)
abline(lmfit,lwd=3)
abline(lmfit,lwd=3,col="red")

# Better graph
plot(ntvbrw2 ~ jitter(ntvbrw1), data=wingsc1, col='blue', 
     main='Relationship between Theory of Mind \n at Time 1 and 2',
     xlab='NEPSY Theory of Mind Verbal Score, Time 1',
     ylab='NEPSY Theory of Mind Verbal Score Time 2',
     ylim=c(0,25), xlim=c(0,20))
abline(lmfit,lwd=3,col="red")
## CAUTION! Feel free to ignore these functions.
# segments(wingsc1$ntvbrw1, wingsc1$ntvbrw2, wingsc1$ntvbrw1, 
#          predict(lmfit), col='grey')
# legend(12, 3.5, bquote(Y[i] == beta[0] + beta[1]*x[i] + epsilon[i]), bty='n')
# abline(v=0, lty=3,col='green')


plot(residuals(lmfit) ~ predict(lmfit), data=wingsc1)
abline(h=0, col='blue')
plot(predict(lmfit), rstudent(lmfit))
abline(h=0)
plot(hatvalues(lmfit))
which.max(hatvalues(lmfit))

par(mfrow=c(2,2))
plot(lmfit)
par(mfrow=c(1,1))
# Multiple Linear Regression ----------------------------------------------
wings <- wingsc1[ ,c('dmschool1', 'dmcond1', 
                     'dmmale', 'dmagey1', 'ntvbrw1',
                     'ntvbrw2')]
lmfit <- lm(ntvbrw2 ~ ntvbrw1 + dmagey1, data=wings)
summary(lmfit)
# you may have some extra code here that doesn't work

library(car)
vif(lmfit1)

library(texreg)
screenreg(lmfit1)
# Interaction Terms -------------------------------------------------------

lmfitx1 <- lm(ntvbrw2 ~ ntvbrw1 + dmagey1 + ntvbrw1:dmagey1, wingsc1)
lmfitx2 <- lm(ntvbrw2 ~ ntvbrw1*dmagey1, wingsc1)
screenreg(list(lmfitx1, lmfitx2), custom.model.names=c('lmfitx1', 'lmfitx2'))
summary(lmfitx2)

# Non-linear Transformations of the Predictors
lmfit2 <- lm(ntvbrw2 ~ ntvbrw1 + I(ntvbrw1^2), wingsc1)
summary(lmfit2)
lmfit <- lm(ntvbrw2 ~ ntvbrw1, wingsc1)
anova(lmfit,lmfit2)
par(mfrow=c(2,2))
plot(lmfit2)

summary(lm(ntvbrw2 ~ log(ntvbrw1), data=wingsc1))


# Qualitative Predictors --------------------------------------------------
library(ISLR)
data(Carseats)
?Carseats
names(Carseats)
lmfit <- lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
summary(lmfit)
attach(Carseats)
contrasts(Carseats$ShelveLoc)



# Qualitative Predictors --------------------------------------------------

names(wingsc1)
hist(wingsc1$htp3su2)

lmfit <- lm(htp3su2 ~ dmcond1 + htp3su1 + dmmale + dmagey1 + dmschool1, wingsc1)
summary(lmfit)
contrasts(wingsc1$dmcond1)
contrasts(wingsc1$dmmale)
contrasts(wingsc1$dmschool1)

lmfit2 <- update(lmfit, . ~ . + htp3su1:dmschool1)
summary(lmfit2)
library(visreg)
visreg(lmfit2, xvar='htp3su1', by='dmschool1', overlay=TRUE, band=FALSE)

lmfit3 <- update(lmfit, . ~ . + dmschool1:dmcond1)
summary(lmfit3)
visreg(lmfit3, xvar='dmschool1', by='dmcond1')
# Some cool nested functions ----------------------------------------------

# scaled score regression
sc.lmfit <- lm(scale(htp3su2) ~ dmcond1 + scale(htp3su1) + dmmale + scale(dmagey1) + 
                dmschool1, wingsc1)
summary(sc.lmfit)

cent <- function(x) {
  scale(x, scale=FALSE)
}

cnt.lmfit <- lm(cent(htp3su2) ~ dmcond1 + cent(htp3su1) + dmmale + cent(dmagey1) + 
                dmschool1, wingsc1)

cnt.lmfit2 <- lm(scale(htp3su2,scale=F) ~ scale(htp3su1,scale=F) + dmmale + 
                 scale(dmagey1,scale=F) + 
                 dmschool1, wingsc1)

summary(cnt.lmfit)
summary(cnt.lmfit2)
summary(lmfit)

# gain scores

lmgain <- lm((htp3su2 - htp3su1) ~ dmmale + dmagey1 + dmschool1, wingsc1)
summary(lmgain)
