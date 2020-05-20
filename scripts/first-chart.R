#Correlation between song tempo and popularity

library(dplyr)
library(ggplot2)
library(plotly)
library(RColorBrewer)


random_sample <- sample_n(data, 1500)
tempo_pop_data <- random_sample %>%
  filter(!is.na(tempo)) %>%
  filter(!is.na(popularity)) %>%
  filter(genre != "Children’s Music")


#This chart aims to show the relationship between a song's tempo and its popularity.
#We want to see whether a song's tempo has correlations to its popoularity.

#The bar chart below shows the relationship between a song's tempo and its popularity.
#From this bar chart, we can see that each genre has an average level of 
#popularity and tempo of which most songs in that genre belong to.

#Interpretation : 
#As we can see, there is not one distinct linear relationship between tempo and popularity.
#On average, for songs that have a popularity level of above 50, the faster the tempo,
#the lower the popularity. On the other hand, songs that have a popularity level
#below 50, the faster the tempo, the higher the popularity.

bar_chart <- ggplot(data = tempo_pop_data) +
  geom_col(mapping = aes(x = tempo, y = popularity, fill = genre))

plot_ly(
  data = tempo_pop_data,
  x  = ~tempo,
  y = ~popularity,
  color = ~genre,
  colors = colorRampPalette(brewer.pal(10,"Spectral"))(27),
  type = "bar",
  text = ~paste('</br>', genre,
                ':',
                '</br> Tempo: ', tempo,
                '</br> Popularity: ', popularity)
) %>%
  layout (
    title = "Tempo VS. Popularity",
    xaxis = list(title = "Tempo"),
    yaxis = list(title = "Popularity")
  )
  

