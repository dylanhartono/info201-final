### Correlation between danceability and song popularity 
# Author: Carol Lei
# Editors: Dainese, Dylan, Whitney

rm(list = ls())

library(dplyr)
library(ggplot2)
library(leaflet)

sptfy_tracks_df <- read.csv(
  "../data/Ultimate Spotify Tracks.csv",
  stringsAsFactors = FALSE,
)

billboard_df <- read.csv(
  "../data/Billboard Weekly Songs With Song And Artist Spotify Popularity.csv",
  stringsAsFactors = FALSE,
)

# taking a random sample of 1500 songs
# condense the data and increase point visibility
rand_samp <- sample_n(sptfy_tracks_df, 1500)
samp_songs <- rand_samp %>%
  filter(genre != "Children’s Music")

# non-interactive graph
ggplot(data = samp_songs) +
  geom_point(mapping = aes(x = popularity, y = danceability, color = genre))+ 
  scale_fill_brewer(palette = "YlOrRd") + 
  labs(title = "Danceability versus Popularity", x = "Popularity", y = "Danceability")

# interactive graph
# depicts artist name, track name
# popularity and danceability for sample of 1500 tracks
plot_ly(
  data = samp_songs,
  x = ~popularity,
  y = ~danceability,
  color = ~genre,
  Type = "scatter",
  Mode = "markers",
  text = ~paste('</br>', artist_name,
                '-', track_name, 
                '</br> Popularity:', popularity,
                '</br> Danceability:', danceability)
  ) %>%
  layout (
    title = "Danceability versus Popularity",
    xaxis = list(title = "Popularity"),
    yaxis = list(title = "Danceability")
  )

