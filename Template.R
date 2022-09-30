#---------------Load packages---------------
#install.packages("tidyverse")
#install.packages("ggolot2")
#install.packages("hablar")
library(ggplot2)
library(dplyr)
library(hablar)
library(magrittr)

#---------------Read in data---------------
#getwd()
#setwd()
x <- read.csv("")

#-------- Explore dataset --------
nrow()
ncol()
head()
tail()
str()
summary()

#--------Change column names--------
colnames() <- c("")  

#--------Correct object types--------
x <- x %>%
  convert(fct())

#--------Creating visualizations--------

#--Box plot for genre x us.profit.percentage--

#Crease base

#Define geometries

#Add themes & change legend titles

#Final visualization
