
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Zooming AirPassengers data plot."),
  h3("Select year renge with the slider and start/end month with the drop down lists. Selected date range will be shown in the plot."),
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("years", "Year range:",round = TRUE, sep = "",
                  min = 1949, max = 1960, value = c(1949,1960)),
      div(style="width:49%;display:inline-block",
        selectInput("startMonth", label="Start month",
                     choices=month.abb, selected = "Jan", multiple = FALSE,
                     selectize = TRUE, width = "30%", size = NULL)),
      div(style="width:49%;display:inline-block;padding-left:35%",
            selectInput("endMonth", label="End month",
                  choices=month.abb, selected = "Jan", multiple = FALSE,
                  selectize = TRUE, width = "1000%", size = NULL))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("passPlot")
    )
  )
))
