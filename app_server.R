library(shiny)
library(ggplot2)
library(dplyr)

source("scripts/first-chart.R")

choice <<- input$genre_var
tempo_data <- data %>%
  filter(top.genre == choice)

server <- function(input, output) {
  output$firstchart <- renderPlot({
    title <- paste("Tempo VS Popularity for: ", choice)
    first_chart(tempo_data)
    })
}


