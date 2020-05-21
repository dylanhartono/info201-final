#Correlation between song tempo and popularity

library(dplyr)
library(ggplot2)
library(plotly)
library(RColorBrewer)


first_chart <- function(data_df) {
  tempo_pop_data <- data_df %>%
    filter(!is.na(bpm)) %>%
    filter(!is.na(pop)) %>%
    filter(!duplicated(title)) %>%
    filter(bpm != 0)
  ggplotly(ggplot(data = tempo_pop_data) +
  geom_smooth(mapping = aes(y = bpm, x = pop)) +
  labs(x = "popularity (100 - most popular)", y = "bpm (beats per minute)")
)
}
