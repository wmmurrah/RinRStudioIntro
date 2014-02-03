#**************************************************************************
# Introduction to R in Rstudio --------------------------------------------
# by William (Hank) Murrah
# Created on 10/16/2013
#**************************************************************************

# The "#" or hashtag is a comment symbol. Everything on a line following 
# this symbol is not read by R.

# the " <- " symbol is the assignment operator. It assigns what is on the 
# back end of the arrow to the object on the front end. The assignment 
# operator is pronounced "gets", as in "x gets 1 to 100", for the following
# line of code:

x <- 1:100

# in R this operator can be reversed:

1:100 -> x
x <- 1:100

mode(x)