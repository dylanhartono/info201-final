get_summary_table <- function(dataset) {
  summary_table <- dataset %>% 
    group_by(top.genre) %>% 
    summarise(avg_dnce = mean(dnce),
              avg_bpm = mean(bpm),
              avg_popularity = mean(pop),
              )
}