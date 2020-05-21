#Correlation between song tempo and popularity

library(dplyr)
library(ggplot2)
library(plotly)
library(RColorBrewer)

data<- read.csv("../data/top10s.csv", stringsAsFactors = FALSE)

tempo_pop_data <- data %>%
  filter(!is.na(bpm)) %>%
  filter(!is.na(pop))



#This chart aims to show the relationship between a song's tempo and its popularity.
#We want to see whether a song's tempo has correlations to its popoularity.

#The bar chart below shows the relationship between a song's tempo and its popularity.


#measured in 
#what do the chunks represent
#scatter 
ggplotly(ggplot(data = tempo_pop_data) +
  geom_smooth(mapping = aes(x = bpm, y = pop)))

b <- plot_ly(
  data = tempo_pop_data,
  x  = ~bpm,
  y = ~pop,
  color = ~top.genre,
  colors = colorRampPalette(brewer.pal(8,"Dark2"))(27),
  type = "smooth",
  text = ~paste('</br>', top.genre,
                ':',
                '</br> Tempo: ', bpm,
                '</br> Popularity: ', pop)
) %>%
  layout (
    title = "Tempo VS. Popularity",
    xaxis = list(title = "bpm"),
    yaxis = list(title = "popularity")
  )


  


