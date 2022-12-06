###SERVER

#packages
library(dplyr)
library(ggplot2)
library(tidyverse)
library(shiny)
library(plotly)
library(ggrepel)
library(maps)



review_from_1000 <- read.csv("~/Documents/info201/assignments/project-group-2-section-aa/data/Hotel Revires (1000 hotels).csv")

review_from_booking <- read.csv("~/Documents/info201/assignments/project-group-2-section-aa/data/Hotels Reviews (booking.com).csv")


 


server <- function(input, output) {
  

  #1st visualization
  
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

  
  #2nd visualization 
  output$selectZipCode <-renderUI({
    selectInput("ZipCode", "Choose a Zip Code:", choices = unique(review_from_booking$Zip.code))
  })
  
  scatterPlot <- reactive({
    plotData <- review_from_booking%>%
      filter(Zip.code %in% input$ZipCode) %>%
      filter(Overall.score >0) %>%
      filter(Number.of.reviewers >100)
    
    ggplot(plotData, aes(x= name, y= Overall.score, reviews = Number.of.reviewers)) +
      geom_bar(stat = "identity") +
      coord_flip() +
      scale_x_discrete(guide = guide_axis(n.dodge = 6)) +
      labs(x = "Names of Hotels",
           y= "Overall Score",
           title = "Hotels VS Overall Score")
  })
  
  
  output$zipcodePlot <- renderPlotly({
    scatterPlot()
  })    
  
  

 

  #3rd visualization
  
  output$map <- renderPlotly({
    
  })


}


