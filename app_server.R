library(shiny)
library(ggplot2)
library(dplyr)

source("scripts/first-chart.R")
musicdf <- read.csv("data/top10s.csv", stringsAsFactors = FALSE)


tempo_data <- musicdf %>%
  filter(top.genre == choice)


server <- function(input, output) {
  output$firstchart <- renderPlot({
    title <- paste("Tempo VS Popularity for: ", input$genre_var)
    first_chart(tempo_data)
    })
}


