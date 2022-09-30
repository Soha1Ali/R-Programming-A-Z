#---------------Load packages---------------
#install.packages("tidyverse")
#install.packages("ggolot2")
#install.packages("hablar")
library(ggplot2)
library(dplyr)
library(hablar)
library(magrittr)

#---------------Read in data---------------
trends <- read.csv("S5_HW_Data.csv")

#--------Explore data--------
head(trends)
str(trends)

#--------Separating 1960 and 2013 data from treands df--------
trends.1960 <- trends[trends$Year == 1960, ] 
trends.2013 <- trends[trends$Year == 2013, ] 

#--------Creating dfs for vectorized data--------
trends.1960.2 <- data.frame(Country.Code=Country_Code, Life.Expectancy=Life_Expectancy_At_Birth_1960)
trends.2013.2 <- data.frame(Country.Code=Country_Code, Life.Expectancy=Life_Expectancy_At_Birth_2013)

#--------Merging dfs--------
merged.1960 <- merge(trends.1960, trends.1960.2, by.x = "Country.Code", by.y = "Country.Code")
merged.2013 <- merge(trends.2013, trends.2013.2, by.x = "Country.Code", by.y = "Country.Code")

#--------Creating visualizations--------

#--1960 data--

#Boxplot for region x life expectancy 1960
qplot(data=merged.1960, x=Region, y=Life.Expectancy, 
      geom=c("boxplot"), shape=I(19), alpha=I(0.6), size=I(1),
      main="Life Expectancy by Region (1960)")

#Boxplot for region x fertility rate 1960
qplot(data=merged.1960, x=Region, y=Fertility.Rate, 
      geom=c("boxplot"), shape=I(19), alpha=I(0.6), size=I(1),
      main="Fertility Rate by Region (1960)")

#Scatterplot for life expectancy x fertility rate 1960
qplot(data=merged.1960, x=Life.Expectancy, y=Fertility.Rate, 
      geom=c("point"), color=Region, shape=I(19), alpha=I(0.6), size=I(1),
      main="Life Expectancy by Region (1960)")

#--2013 data--

#Boxplot for region x life expectancy 2013
qplot(data=merged2013, x=Region, y=Life.Expectancy, 
      geom=c("boxplot"), shape=I(19), alpha=I(0.6), size=I(1),
      main="Life Expectancy by Region (2013)")

#Boxplot for region x fertility rate 2013
qplot(data=merged2013, x=Region, y=Fertility.Rate, 
      geom=c("boxplot"), shape=I(19), alpha=I(0.6), size=I(1),
      main="Fertility Rate by Region (2013)")

#Scatterplot for life expectancy x fertility rate 2013
qplot(data=merged2013, x=Life.Expectancy, y=Fertility.Rate, 
      geom=c("point"), color=Region, shape=I(19), alpha=I(0.6), size=I(1),
      main="Life Expectancy by Region (2013)")
