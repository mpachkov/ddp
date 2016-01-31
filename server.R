
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  output$data <- renderPrint({paste(input$months[length(input$months)],sep = ":")})
  output$passPlot <- renderPlot({
    data <- window(AirPassengers,
                    c(input$years[1], which(month.abb == input$startMonth)),
                    c(input$years[2], which(month.abb == input$endMonth)),
                    12)
    plot(data,main  = paste(paste(input$startMonth,input$years[1], sep = " "),
                            paste(input$endMonth,input$years[2], sep = " "),
                            sep = " - "))
  })

})
