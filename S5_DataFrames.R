#---------------Load packages---------------
install.packages("tidyverse")
install.packages("ggolot2")
install.packages("hablar")
library(ggplot2)
library(dplyr)
library(hablar)
library(magrittr)


#----------Importing data into R----------

#Method 1: Select the file manually
#countries.df <- read.csv(file.choose())


#Method 2: Set WD and read data
setwd("/Users/Soha.Pourpirali/Documents/r/R-Programming-A-Z")
getwd()
countries.df <- read.csv("S5_Demographic_Data.csv")

#Functions to explore dataset
nrow(countries.df)
ncol(countries.df)
head(countries.df)
tail(countries.df, n=10)
str(countries.df)
summary(countries.df)
#View(countries.df)

#Change column object type
countries.df$Country.Name <- factor(countries.df$Country.Name)
countries.df$Country.Code <- factor(countries.df$Country.Code)
countries.df$Income.Group <- factor(countries.df$Income.Group)

#Extract a column or row with $
countries.df$Income.Group

#Subsetting
countries.df[1:10, ] #Subset rows 1:10 with all columns
countries.df[c(4,100), ] #Subset rows 4 and 100 with all columns

#Add a column
countries.df$my.calc <- countries.df$Birth.rate * countries.df$Internet.users

#Remove a column
countries.df$my.calc <- NULL

#Filtering dfs
filter1 <- countries.df$Internet.users < 2
countries.df[filter1, ]

countries.df[countries.df$Birth.rate > 40, ]
countries.df[countries.df$Birth.rate > 40 & countries.df$Internet.users < 2, ]
countries.df[countries.df$Income.Group == "High income", ]
countries.df[countries.df$Country.Name == "Malta" ,]






