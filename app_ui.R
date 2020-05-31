library(shiny)
library(ggplot2)
library(dplyr)

genre_list <- unique(select(data, top.genre))


first_page <-tabPanel(
  "First chart",
  sidebarLayout(
    sidebarPanel(
      h1("Tempo VS Popularity"),
      selectInput(
        "genre_var",
        label = "Select a genre",
        choices = genre_list,
      )
    ),
    mainPanel(
      h2("Does a song's tempo relate to its popularity?"),
      plotOutput("firstchart")
    )
  )
)

ui <- navbarPage(
  "Title of our project",
  first_page
)

