# chart Most popular pop music genres of the year(2010-2019)
library("dplyr")
library("plotly")
top_songs <- data
third_chart <- function(top_songs) {
  top_songs <- top_songs %>%
    group_by(year) %>%
    filter(pop == max(pop)) %>% 
    summarise(popularity = mean(pop), genre = mode(top.genre))
  fig <- ggplot(data = top_songs) +
    geom_col(mapping = aes(x = as.factor(year), y = popularity, fill = genre)) +
    labs(
      title = "Most popular genres and associated popularity (2010-2019)", 
         x = "Year", 
         y = "Popularity")
  return(fig)
}
mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
