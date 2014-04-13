#**************************************************************************
# starRmake.R -------------------------------------------------------------
# Author: William Murrah
# Description: import smaller sample of STAR data for Rtutorial Demo.
#
# Version history ---------------------------------------------------------
# 2014.04.13: file created
#**************************************************************************


# packages used -----------------------------------------------------------
library(psych)
library(tables)
library(VIMGUI)
# library(foreign) # if importing from other software (e.g. SPSS, STATA, SAS)

star <- read.csv(file='data/star.csv')
# ?STAR
# functions to summarize the data frame
# names(star)
# str(star)
# summary(star)
# describe(star) # psych package



# subset data -------------------------------------------------------------
# This section of code will select only the variable we need for the 
# analyses needed for this project.

vars <- c('gender', 'ethnicity','birth','stark','lunchk','schoolk',
          'schoolidk','readk','mathk','read1', 'math1')

star <- star[ ,names(star) %in% vars]

# psych::describe(numeric.df)

rm(vars)
# Univariate Data Exploration ---------------------------------------------

# barplot(table(star$gender))
# barplot(table(star$ethnicity))
# barplot(table(star$birth))
# barplot(table(star$stark))
# hist(star$readk, col='skyblue')
# hist(star$mathk, col='skyblue')
# hist(star$read1, col='skyblue')
# hist(star$math1, col='skyblue')
# barplot(table(star$schoolk))

# Bivariate Data Exploration ----------------------------------------------

# pairs.panels(star) # psych package
# 
# plot(star$readk, star$read1)
# plot(read1 ~ readk, star, col='red')
# abline(reg=lm(read1~readk,star), col='blue')
# cor(star$readk, star$read1,use='pairwise.complete.obs')


# Cross-tabulations -------------------------------------------------------

# table(star$ethnicity, star$schoolk)
# 
# tabular(ethnicity + lunchk ~ schoolk + 1, star)
# table(mean(star$readk), star$schoolk)
# Mean <- function(x) mean(x, na.rm=TRUE)
# SD <- function(x) sd(x, na.rm=TRUE)
# Min <- function(x) min(x, na.rm=TRUE)
# Max <- function(x) max(x, na.rm=TRUE)
# tabular((mathk + readk)*(Mean + SD) ~ schoolk + 1, star)
# tabular(All(star) ~ (n=1) + Mean + SD + Min + Max , star)
# Missing data analysis ---------------------------------------------------

# vmGUImenu()
