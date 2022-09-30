#---------------Load packages---------------
#install.packages("tidyverse")
#install.packages("ggolot2")
#install.packages("hablar")
library(ggplot2)
library(dplyr)
library(hablar)
library(magrittr)

##--------Data source--------
  #Data comes from vectors in S4_HW_Data.R
  #Used rbind() to create matrices 
  #Used colnames() and rownames() to name rows and columns of matrices

#--------Free throw attempts per game--------
attempts <- FTA / Games 
myplot(attempts)

#--------Accuracy of free throws--------
accuracy <- FT / FTA
myplot(accuracy)

#--------Player style excluding free throws--------
style <- (Points-FT) / FieldGoals
myplot(style)
