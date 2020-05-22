### Correlation between danceability and song popularity 
# Author: Carol Lei
# Editors: Dainese, Dylan, Whitney

library(ggplot2)
library(plotly)
# interactive graph
# depicts artist name, track name
# scatter plot depicting popularity versus danceability
second_chart <- function(songs_df) {
  popularity_dance <- ggplotly(ggplot(songs_df) +
    geom_point(mapping = aes(x = dnce, y = pop, color = top.genre)) +
    scale_fill_brewer(palette = "YlOrRd") +
    labs(title = "Danceability versus Popularity", x = "Danceability", y = "Popularity") +
    scale_colour_discrete("Genres")
  )
  return(popularity_dance)
}

