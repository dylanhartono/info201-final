library(dplyr)
library(ggplot2)

tempo_pop_data <- data %>%
  filter(!is.na(tempo)) %>%
  filter(!is.na(popularity)) %>%
  filter(genre != "Children’s Music")


#This chart aims to show the relationship between a song's tempo and its popularity.
#We want to see whether a song's tempo has correlations to its popoularity.

scatter_plot <- ggplot(data = tempo_pop_data) + 
  geom_point(aes(x = tempo, y = popularity, color = genre)) 

#The bar chart below shows the relationship between a song's tempo and its popularity.
#From this bar chart, we can see that each genre has an average level of 
#popularity and tempo of which most songs in that genre belong to.

#Interpretation : 
#As we can see, there is not one distinct linear relationship between tempo and popularity.
#On average, for songs that have a popularity level of above 50, the faster the tempo,
#the lower the popularity. On the other hand, songs that have a popularity level
#below 50, the faster the tempo, the higher the popularity.

ggplot(data = tempo_pop_data) +
  geom_col(mapping = aes(x = tempo, y = popularity, fill = genre))


  

