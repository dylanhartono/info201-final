library(shiny)
library(ggplot2)
library(dplyr)

genre_list <- unique(musicdf %>% select(top.genre))
year_list <- unique(musicdf %>% select(year))

introduction <-tabPanel(
  "Introduction",
  titlePanel("Spotify Music Trends"),
  mainPanel(
    tags$img("img"),
    p("Our purpose of the project is to figure out which songs
      are on the top of the charts for Spotify. We wonder if
      pop songs are always the dominant genre or there are other
      interesting genres that are popular."),
    p("We got our data from Kaggle by user Leonardo Henrique. He
      gathered information from the Spotify API and gathered 
      information on different variables that characterize a 
      song.")
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
        label = "Select a Year",
        choices = year_list,
      )
    ),
    mainPanel(
      h2("How are genre popularities for different years"),
      plotlyOutput("thirdchart", height = 400)
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
    h6("Understanding Music Popularity"),
    introduction,
    first_page,
    second_page,
    third_page,
    team_members
  )
)

