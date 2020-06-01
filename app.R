library(shiny)
library(ggplot2)
library(plotly)

ui <- source("app_ui.R")
server <- source("app_server.R")

shinyApp(ui = ui, server = server)
