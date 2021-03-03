#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    rhttp://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("The Green Car"),
  
  # Sidebar with a slider input for minimum and maximum values for x-axis and y-axis 
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderX", "Pick Minimum and Maximum X Values", 0, 6, value = c(0, 6)),
      sliderInput("sliderY", "Pick Minimum and Maximum Y Values", 0, 25, value = c(0, 25))
    ),
    # Show a plot 
    mainPanel(
      h3("MPG Vs Weight of Car"), 
       plotOutput("plot1")
    )
  )
))
