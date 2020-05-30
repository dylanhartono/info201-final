library(shiny)
library(ggplot2)
library(dplyr)

source("scripts/first-chart.R")
tempo_data <- data %>%
  filter(top.genre == input$genre_var)

server <- function(input, output) {
  output$firstchart <- renderPlot({
    title <- paste("Tempo VS Popularity for: ", input$genre_var)
    first_chart(tempo_data)
    })
}


