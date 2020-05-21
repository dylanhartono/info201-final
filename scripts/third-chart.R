library("dplyr")
library("plotly")

top_10_songs <- read.csv("../data/top10s.csv",stringsAsFactors = FALSE)  

top_10_songs <- top_10_songs %>%
  group_by(year) %>%
  filter(pop == max(pop))
  

# chart Most popular genres of the year(2010-2019)
p <- top_10_songs %>%
  ggplot(aes(x=year, y=pop)) + 
  geom_point(aes(size=pop, colour=top.genre, text=paste("genre: ", top.genre)), alpha=0.5) +
  geom_text(aes(size=pop, label=title), colour="gray20", alpha=1) +
  labs(title = "Most popular genres of the year(2010-2019)",
       x = "Year",
       y = "Popularity Score") +
  theme(axis.text = year)

fig <- ggplotly(p)

fig






