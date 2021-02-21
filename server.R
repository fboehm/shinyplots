library(shiny)
library(ggplot2)

dat <- readr::read_csv("Chal59_RSTR_Pilot_MASTER.csv")

shinyServer(function(input, output, session) {
  
  output$text1 <- renderText({input$id1})
  

  output$plot1 <- renderPlot({
    g <- ggplot(dat, aes_string(x = input$select2, y = input$select1)) 
    g <- g + geom_boxplot() +
      labs(x = "Class", y = "Value") + 
      theme_bw()
    return(g)
  })
  output$test <- reactivePrint(function(){
    z <- factor(input$select2)
    anova(lm(input$select1 ~ z))
  })
    
})