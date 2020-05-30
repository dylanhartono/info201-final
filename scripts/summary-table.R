# function that gets summary information of each genre. That means
# the number of songs, average danceability, average tempo (bpm),
# arranged from their average popularity.
# Digits are rounded to 1 decimal place
get_summary_table <- function(dataset) {
  summary_table <- dataset %>%
    group_by(top.genre) %>%
    summarise(
      avg_popularity = round(mean(pop), digits = 1),
      count = n(),
      avg_dnce = round(mean(dnce), digits = 1),
      avg_bpm = round(mean(bpm), digits = 1),
      ) %>%
    arrange(desc(avg_popularity), desc(count))
}

