#Correlation between song tempo and popularity

library(dplyr)
library(ggplot2)
library(plotly)
library(RColorBrewer)



#filter out repeated songs and NA values
tempo_pop_data <- data %>%
  filter(!is.na(bpm)) %>%
  filter(!is.na(pop)) %>%
  filter(!duplicated(title)) %>%
  filter(bpm != 0)
  

first_chart <- function(data) {
  ggplotly(ggplot(data = tempo_pop_data) +
  geom_smooth(mapping = aes(y = bpm, x = pop)) +
  labs(x = "popularity (100 - most popular)", y = "bpm (beats per minute)")
)
}


#This chart aims to show the relationship between a song's 
#tempo and its popularity.
#We want to see whether a song's tempo has correlations to its popoularity.

#Popularity index was taken from spotify's popularity index.
#The higher the value, the more popular the song was, with
# 100 meaning the highest possible level of popularity attainable on Spotify.


# Interpretation:
#From the line plot, we can see that as as the popularity level increases,
#the bpm decreases, converging at about 115 bpm. This observation changes
#when popularity level hits above 50, where there is an upward-sloping
#relationship in which the bpm increases with popularity level.
#Once we pass a popularity level of 72, we can see that the
#higher the popularity,the lower the bpm.
#This can imply that slow songs have been more popular from 2010-2019.

#We also note that there is a large error margin, as there are values
#with low popularity (eg. 0) with really low bpm and high bpm.

