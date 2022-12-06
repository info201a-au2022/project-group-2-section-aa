
library(shiny)
library(ggplot2)


review_from_1000 <- read.csv("~/Documents/info201/assignments/project-group-2-section-aa/data/Hotel Revires (1000 hotels).csv")

review_from_booking <- read.csv("~/Documents/info201/assignments/project-group-2-section-aa/data/Hotels Reviews (booking.com).csv")


#inputs
unique(review_from_1000$province)

select_x_values <- colnames(review_from_booking)[c(-1,-2,-3)]

select_y_values <- colnames(review_from_booking)[c(-1,-2,-3)]

unique(review_from_1000$name)

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



#ui.R


#packages
library(dplyr)
library(ggplot2)
library(tidyverse)
library(shiny)

#load dataset


# Define a variable `intro_panel` for your first page. 
intro_panel <- tabPanel(
  "Introduction",
  
  fluidPage(
    h1("3 Hotel Connoisseurs"),
    strong("Authors: Hui-Yi Kao, Michelle Wu, Nana Wang"),
    br(),
    br(),
    img("", src = "https://image.freepik.com/free-vector/hotel-near-sea-ocean-resort-view-vector-illustration-flat-cartoon-hotel-building-beach-street-road-big-skyscrapers-town-landscape-font-view-cityscape-panorama_101884-679.jpg", height = 500, width = 1000),
    br(),
    h3("Abstract:"),
    p("Our motivation for this project is to effectively and efficiently analyze hotel reviews from different booking sites and conclude how they affect hotels' future bookings. 
      This question is important because reviews not only play a big part in deciding where to stay on a trip, but they also directly impact the reputation and popularity of the hotel itself. 
      Thus, hotel reviews are highly influential, as they concurrently impact both the customers and the company. 
      To address this question, we will analyze several datasets and carefully examine the reviews, from the history of the reviews to the ratings themselves. 
      We will analyze a variety of other factors that constitute the reviews, such as cleanliness, facilities, staff, and more. We are concerned with the accuracy of the data because there might be some biases or outliers in these datasets that we want to avoid. 
      To address this concern, we plan on applying various sources in our analysis and comparing the results between datasets with outliers and those without."),
    br(),
    h3("Introduction:"),
    p("When looking for a place to stay, people often pay attention to the hotel reviews left by previous guests on various booking platforms. 
      These reviews not only allow people to gauge the quality of their stay, but they also prevent people from enduring unpleasant experiences. 
      However, we often learn from the news that some reviews are inaccurate. Sometimes, we might be confused by extreme ratings and comments when reading through reviews. 
      On the other hand, reviews are also another indicator of how well hotels are operating, which strongly influences the hotel’s reputation and popularity. 
      As a result, we wanted to understand and analyze the accuracy of hotel reviews. In addition, we hope to discover different patterns of how highly-rated hotels operate their business. 
      By avoiding misleading reviews and discovering patterns that successful businesses have in common, this will help us better understand the system and algorithms behind booking websites and the influence they have on the stakeholders of this project."),
    br(),
    h3("Research Questions:"),
    strong("1. Is there a trend between overall hotel ratings and other rating factors (i.e. cleanliness, price, etc.)?"), 
    p("It's crucial that we analyze the correlations between overall hotel ratings and other rating factors. Not only will this reveal a possible pattern, but it will also help validate our findings and conclusion.
      A positive correlation indicate the positive effect that a specific rating factor can influence overall ratings. On the other hand, a negative corrrelation shows that a specific rating factor can have a negative effect on the overall rating"),
    br(),
    strong("2. What are the overall scores of hotels in categorized areas (that are filtered by zip codes)?"), 
    p("By posing this question, people who are looking for a stay are able to find the best area or location to book their stays.
      Moreover, by looking at the interactive visualization, we can detect the most frequent area for booking and further analyze whether some specific areas that have higher reviews.
      In addition to knowing the most frequent booking area, this visualization provides information on overall quality of the hotels in certain areas."),
    br(),
    strong("3. TO-DO?"),
    p(""),
    br(),
    h3("Datasets:"), 
    p("We collected three hotel review datasets from kaggle.com. 
      These datasets contain information (e.g. comfort, cleanliness, staff, facilities, value for money, Wi-Fi, shuttle, the number of reviewers, etc.) that help us analyze and address problems in our project."),
    br(),
    p("1. A list of hotel reviews from booking.com includes 1,003 observations and 49 variables."),
    p("2. A list of hotel reviews from booking.com contains 20,491 observations and 2 variables."),
    p("3. A list of hotel reviews consists of 1,000 observations and 19 variables."),
    br(),
    p("Datafiniti is the data collector of our first dataset. 
      The purpose of the first dataset is to collect information on hotels in different cities in the U.S., which helps us evaluate the correlation between reviews and locations. 
      Subsequently, the second dataset is collected by Larxel, which mostly is about reviews and ratings on tripadvisor.com. Finally, The Devastator collected the third dataset, which mainly focused on booking.com. 
      This dataset will be our major focus in the project because it records many categories of data we need for our project. Investors and large companies funded the Kaggle website, and data are uploaded by individuals. 
      People who are likely to benefit from the datasets are hotel managers because they have to refer to these reviews and comments in order to make improvements. 
      In addition, people like us who want to use this information are also benefactors, which we are able to utilize the data and get our work done in this case. We found this data by looking at the suggestions on the project design brief file. 
      We do credit the source of the data at the “Reference” section of the project.")
  )
)

# Define a variable `inter_vis_i` for your first page. 
inter_vis_i <- tabPanel(
  "Factors of Hotels",
  
  # A `titlePanel()` with the text "Income growth 1980-2014"
  titlePanel("Hotel Reviews Factors"),
  
  # A `sidebarLayout()` to create two columns.
  # The sidebar layout will contain elements
  sidebarLayout(
    sidebarPanel(
      x_input, 
      y_input,
      color_input,
      size_input, 
    ),
  # Plot the output with the name "scatter" (defined in `app_server.R`)
    mainPanel(
      plotlyOutput("scatter"),
      br(),
      p("In this scatterplot, we are able to select variables to analysis the correlations between all kinds of factors that may affect overall ratings.
        For example, when selecting the overall score and the cleanliness, we discover a strong positive correlation between these two variable, indicating that cleanliness is a major factor that impacts the overall score of a hotel.")
    )
  )
)

# Define a variable `inter_vis_ii` for your first page. 
inter_vis_ii <- tabPanel(
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
      textOutput("sampleText"),
      br(),
      p("In this bar plot, the side bar allows us to select the zip code and find locations that have relative high level of ratings.
        By selecting zip codes, we can find locations of hotels with their names on the chart that have high ratings and conclude that hotels in such locations have higher qualities compared to others.
        This chart helps people who need a stay to have a clear sense of what are some of the top ranked hotels in certain areas that they desire to stay for their travels.")
    )
  )
)

# Define a variable `inter_vis_iii` for your first page. 
inter_vis_iii <- tabPanel(
  "Interactive visualization",
  titlePanel(""),
  p("")
)

# Define a variable `summary_panel` for your first page. 
summary_panel <- tabPanel(
  "Summary",
  
  titlePanel("Summary Takeaways"),
  h3("First Takeaway"),
  p("Our first takeaway will focus on the first interactive scatterplot. As we can see in the scatterplot, our group analyze the correlation between all possible factors that might affect the ratings."),
  p("The following are the most significant findings of our datasets:"),
  p("1. There is a positive and strong correlation between the overall scores and the cleanliness of hotels."),
  p("2. There is also a positive correlation between the overall scores and the comfort of the hotels."),
  p("3. There is also a positive correlation between the overall scores and the facilities of the hotels."),
  p("4. There is also a positive correlation between the overall scores and the staff of the hotels."),
  p("5. There is also a positive correlation between the overall scores and the price of the hotels."),
  p("These five points are the variables that have high correlation with the overall scores of hotels in our datasets.
    We conclude that these are factors that mainly affect the reviews of hotels. If hotels are aiming to have higher ratings, they should work on improving those services.
    Moreover, we also discover some less important factors that do not have strong correlations with the hotel reviews, such as fitness center, private parking, etc."),
  br(),
  h3("Second Takeaway"),
  p("Our second takeaway will conclude the second interactive bar chart. The chart shows the overall score of hotels by their zip code."),
  p("This chart helps the viewers get better grips on some highly ranked hotels if they have already decided areas they plan on staying.
    Besides that, our group recognize some areas that have plenty of hotels that have good hospitality and reviews, including West Hollywood, Santa Monica, etc., 
    and we find out that most hotels that have high reviews are mostly located in tourist areas."),
  br(),
  h3("Third Takeaway"),
  p("")
)

# Define a variable `report_panel` for your first page. 
report_panel <- tabPanel(
  "Report",
  
  titlePanel("Key Goals"),
  
  p("")
)

#Define a ui variable
ui <- navbarPage(
  "Analysis of Hotel Reviews and Their Impacts",
  intro_panel,
  inter_vis_i,
  inter_vis_ii,
  inter_vis_iii,
  summary_panel,
  report_panel
)

