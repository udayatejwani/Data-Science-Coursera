#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

data(mtcars)

# Define server logic required to draw a regression model representation
shinyServer(function(input, output) {
   
  # Fit regression line mpg Vs. wt
  
  require(stats)
  reg <- lm(mpg ~ wt, data = mtcars)
  coeff = coefficients(reg)
  
  ltext <- paste("mpg = ", round(coeff[2],1), " * wt + ", round(coeff[1],1))
  
  output$plot1 <- renderPlot({
    minX <- input$sliderX[1] 
    maxX <- input$sliderX[2] 
    minY <- input$sliderY[1] 
    maxY <- input$sliderY[2] 
    
    gp <- ggplot(mtcars, aes(wt, mpg, color=cyl)) +
      geom_point() +
      xlim(minX, maxX) +
      ylim(minY, maxY)
    
    gp + geom_abline(intercept = coeff[1], slope = coeff[2], col="green", size = 1.5) + geom_text(x = minX + 2, y = (minY + maxY)/2, label = ltext, size = 10)
  })
  
})
