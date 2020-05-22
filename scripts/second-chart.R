### Correlation between danceability and song popularity 
# Author: Carol Lei
# Editors: Dainese, Dylan, Whitney

library(ggplot2)
library(plotly)

# interactive graph
# depicts artist name, track name
# scatter plot depicting popularity versus danceability
second_chart <- function(songs_df) {
  genres <- c(songs_df$top.genre)
  popularity_dance <- ggplotly(ggplot(songs_df) +
    geom_point(mapping = aes(x = pop, y = dnce, color = top.genre)) + 
    scale_fill_brewer(palette = "YlOrRd") + 
    labs(title = "Danceability versus Popularity", x = "Popularity", y = "Danceability") + 
    scale_colour_discrete("Genres",
                          labels = genres)
  )
  return(popularity_dance)
}

