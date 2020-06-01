library(shiny)
<<<<<<< HEAD

source("app_ui.R")
source("app_server.R")

shinyApp(ui = ui, server = server)
=======
library(ggplot2)
library(plotly)

ui <- source("app_ui.R")
server <- source("app_server.R")

shinyApp(ui = ui, server = server)
>>>>>>> d8cbb0ee4e22cd4107215b77fb5afd007a9e6ff8
