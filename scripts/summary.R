data <- read.csv("../data/UltimateSpotifyTracks.csv", stringsAsFactors = FALSE)
library(dplyr)
get_summary_info <- function(dataset) {
  list(
    songs <- nrow(dataset),
    num_features <- ncol(dataset),
    most_common_key <- dataset %>% 
      group_by(key) %>% 
      summarise(count = n()) %>% 
      filter(count == max(count)) %>% 
      pull(key),
    avg_tempo <- mean(dataset$tempo),
    avg_dance <- mean(dataset$dance),
    percent_major <- dataset %>% filter(mode == "Major") %>% nrow() / nrow(dataset),
    top_artist <- dataset %>% 
      group_by(artist_name) %>% 
      summarise(count = n()) %>% 
      filter(count == max(count)) %>% 
      pull(count)
  )
}
get_summary_info(data)

