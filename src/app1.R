library(shiny)
library(tidyverse)

ui <- fluidPage(
  uiOutput("colourWheel"),
  titlePanel(
    tagList(
      textOutput("title", inline = TRUE),
      "Shiny App"
    ),
    # Without this, the browser tab would show the HTML of the title above.
    windowTitle = "Shiny App"
  ),
  textInput("name", label = "Enter your Name"),
  numericInput("age", label = "Enter your age", 0),
  textOutput("greeting"),

  selectInput("colour", label = "Choose your favourite colour", c("Blue", "Green", "Orange", "Pink", "Purple", "Red", "Yellow")),
  textOutput("favourite")
  
)

server <- function(input, output, session) {
  output$title <- renderText(paste0(req(input$name), "'s"))
  
  output$favourite <- renderText(paste0("Your favourite colour is: ", input$colour))
  
  greeting <- reactive({
    req(input$name)
    paste0("Hello ", input$name, "! You are ", input$age, " years old!")
  })
  output$greeting <- renderText(greeting())

}

shinyApp(ui, server)
