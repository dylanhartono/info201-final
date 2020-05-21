### Correlation between danceability and song popularity 
# Author: Carol Lei
# Editors: Dainese, Dylan, Whitney

rm(list = ls())

library(dplyr)
library(ggplot2)
library(leaflet)
library(plotly)

songs_df <- read.csv(
  "../data/top10s.csv",
  stringsAsFactors = FALSE,
)

# interactive graph
# depicts artist name, track name
# popularity and danceability for sample of 1500 tracks
ggplotly(ggplot(data = songs_df) +
  geom_point(mapping = aes(x = pop, y = dnce, color = top.genre))+ 
  scale_fill_brewer(palette = "YlOrRd") + 
  labs(title = "Danceability versus Popularity", x = "Popularity", y = "Danceability")
)

