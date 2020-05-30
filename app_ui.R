library(shiny)
library(ggplot2)
library(dplyr)

navbarPage(
  "Title of our project",
  first_page
)

genre_list <- unique(select(data, top.genre))

first_page <-tabPanel(
  "First chart",
  sidebarLayout(
    sidebarPanel(
      h2("Tempo vs. Popularity"),
      genre_input <- selectInput(
        "genre_var",
        label = "Select a genre",
        choices = genre_list,
        selected = ""
      )),
      mainPanel(
        #ggplot chart here
      )
      
    )
  )

