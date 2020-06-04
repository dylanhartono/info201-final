library(shiny)
library(ggplot2)
library(dplyr)

musicdf <- read.csv("data/top10s.csv", stringsAsFactors = FALSE,
                    header = TRUE, sep = ',')
genres <- musicdf %>% 
  group_by(top.genre) %>% 
  summarise(count = n()) %>% 
  filter(count > 5) %>% 
  pull(top.genre)
musicdf <- musicdf %>% 
  filter(top.genre %in% genres)

genre_list <- unique(musicdf %>% select(top.genre))
year_list <- unique(musicdf %>% select(year))

introduction <-tabPanel(
  "Introduction",
  titlePanel("Spotify Music Trends"),
  mainPanel(
    tags$img(src = 'imgs/playlist.png', width = "100px", height = "100px"),
    p("Our purpose of the project is to figure out which songs
      are on the top of the charts for Spotify. We wondered if
      pop songs are always the dominant genre or there are other
      interesting genres that are just as popular."),
    p("We got our data from Kaggle by user Leonardo Henrique. He
      gathered information from the Spotify API and gathered 
      information on different variables that characterize a 
      song."),
    p("This leads to our main question..."),
    em("What makes a song popular?"),
    p(),
    p(strong("Quick Disclaimer!"), "We realised in the dataset that there 
      were some genres with only one or two songs that are 
      really popular, but we decided not to keep them.
      Genres with not many songs in the spotify lists indicate
      the song was good but not necessarily the overall genre, 
      so we filtered out genres with less than 5 songs to more
      accurately see which genres are on the top of the charts.")
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
      h2("Does a song's", div("tempo", style = "color: blue"), "relate 
         to its ", div("popularity?", style = "color: PaleVioletRed")),
      tags$br(),
      plotlyOutput("firstchart"),
      p(),
      p("We can observe that the tempo of a song can
        have different correlations to its popularity,
        depending on the genre."),
      p("Some genres, such as ", tags$b("pop "), "have a negative linear
      relationship where songs that are more popular have 
      slower tempo. On the other hand, some genres such as ",
      tags$b("boy band"),"songs have little to no relationship as 
      majority of the songs in that genre are of similar tempo."),
      p("Another fun thing to note is that ", tags$b("hip pop"),
      "songs (hip pop, not hip hop!) seem to have a
      confusing relationship with popularity, evident by the graph
      shown when the genre is picked."),
      tags$i("Note: Hip pop is a genre that can be interpreted in many
              different ways. Some people view hip pop as songs with
              typically hip-hop beats, with a fusion of catchy tunes
              and melodious vocals. Others view hip pop as songs
              that are by hip hop artists they do not consider
              authentic or good hip-hop .")
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
      tags$i(tags$b("Note: "), "The popularity index was based on spotify's popularity index. 
        Ranging from 0 to 100, which shows the least popular 
        songs to the most popular songs."),
      tags$br(),
      p("This bar chart was intended to show the most popular pop songs 
        and music genres changes within a decade. Each of on the chart 
        represent the top 5 music genres of that year with 
        the highest average popularity index."),
      p("Notably, from 2010 to 2019, the", tags$b("Canadian Pop"), "appeared most frequently 
        on the top 5 popular music genre of the year.
        In 2019, the Canadian Pop eanred the highest average 
        popularity index in a decade,with a number of 95."),
      p("In 2010,", tags$b("Barbadian Pop"), "and", tags$b("Hip Pop music"), 
      "gained the same average popularity index with a socre of 65."),
      p("Overall, people's favorite music genres have changed over time, which we could 
        see that there were new types of music appeared on the graph for each year. And 
        people tend to listen to", tags$b("Pop music"), "based on the charts.")
     
    )
  )
)

conclusions_page <- tabPanel(
  "Conclusions",
  mainPanel(
    h3("Here are some final remarks about the project..."),
    tags$li("Most songs actually in many genres ended up being near
       the same bpm, but what was interesting was that data
       showed the more popular songs had more variation to
       their data."),
    tags$li("We found that the measurement on danceability in 
       relation to popularity was not too strong, so really
       we realised that popularity comes from more than just
       one factor"),
    tags$li("Songs that were under a pop genre were considered
       popular. This came to no surprise, but for many of the
       top genres for every year, pop genres from different
       countries and styles came out on top."),
    p("Overall, we concluded from our evidence that there is
      no perfect formula towards getting a song on the Spotify
      charts with only danceability or bpm, but we realise
      from seeing top genres what makes a song popular is in the
      name itself -- it has to be a pop song from the pop genre.
       :)")
  )
)

team_members <-tabPanel(
  "The Team",
  mainPanel(
    p("This data visualization was created by four students attending 
      the University of Washington, taking INFO 201: Technical Foundations.
      "),
    p("Meet the team members:"),
    tags$p(id = "intro", "Dainese Chandra: I'm a junior whose interested in linking 
      economics with data :) I mainly worked with Tempo and Popularity!"),
    tags$p(id = "intro", "Dylan Hartono: G'day! I'm a freshman interested 
      in mobile app development. I mainly worked on the
      summaries and small bugs on pages for the project."),
    tags$p(id = "intro", "Carol Lei: I am a sophomore, passionate about empathetic and inclusive designs.
      I primarily worked on the music danceability page. Cheers!"),
    tags$p(id = "intro", "Whitney Zhang: I am a freshman who is interested in studying
      data science and user experience design. For this project, 
      I mainly worked on the Genres by the Years page."),
    p("Thank you for engaging with our data visualizations!")
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
    conclusions_page, 
    team_members
  )
)


