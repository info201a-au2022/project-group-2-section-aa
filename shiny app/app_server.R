###SERVER

#packages
library(dplyr)
library(ggplot2)
library(tidyverse)
library(shiny)

<<<<<<< HEAD

review_from_1000 <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/Hotel%20Revires%20(1000%20hotels).csv")

review_from_booking <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/Hotels%20Reviews%20(booking.com).csv")

hr_booking <-  read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/Hotels%20Reviews%20(booking.com).csv")


new_data <- review_from_booking %>%
  filter(Number.of.reviewers >= 0) %>%
  group_by(name)%>%
  summarise(number_of_reviewers = max(Number.of.reviewers, na.rm= TRUE)) %>%
  arrange(desc(number_of_reviewers)) %>%
  slice(1:15)


server <- function(input, output) {
  
  
  #2nd page 
  output$selectZipCode <-renderUI({
    selectInput("ZipCode", "Choose a Zip Code:", choices = unique(review_from_booking$Zip.code))
  })
  
  scatterPlot <- reactive({
    plotData <- review_from_booking%>%
      filter(Zip.code %in% input$ZipCode)
    
    ggplot(plotData, aes(x= Number.of.reviewers, y= Overall.score)) +
      geom_point(aes(color = Zip.code)) +
      scale_x_discrete(guide = guide_axis(n.dodge = 2)) +
      labs(x = "Number of Reviewers",
           y= "Overall Score",
           title = "Hotel Reviews")
  })
  
  
  output$zipcodePlot <- renderPlotly({
    scatterPlot()
  })    
  
  #3rd page 
  output$scatter <- renderPlotly({
    
    # Store the title of the graph in a variable indicating the x/y variables
    title <- paste0("Hotel Review Dataset: ", input$x_var, " v.s.", input$y_var)
    
    
    # Create ggplot scatter
    p <- ggplot(review_from_booking) +
      geom_point(mapping = aes_string(x = input$x_var, y = input$y_var), 
                 size = input$size, 
                 color = input$color) +
      labs(x = input$x_var, y = input$y_var, title = title)
    p
  })

}
=======
#load dataset
>>>>>>> f8fd2c33aa01ec8122d88feb7b39f31bcda92dea
