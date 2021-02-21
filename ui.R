library(shiny)
dat <- readr::read_csv("Chal59_RSTR_Pilot_MASTER.csv")
opts <- colnames(dat)

shinyUI(pageWithSidebar(
  headerPanel('Exploring flow cytometry values'),
  sidebarPanel(
    selectInput(inputId = "select1", label = "select", 
                choices = opts), 
    selectInput(inputId = "select2", label = "select", 
                choices = opts)
    
  ),
  mainPanel(
    
    textOutput('text1'),
    textOutput('text2'),
    plotOutput('plot1'),
    verbatimTextOutput("test")
  )
))