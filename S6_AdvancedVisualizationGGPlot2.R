#---------------Load packages---------------
#install.packages("tidyverse")
#install.packages("ggolot2")
#install.packages("hablar")
library(ggplot2)
library(dplyr)
library(hablar)
library(magrittr)

#---------------Read in data---------------
movies <- read.csv("S6_Movie_Ratings.csv")

#--------Explore data--------
head(movies)
str(movies)

#--------Change column names--------
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "Budget", "ReleaseYear")

#--------Correct object types--------
movies$Film <- factor(movies$Film)
movies$Genre <- factor(movies$Genre)
movies$ReleaseYear <- factor(movies$ReleaseYear)

#--------Aesthetics--------
#Mapping aesthetics (x & y)
ggplot(data=movies, aes(x=CriticRating, 
                        y=AudienceRating)) + geom_point()

#Mapping more aesthetics (size & color)
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=Budget)) 
+ geom_point()

#--------Plotting with layers--------
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre, size=Budget))
p + geom_point()

#--------Plotting with multiple layers--------
p + geom_line(size=.4) + geom_point(size=1.5)

#--------Overriding aesthetics--------
p + geom_point(aes(size=CriticRating)) #Ex 1
p + geom_point(aes(color=Budget)) #Ex 2
p + geom_point(aes(x=Budget)) #Ex 

#--------Mapping versus setting--------
#1.Create base
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#2. Mapping color to a variable
#Add color
r + geom_point(aes(color=Genre))

#3. Setting color uniformly
r + geom_point(color="DarkGreen")

#--------Histograms--------
#1.Create base
s <- ggplot(data=movies, aes(x=Budget))
s + geom_histogram(binwidth = 10)

#2. Map color
s + geom_histogram(binwidth = 10, aes(fill=Genre))

#3. Add color
s + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

#--------Starting layer tips--------
# Set aes in base layer when you want to use the same aes over and over
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10, 
                   fill="White", color="Blue")

#Don't set aes in base layer when aes may change in visualizations
t <- ggplot(data=movies)
t + geom_histogram(aes(x=AudienceRating),
                   binwidth = 10,
                   fill="White", color="Blue")

#--------Statistical transformations--------
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
u + geom_point(size=1) + geom_smooth(fill=NA, size=1)

#Boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, color=Genre))
u + geom_jitter(size=.25) + geom_boxplot(size=1, alpha=0.5) 

#--------Using facets--------
#1. Base visualization (from above)
v <- ggplot(data=movies, aes(x=Budget))
v + geom_histogram(binwidth=10, aes(fill=Genre), 
                   color="Black")

#2. Histogram facet
v + geom_histogram(binwidth=10, aes(fill=Genre), 
                   color="Black") +
  facet_grid(Genre~., scales="free")

#1. Base visualization
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
w + geom_point()

#2. Create facets
w + geom_point() + 
  facet_grid(Genre~.)

w + geom_point() + 
  facet_grid(Genre~ReleaseYear)

w + geom_point() + 
  geom_smooth() + 
  facet_grid(Genre~ReleaseYear)

w + geom_point(aes(size=Budget)) + 
  geom_smooth() +
  facet_grid(Genre~ReleaseYear)

#--------Coordinates--------
#Setting limits with xlim and ylim
x <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, size=Budget, color=Genre))
x + geom_point() +
  xlim(50, 100)
  ylim(50,100)

#Zooming
y <- ggplot(data=movies, aes(x=Budget))

y + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") +
  coord_cartesian(ylim=c(0,50))

w + geom_point(aes(size=Budget)) + 
  geom_smooth() +
  facet_grid(Genre~ReleaseYear) + 
  coord_cartesian(ylim=c(1,100))

w + geom_point() + 
  geom_smooth() +
  facet_grid(Genre~ReleaseYear) + 
  coord_cartesian(ylim=c(1,100))

#--------Themes--------
#1. Create base
o <- ggplot(data=movies, aes(x=Budget))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")

#2. Label formatting
h +
  xlab("Budget in Millions") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="Black", size=10), 
        axis.title.y = element_text(color="Black"))

#3. Tick mark formatting
h +
  xlab("Budget in Millions") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="Black", size=15), 
        axis.title.y = element_text(color="Black", size=15), 
        axis.text.x = element_text(size=12),
        axis.text.y = element_text(size=12))

#4. Legend formatting
h +
  xlab("Budget in Millions") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color="Black", size=15), 
        axis.title.y = element_text(color="Black", size=15), 
        axis.text.x = element_text(size=12),
        axis.text.y = element_text(size=12), 
        
        legend.title = element_text(size=15),
        legend.text = element_text(size=10), 
        legend.position = c(1,1),
        legend.justification = c(1.09,1.04),
        
        plot.title = element_text(color="Black", size=20, family="Arial"))

