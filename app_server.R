library(dplyr)
library(shiny)

source("scripts/first-chart.R")
musicdf <- read.csv("data/top10s.csv", stringsAsFactors = FALSE)

tempo_data <- function(choice) {
  musicdf %>%
    filter(top.genre == choice)
}

library("ggplot2")
server <- function(input, output) {
  output$firstchart <- renderPlotly({
    title <- paste("Tempo VS Popularity for: ", input$genre_var)
    data <- tempo_data(input$genre_var)
    
    plot <- ggplot(data = data) +
     geom_smooth(mapping = aes(y = bpm, x = pop)) +
     labs(title = "Popularity versus BPM", 
          x = "popularity (100 - most popular)",
          y = "bpm (beats per minute)")
    return(ggplotly(plot))
  })
  output$thirdchart <- renderPlotly({
    year_data <- filter_year(musicdf, input$year)
    plot <- ggplot(data = year_data) + 
      geom_col(mapping = aes(x = top.genre, y = pop)) + 
      labs(
        title = paste0("Most popular genres and associated popularity for ",
                       input$year
                       ),
        x = "Genre",
        y = "Popularity"
      )
    return(ggplotly(plot))
  })
}

filter_year <- function(data, year_look) {
  year_data <- data %>% 
    filter(year == year_look) %>% 
    group_by(top.genre) %>% 
    summarise(pop = mean(pop))
  return(year_data)
}