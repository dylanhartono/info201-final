get_summary_info <- function(dataset) {
  list(
    songs <- nrow(dataset),
    features <- names(dataset %>% 
                       select(-title, -artist, -top.genre, -year, -X)),
    avg_bpm <- mean(dataset$bpm),
    avg_dnce <- mean(dataset$dnce),
    avg_top_pop <- mean(dataset$pop),
    top_genre <- dataset %>% 
      group_by(top.genre) %>% 
      summarise(count = n()) %>% 
      filter(count == max(count)) %>% 
      pull(top.genre),
    top_artist <- dataset %>% 
      group_by(artist) %>% 
      summarise(count = n()) %>% 
      filter(count == max(count)) %>% 
      pull(count)
  )
}
