# chart Most popular genres of the year(2010-2019)
library("dplyr")
library("plotly")

third_chart <- function(top_songs){
  top_songs <- top_songs %>%
    group_by(year) %>%
    filter(pop == max(pop))
  x <- ggplot(data=top_songs, aes(x=paste(year, title), y=pop, fill=top.genre)) +
    geom_bar(stat="identity") +
    coord_flip() +
    labs(title = "Most popular pop songs from 2010 to 2019", 
         x = "Year & Song Title", 
         y = "Popularity") 
  fig <- ggplotly(x)
  fig
}
