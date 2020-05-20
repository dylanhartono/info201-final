library(dplyr)
library(ggplot2)
library(RColorBrewer)
tempo_pop_data <- data %>%
  filter(!is.na("tempo")) %>%
  filter(!is.na("popularity"))

#Purpose: Does tempo affect a song’s popularity? 
#This chart aims to show the relationship between a song's tempo and its popularity.

#This scatter plot shows the relationship between a song's tempo and its popularity.
scatter_plot <- ggplot(data = tempo_pop_data) + 
  geom_point(aes(x = tempo, y = popularity, color = genre)) 


#This bar chart shows the relationship between a song's tempo and its popularity.
bar_plot <- ggplot(data = tempo_pop_data) +
  geom_col(mapping = aes(x = tempo, y = popularity, fill = genre))


  

