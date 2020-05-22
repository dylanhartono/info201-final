# get the summary info of the dataset. This includes the number of songs,
# features that are collected by the dataset to measure a song (not including
# artist, genre, title, year, and X), average popularity, number of genres,
# top genre, and top artist. These are all used in the index.Rmd file for
# overall data analysis
get_summary_info <- function(dataset) {
  summary <- list()
  summary$number_of_songs <- nrow(dataset)
  summary$features <- names(
    dataset %>% 
    select(-title, -artist, -top.genre, -year, -X))
  summary$avg_pop <- round(mean(dataset$pop), digits=2)
  summary$genres <- length(unique(data$top.genre))
  summary$top_genre <- dataset %>%
    group_by(top.genre) %>% 
    summarise(avg_pop = mean(pop)) %>% 
    filter(avg_pop == max(avg_pop)) %>% 
    pull(top.genre)
  summary$top_artist <- dataset %>% 
    group_by(artist) %>% 
    summarise(count = n()) %>% 
    filter(count == max(count)) %>% 
    pull(artist)
  return(summary)
}

