library(shiny)
library(ggplot2)
library(dplyr)

genre_list <- unique(musicdf %>% select(top.genre))
year_list <- unique(musicdf %>% select(year))

introduction <-tabPanel(
  "Introduction",
  titlePanel("Spotify Music Trends"),
  mainPanel(
    tags$img(src = "/imgs/playlist.png", width = "100px", height = "100px"),
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
        label = "Year",
        choices = year_list,
      )
    ),
    mainPanel(
      h2("How are genre popularities for different years"),
      plotlyOutput("thirdchart"),
      p("Note: The popularity index was based on spotify's popularity index. 
        Ranging from 0 to 100, which shows the least popular 
        songs to the most popular songs."),
      p("This bar chart was intended to show the most popular pop songs 
        and music genres changes within a decade. Each of on the chart 
        represent the top 5 music genres of that year with 
        the highest average popularity index."),
      p("Notably, from 2010 to 2019, the Canadian Pop appeared most frequently 
        on the top 5 popular music genre of the year.
        In 2019, the Canadian Pop eanred the highest average 
        popularity index in a decade,with a number of 95."),
      p("In 2015, British Soul and Canadian Pop music gained the same average popularity 
        index with a socre of 71."),
      p("Overall, people's favorite music genres have changed over time, which we could 
        see that there were new types of music appeared on the graph for each year. And 
        people tend to listen to pop music based on the charts.")
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
    p("Whitney Zhang: a freshman who is interested in studying
      data science and user experience design. For this project, 
      mainly working on the Genres by the Years page.")
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


