library(dplyr)
library(ggplot2)
library(RColorBrewer)
tempo_pop_data <- data %>%
  filter(!is.na("tempo")) %>%
  filter(!is.na("popularity"))

#Purpose: Does tempo affect a song’s popularity? 
#This chart aims to show the relationship between a song's tempo and its popularity.

ggplot(data = tempo_pop_data) + 
  geom_point(aes(x = tempo, y = popularity, color = genre)) 

bar <- ggplot(data = tempo_pop_data) +
  geom_col(mapping = aes(x = tempo, y = popularity, fill = genre))


  

