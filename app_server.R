library(dplyr)
library(shiny)

source("scripts/first-chart.R")
musicdf <- read.csv("data/top10s.csv", stringsAsFactors = FALSE)

library("ggplot2")
server <- function(input, output) {
  #render first chart
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
  #render second chart
  output$secondchart <- renderPlotly({
    title <- paste("Danceability VS Popularity for: ", input$genre_secondvar)
    data <- tempo_data(input$genre_secondvar)
    Sys.setlocale("LC_ALL", "C")
    plot <- plot_ly(data = data,
            x = ~dnce,
            y = ~pop,
            type = "scatter",
            mode = "markers",
            colors = colorRampPalette(brewer.pal(8, "Set1"))(27),
            text = ~paste(artist, "-", title))
    plot <- plot %>% layout(
      title = "Danceability versus Popularity",
      legend = list(title=list(text = "<b> Genre </b>"))
    )
    
    #plot <- ggplot(data = data) +
      #geom_smooth(mapping = aes(y = bpm, x = pop)) +
      #labs(title = "Danceability versus Popularity", 
           #x = "popularity (100 - most popular)",
           #y = "danceability (100 - most danceable)")
    return(plot)
  })
  
  #render third chart
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

# other functions
tempo_data <- function(choice) {
  musicdf %>%
    filter(top.genre == choice)
}

filter_year <- function(data, year_look) {
  year_data <- data %>% 
    filter(year == year_look) %>% 
    group_by(top.genre) %>% 
    summarise(pop = mean(pop))
  return(year_data)
}