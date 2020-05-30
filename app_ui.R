library(shiny)
library(ggplot2)
library(dplyr)

genre_list <- unique(select(data, top.genre))


first_page <-tabPanel(
  "First chart",
  sidebarLayout(
    sidebarPanel(
      h2("Tempo vs. Popularity"),
      selectInput(
        inputId = "genre_var",
        label = "Select a genre",
        choices = genre_list,
      )),
    mainPanel(
      tags$b("Does a song's tempo relate to its popularity?"),
      plotOutput("firstchart")
    )
  )
)

ui <- navbarPage(
  "Title of our project",
  first_page
)
