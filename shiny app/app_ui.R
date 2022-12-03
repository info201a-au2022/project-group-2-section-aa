library(shiny)
library(ggplot2)


review_from_1000 <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/Hotel%20Revires%20(1000%20hotels).csv")

review_from_booking <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/Hotels%20Reviews%20(booking.com).csv")



unique(review_from_1000$province)

select_x_values <- colnames(review_from_booking)[c(-1,-2)]

select_y_values <- colnames(review_from_booking)[c(-1,-2)]

select_country <- unique(review_from_booking$country)

x_input <- selectInput(
  "x_var",
  label = "X Variable",
  choices = select_x_values,
  selected = "Overall.score"
)


y_input <- selectInput(
  "y_var",
  label = "Y Variable",
  choices = select_y_values,
  selected = "Cleanliness"
)


color_input <- selectInput(
  "color",
  label = "Color",
  choices = list("Red" = "red", "Blue" = "blue", "Purple" = "purple", "Black" = "black")
)


size_input <- sliderInput(
  "size",
  label = "Size of point", min = 1, max = 10, value = 5
)



intro_page <- tabPanel(
  "Introduction", 
  h1("Final Project"), 
  p("In this assignment, we are fousing on hotel reviews")
)

second_page <- tabPanel(
  "Factors of Hotels",
  
  # A `titlePanel()` with the text "Income growth 1980-2014"
  titlePanel("Hotel Reviews Factors"),
  
  # A `sidebarLayout()` to create two columns.
  # The sidebar layout will contain elements
  
  
  x_input, 
  
  y_input,
  
  color_input,
  
  size_input, 
  
  # Plot the output with the name "scatter" (defined in `app_server.R`)
  plotlyOutput("scatter")
)

third_page <- tabPanel(
  "Zip Codes VS Hotels",
  
  # A `titlePanel()` with the text "Income growth 1980-2014"
  titlePanel("Hotel Reviews"),
  
  # A `sidebarLayout()` to create two columns.
  # The sidebar layout will contain elements:
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectZipCode")
    ),
    mainPanel(
      plotlyOutput("zipcodePlot"),
      textOutput("sampleText")
    )
  )
)




  
  

ui <- navbarPage(
  "Hotels",
  intro_page,
  second_page,
  third_page,
)

