library(shiny)
library(tidyverse)


penguins <- read_csv("data/penguins.csv")


ui <- fluidPage(
  titlePanel(
    tagList(
      textOutput("title", inline = TRUE),
      "Penguins"
    ),
    windowTitle = "Penguins"
  ),

  
)

server <- function(input, output, session) {

  
}

shinyApp(ui, server)


