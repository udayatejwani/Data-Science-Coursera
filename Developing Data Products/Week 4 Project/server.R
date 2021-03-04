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
  
   output$plot1 <- renderPlot({
     
    minX <- input$sliderX[1] 
    maxX <- input$sliderX[2] 
    minY <- input$sliderY[1] 
    maxY <- input$sliderY[2]

    # Fit regression line mpg Vs. wt
    testdata <- subset(mtcars, subset=(mpg > minY & mpg < maxY & wt > minX & wt < maxX ))
    require(stats)
    reg <- lm(mpg ~ wt, data = testdata)
    coeff = coefficients(reg)
    
    ltext <- paste("mpg = ", round(coeff[2],1), " * wt + ", round(coeff[1],1))
    
    cols <- c("8" = "red", "7" = "pink", "6" = "blue", "5" = "green", "4" = "yellow")
    
    gp <- ggplot(mtcars, aes(wt, mpg, colour = factor(cyl), fill = factor(cyl))) +
      geom_point(shape = 21, alpha = 0.5, size = 2) + scale_color_manual(values = cols, breaks = c("4", "5", "6", "7", "8"), aesthetics = c("colour","fill")) +
      xlim(minX, maxX) +
      ylim(minY, maxY) 
     
    gp + geom_abline(intercept = coeff[1], slope = coeff[2], col="green", size = 1.5) + 
    geom_text(x = minX + 0.8, y = minY, label = ltext, size = 5, color = "black")
  })
  
})
