library("dplyr")
library("plotly")
spfy_tracks_df <- read.csv("../data/UltimateSpotifyTracks.csv", stringsAsFactors = FALSE)

b_week_songs_df <- read.csv("../data/Billboard Weekly Songs With Song And Artist Spotify Popularity.csv", 
                           stringsAsFactors = FALSE)
  
# song of the year
song_of_year_df <- b_week_songs_df%>%
  filter(year >= 1997) %>%
  filter(Rank == 1) %>%
  group_by(Title) %>%
  filter(Weeks.on.chart == max(Weeks.on.chart)) %>%
  group_by(year) %>%
  filter(Weeks.on.chart == max(Weeks.on.chart))


  
# Combine two dataframe
clean_spfy_tracks_df <- spfy_tracks_df %>%
  select(artist_name, genre)


com_song_gen_df <- song_of_year_df %>%
  mutate(artist_name = Artist) %>%
  left_join(clean_spfy_tracks_df, "artist_name") %>%
  unique()
# mixed chart 


plot <- plot_ly(song_of_year_df, x = ~year, y = ~Weeks.on.chart, type = "bar",
                text = ~Title, textposition = "auto")

plot <- plot %>% layout(title = "The Song of the Year(1997-2017)",
                      xaxis = list(title = "Year"),
                      yaxis = list(title = "Weeks"))

plot
  