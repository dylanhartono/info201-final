library("dplyr")
library("plotly")

top_10_songs <- read.csv("../data/top10s.csv",stringsAsFactors = FALSE)  

top_10_songs <- top_10_songs %>%
  group_by(year) %>%
  filter(pop == max(pop))
  

# chart Most popular genres of the year(2010-2019)
p <- ggplot(data=top_10_songs, aes(x=year, y=pop, fill=top.genre)) +
  geom_bar(stat="identity") +
  labs(title = "Most popular genres of the year(2010-2019)", 
       x = "Year", 
       y = "Popularity") 

fig <- ggplotly(p)

fig