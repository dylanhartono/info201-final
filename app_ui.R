library(shiny)
library(ggplot2)
library(dplyr)

genre_list <- unique(musicdf %>% select(top.genre))
year_list <- unique(musicdf %>% select(year))
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
      plotlyOutput("firstchart")
    )
  )
)

third_page <- tabPanel(
  "Third Page",
  sidebarLayout(
    sidebarPanel(
      h1("Music Genre Popularity for a Year"),
      selectInput(
        "year",
        label = "Year",
        choices = year_list,
      )
    ),
    mainPanel(
      h2("How are genre popularities for different years"),
      plotlyOutput("thirdchart")
    )
  )
)

ui <- navbarPage(
  "Title of our project",
  first_page,
  third_page
)

