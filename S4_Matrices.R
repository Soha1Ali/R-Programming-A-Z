#---------------Load packages---------------
#install.packages("tidyverse")
#install.packages("ggolot2")
#install.packages("hablar")
library(ggplot2)
library(dplyr)
library(hablar)
library(magrittr)

##--------Data source--------
  #Data comes from vectors in S4_Basketball_Data.R
  #Used rbind() to create matrices 
  #Used colnames() and rownames() to name rows and columns of matrices

#--------Replacing specific values in a matrix--------
#1. Create matrix
vector1 <- (rep(c("a", "b", "c"), each=3)) #Create a vector 
matrix1 <- matrix(vector1, 3, 3) #Use matrix() function to create a matrix with 3 rows and 3 columns

#2. Name rows and columns
rownames(matrix1) <- c("1", "2", "3")
colnames(matrix1) <- c("A", "B", "C")
matrix1["1", "C"] <- 0 #Change one value

#--------Visualizing with matplot()--------
matplot(t(FieldGoals), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

#--------Visualizing subsets of data--------
plot1 <- MinutesPlayed[1:3,,drop=F]
matplot(t(data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1:3], col=c(1:4,6), pch=15:18, horiz=F)

#--------Creating functions--------
plot2 <- function(data, rows) {
  data1 <- data[rows,,drop=F]
  matplot(t(data1), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

plot2(Salary, 1:2)
plot2(Salary)
plot2(Salary / Games)



