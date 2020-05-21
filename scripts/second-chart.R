### Correlation between danceability and song popularity 
# Author: Carol Lei
# Editors: Dainese, Dylan, Whitney

rm(list = ls())

library(ggplot2)
library(plotly)

# interactive graph
# depicts artist name, track name
# scatter plot depicting popularity versus danceability
second_chart <- function(songs_df) {
popularity_dance <- ggplotly(ggplot(data = songs_df) +
  geom_point(mapping = aes(x = pop, y = dnce, color = top.genre)) + 
  scale_fill_brewer(palette = "YlOrRd") + 
  labs(title = "Danceability versus Popularity", x = "Popularity", y = "Danceability")
)
}
