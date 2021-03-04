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
  navbarPage("MPG Vs Wt Shiny Application",
    tabPanel("Instructions",
      helpText("You work for Motor Trend, a car manufacturing company looking at a data set of a collection of cars. ",
               "The company is interested in exploring the relationship between weight of car and miles per gallon (MPG) ",
               "(outcome). They are particularly interested in knowing the optimum weight of car that would provide ",
               "maximum mpg for a given number of cylinders of engine.  For this purpose they would like to study the ",
               "regression model for each possible scenario."),  
      hr(),
      helpText("The application is available by clicking on the 'Analysis' tab. The use of the application is self ",
               "explanatory.  Please adjust appropriate slider to appropriate values to focus on specific are of the ",
               "scatterplot.  The display panel will automatically update and will also display the regression model ",
               "that is specific to the data that is visible in the display panel."),
      hr(),
      helpText("Please note that the application will give you an error 'Error: 0 (non-NA) cases' if you move the slider to values where no data ",
               "points are available.")
      ),

    tabPanel("Analysis",
      titlePanel("The Green Car"),
  
  # Sidebar with a slider input for minimum and maximum values for x-axis and y-axis 
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderX", "Pick Minimum and Maximum Weight Values", 0, 6, value = c(0, 6), step = 0.2),
      sliderInput("sliderY", "Pick Minimum and Maximum MPG Values", 0, 25, value = c(0, 25))
    ),
    # Show a plot 
    mainPanel(
      h3("MPG Vs Weight of Car"), 
       plotOutput("plot1")
    )
  )
)
)
)
)
