#---------------Load packages---------------
#install.packages("tidyverse")
#install.packages("ggolot2")
#install.packages("hablar")
library(ggplot2)
library(dplyr)
library(hablar)
library(magrittr)

#---------------Read in data---------------
df6 <- read.csv("Section6-Homework-Data.csv")

#-------- Explore dataset --------
nrow(df6)
ncol(df6)
head(df6, n=2)
tail(df6, n=10)
str(df6)
summary(df6)

#--------Change column names--------
colnames(df6) <- c("day.of.week", "director", "genre", "movie.title", "release.date", "studio", "adjusted.gross.profit", "budget.millions", "gross.profit", "imdb.rating", "movielens.rating", "overseas.proft", "overseas.profit.percent", "profit", "profit.percent", "runtime.minutes", "us.profit", "us.profit.percent")  

#--------Correct object types--------
df6 <- df6 %>%
  convert(fct(day.of.week, 
              genre, 
              studio),
          num(adjusted.gross.profit, 
              budget.millions,
              gross.profit, 
              overseas.proft,
              overseas.profit.percent, 
              profit, 
              profit.percent))

#--------Creating visualizations--------

#--Box plot for genre x us.profit.percentage--

#Filter genres 
df6.1 <- df6 %>% filter(
  genre == "action" | 
    genre == "adventure" |
    genre == "animation" |
    genre == "comedy" |
    genre == "drama", )

#Filter studios
df6.2 <- df6.1 %>% filter(
  studio == "Buena Vista Studios" | 
    studio == "Fox" | 
    studio == "Paramount Pictures" | 
    studio == "Sony" |
    studio == "Universal" | 
    studio == "WB", )

#Crease base
df6.3 <- ggplot(data=df6.2, aes(x=genre, y=us.profit.percent)) 

#Define geometries
df6.4 <- df6.3 + geom_jitter(aes(color=studio, size=budget.millions), alpha=0.7) + 
  geom_boxplot(alpha=0.5, outlier.color = NA)

#Add themes & change legend titles
df6.5 <- df6.4 +
  xlab("Movie Genre") +
  ylab("Gross % Profit US") +
  ggtitle("Domestic Gross % by Genre") + 
  labs(color="Studio", size="Budget in Millions") +
  
  theme(plot.title = element_text(color="Black", size=15, family="Arial", hjust=0.5))

#Final visualization
df6.5