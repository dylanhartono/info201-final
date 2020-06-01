#Correlation between song tempo and popularity

library(dplyr)
library(ggplot2)
library(plotly)
library(RColorBrewer)


first_chart <- function(data_df) {
  tempo_pop_data <- data_df %>%
    #filters out NA values
    filter(!is.na(bpm)) %>%
    filter(!is.na(pop)) %>%
    #filters out duplicates
    filter(!duplicated(title)) %>%
    #filters out where bpm = 0 and pop = 0 since there is no meaning
    filter(bpm != 0) %>%
    filter(pop != 0)
  
  plot <- ggplotly(ggplot(data = tempo_pop_data) +
    geom_smooth(mapping = aes(y = bpm, x = pop)) +
    labs(title = "Popularity versus BPM", x = "popularity (100 - most popular)", y = "bpm (beats per minute)"))
    
  return(plot)
}
