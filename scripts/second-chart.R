### Correlation between danceability and song popularity
# Author: Carol Lei
# Editors: Dainese, Dylan, Whitney

library(ggplot2)
library(plotly)
# interactive graph
# hover points depict artist name, track name
# scatter plot depicting popularity versus danceability
second_chart <- function(songs_df) {
  songs_df$popularity <- songs_df$pop
  songs_df$danceability <- songs_df$dnce
  Sys.setlocale("LC_ALL", "C")
  fig <- plot_ly(songs_df,
                 x = ~danceability,
                 y = ~popularity,
                 type = "scatter",
                 mode = "markers",
                 color = ~top.genre,
                 colors = colorRampPalette(brewer.pal(8, "Set1"))(27),
                 text = ~paste(artist, "-", title))
  fig <- fig %>% layout(
    title = "Danceability versus Popularity",
    legend =list(title=list(text='<b> Genre </b>'))
  )
  return(fig)
}
