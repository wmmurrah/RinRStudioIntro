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
data(Boston)
names(Boston)
?Boston
fix(Boston)

# Simple Linear Regression ------------------------------------------------
mean(Boston$medv)
sd(Boston$medv)
summary(Boston$medv)
summary(Boston$lstat)
hist(Boston$medv, col='steelblue', breaks=50)
hist(Boston$lstat, col='red', breaks=50)
plot(Boston$lstat, Boston$medv)

lmfit <- lm(medv ~ lstat) # didn't this work?

lmfit <- lm(medv ~ lstat,data=Boston)
lmfit
summary(lmfit)
names(lmfit)
coef(lmfit) # What is the value of this sparse output?

# We will often take advantage of model objects during our 
# report generation.
confint(lmfit) # confidence intervals

predict(lmfit,data.frame(lstat=(c(5,10,15))), interval="confidence")

plot(Boston$lstat,Boston$medv)
# Or, we can use the fomula argument:
plot(medv ~ lstat, data=Boston, col='blue', pch=20)
abline(lmfit)
abline(lmfit,lwd=3)
abline(lmfit,lwd=3,col="red")

# Better graph
plot(medv ~ lstat, data=Boston, col='blue', 
     main='Relationship between home value and \n the % of the suburb that is lower status ',
     xlab='% lower status',
     ylab="median home value (in $1,000's)",
     ylim=c(0,50), xlim=c(0,40))
abline(lmfit,lwd=3,col="red")
## CAUTION! Feel free to ignore this command.
segments(Boston$lstat, Boston$medv, Boston$lstat, predict(lmfit), col='grey')
legend(25, 45, bquote(Y[i] == beta[0] + beta[1]*x[i] + epsilon[i]), bty='n')
abline(v=0, lty=3,col='green')


plot(residuals(lmfit) ~ predict(lmfit), data=Boston)
abline(h=0, col='blue')
plot(predict(lmfit), rstudent(lmfit))
abline(h=0)
plot(hatvalues(lmfit))
which.max(hatvalues(lmfit))

par(mfrow=c(2,2))
plot(lmfit)
par(mfrow=c(1,1))
# Multiple Linear Regression ----------------------------------------------

lmfit <- lm(medv ~ lstat + age, data=Boston)
summary(lmfit)
lmfit <- lm(medv ~ ., data=Boston)
summary(lmfit)

lmfit1 <- lm(medv ~ . - age - indus, data=Boston)
summary(lmfit1)
lmfit1 <- update(lmfit, ~.-age)

library(car)
vif(lmfit1)

library(texreg)
screenreg(lmfit1)
# Interaction Terms -------------------------------------------------------

lmfitx1 <- lm(medv ~ lstat + age + lstat:age, Boston)
lmfitx2 <- lm(medv ~ lstat*age, Boston)
screenreg(list(lmfitx1, lmfitx2), custom.model.names=c('lmfitx1', 'lmfitx2'))
summary(lmfitx2)

# Non-linear Transformations of the Predictors
lmfit2 <- lm(medv ~ lstat + I(lstat^2), Boston)
summary(lmfit2)
lmfit <- lm(medv ~ lstat, Boston)
anova(lmfit,lmfit2)
par(mfrow=c(2,2))
plot(lmfit2)
lmfit5 <- lm(medv ~ poly(lstat,5), Boston)
summary(lmfit5)
summary(lm(medv ~ log(rm), data=Boston))


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
