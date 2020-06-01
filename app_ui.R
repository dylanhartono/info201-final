library(shiny)
library(ggplot2)
library(dplyr)

genre_list <- unique(musicdf %>% select(top.genre))
year_list <- unique(musicdf %>% select(year))

introduction <-tabPanel(
  "Introduction",
  mainPanel(
    h2("Problem statement: lorem asdar")
  )
)

first_page <-tabPanel(
  "Popularity and BPM",
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

second_page <-tabPanel(
  "Music Danceability",
  sidebarLayout(
    sidebarPanel(
      h1("Danceability vs Popularity"),
      selectInput(
        "genre_secondvar",
        label = "Select a genre",
        choices = genre_list,
      )
    ),
    mainPanel(
      h2("Does a song's danceability relate to its popularity?"),
      plotlyOutput("secondchart")
    )
  )
)

third_page <- tabPanel(
  "Genres by the Years",
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

team_members <-tabPanel(
  "The Team",
  mainPanel(
    p("Our team blah blah"),
    p("Some more stuff about each of us"),
    p("Dainese Chan"), 
    p("Dylan Hartono"),
    p("Carol Lei"),
    p("Whitney Zhang")
  )
)

ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    h6("Understanding Popularity Music"),
    introduction,
    first_page,
    second_page,
    third_page,
    team_members
  )
)

