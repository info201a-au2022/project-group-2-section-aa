###SERVER

#packages
library(dplyr)
library(ggplot2)
library(tidyverse)
library(shiny)
library(plotly)


review_from_1000 <- read.csv("~/Documents/info201/assignments/project-group-2-section-aa/data/Hotel Revires (1000 hotels).csv")

review_from_booking <- read.csv("~/Documents/info201/assignments/project-group-2-section-aa/data/Hotels Reviews (booking.com).csv")


new_data <- review_from_booking %>%
  filter(Number.of.reviewers >= 0) %>%
  group_by(name)%>%
  summarise(number_of_reviewers = max(Number.of.reviewers, na.rm= TRUE)) %>%
  arrange(desc(number_of_reviewers)) %>%
  slice(1:30)


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

<<<<<<< HEAD

=======
>>>>>>> 3e43cc6d087bdc9e20780453ab6cb07acbeb4232
