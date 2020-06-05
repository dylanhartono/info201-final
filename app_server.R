library(dplyr)
library(shiny)
library(RColorBrewer)

# Genres with more than 5 songs
genres <- musicdf %>%
  group_by(top.genre) %>%
  summarise(count = n()) %>%
  filter(count > 5) %>%
  pull(top.genre)
musicdf <- musicdf %>%
  filter(top.genre %in% genres)

library("ggplot2")

# create server function
server <- function(input, output) {
  #render first chart
  output$firstchart <- renderPlotly({
    data <- tempo_data(input$genre_var)

    plot <- ggplot(data = data) +
     geom_smooth(mapping = aes(y = bpm, x = pop)) +
     labs(title = "Popularity versus BPM",
          x = "popularity (100 : most popular)",
          y = "bpm (beats per minute)")
    return(ggplotly(plot))
  })
  #render second chart
  output$secondchart <- renderPlotly({
    data <- tempo_data(input$genre_secondvar)
    Sys.setlocale("LC_ALL", "C")
    plot <- plot_ly(data = data,
            x = ~dnce,
            y = ~pop,
            type = "scatter",
            mode = "markers",
            size = 8,
            color = "coral",
            text = ~paste(artist, "-", title))
    plot <- plot %>% layout(
      title = paste0("Danceability versus Popularity for ",
                     input$genre_secondvar, " Genre"),
      legend = list(title = list(text = "<b> Genre </b>")),
      xaxis = list(title = "Danceability"),
      yaxis = list(title = "Popularity")
    )
    return(plot)
  })

  #render third chart
  output$thirdchart <- renderPlotly({
    year_data <- filter_year(musicdf, input$year)
    plot <- ggplot(data = year_data) +
      geom_col(mapping = aes(x = top.genre, y = pop, fill = top.genre)) +
      labs(
        title = paste0("Most popular genres and associated popularity for ",
                       input$year
                       ),
        x = "Genre",
        y = "Popularity Index"
      ) +
      theme(legend.position = "none")
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
    summarise(pop = mean(pop)) %>%
    top_n(5)
  return(year_data)
}
