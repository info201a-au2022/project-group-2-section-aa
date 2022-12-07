library(shiny)
library(ggplot2)
library(plotly)


#review_from_1000 <- read.csv("../data/Hotel Revires (1000 hotels).csv")

#review_from_booking <- read.csv("../data/Hotels Reviews (booking.com).csv")

review_from_1000 <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/Hotel%20Revires%20(1000%20hotels).csv")

review_from_booking <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/Hotels%20Reviews%20(booking.com).csv")

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
    h3("Problem Domain"),
    p("Hotel ratings have become a prominent deciding factor in guest bookings. They not only provide insight on the hotel and its accommodations, but also provide hotel owners with feedback that heavily impacts their business. 
      In this project, we hope to explore different factors that contribute to the overall ratings of hotels, which is later explained in our findings. In fact, data analytics in hospitality provide valuable insight on how to increase revenue, save costs, streamline hotel operations, and improve guest satisfaction [1]. 
      The reviews left by guests based on their experience contribute to KPIs, which are one of the most considered factors in determining a hotel’s quality of stay. KPIs can include average ratings from reviews and surveys, departmental ratings, review or survey volume, and rankings from booking websites such as Booking.com [1]. 
      Through our analysis of different factors that could potentially contribute to a hotel’s KPI such as cleanliness, staff, wifi, free parking, and such, we can extrapolate findings and differences between highly-rated hotels and their competitors. 
      The use of hotel ratings to analyze a hotel’s quality is based on a data mining technique called sentiment mining. Sentiment mining, or opinion mining, is a technique that could extract emotions of a given text [2]. 
      This technique is most commonly present in reviews, as they are based off individual guest experiences. We hope that our careful analysis of hotel reviews and the factors that contribute to them will be able to provide greater insight on how hotel reviews can impact a guest’s booking choice, as well as the impact they have on hospitality businesses."),
    strong("References"),
    p("[1] https://www.cloudbeds.com/articles/hotel-data-analytics/"),
    p("[2] https://towardsdatascience.com/sentiment-analysis-for-hotel-reviews-3fa0c287d82e"),
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
    strong("3. Is there a correlation between the highest-rated hotels and their locations and vice versa with the lowest-rated hotels and their locations?"),
    p("This research question is important because it can reveal certain patterns and trends with hotel ratings and location. For people looking for a place to stay, location is often the first
      and primary factor that is considered, since everyone prioritizes safety and efficiency when staying outside in a foreign place. By looking at the interactive map, we can deduce certain correlations
      between the locations of the highest and lowest rated hotels."),
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
  "Interactive Map Visualization",
  titlePanel("Interactive Map of Hotel Ratings"),
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectRating")
    ),
    mainPanel(
      leafletOutput("map"),
      br(),
      p("Based on the user's selection, this figure presents a map of hotels rated by the user. From this visualization, we can choose to display the highest-rated hotels, as well as the lowest-rated.
        This can be especially useful in determining trends and correlations between the location of a hotel and its overall rating.")
    )
  )
)

# Define a variable `summary_panel` for your first page. 
summary_panel <- tabPanel(
  "Summary",
  
  titlePanel("Summary Takeaways"),
  h3("First Takeaway"),
  p("Our first takeaway will focus on the first interactive scatterplot. As we can see in the scatterplot, our group analyze the correlation between all possible factors that might affect the ratings."),
  p("The following are the most significant findings of our datasets, that being said these factors have strong and positive correlations with the overall scores:"),
  p("1. The cleanliness of hotels."),
  p("2. The comfort of the hotels."),
  p("3. The facilities of the hotels."),
  p("4. The staff of the hotels."),
  p("5. The price of the hotels."),
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
  p("From the visualization on the interactive map page, we observed that the U.S. has the most 5-start rated hotels compared to any other country.
    This visualization not only displays the locations of the highest-rated hotels, but it also provides insight as to why they're located where they are.
    One possibility for the density of highly-rated hotels in the U.S. could be tourism, as the U.S. is one of the most visited places in the world.
    It's also important to consider the implications of the dataset used however, as this density could also be caused by the majority of data collected
    within the U.S.")
)

# Define a variable `report_panel` for your first page. 
report_panel <- tabPanel(
  "Report",
  
  titlePanel("Report Page"),
  br(),
  p("Affiliation: INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  p("Date: Autumn 2022"),
  p("Authors: Hui-Yi Kao, Michelle Wu, Nana Wang"),
  p("Keywords: Hotel reviews, Rating spectrum, Accuracy, Quality of Stay"),
  h3("Limitations"),
  p("While we have access to several tools, there are still some limitations we must consider prior to the project. One limitation is restricted access to the datasets we are using. 
    Though they already provide enough information for us to utilize in our project, we do not know how the creators gathered and analyzed the data. 
    As a result, this may skew some of our results and make it harder to locate biases within the dataset. Another limitation we may encounter regards our domain of knowledge. 
    Throughout the quarter, we have learned a variety of different skills when conducting data analysis; however, we are not professionally experienced, so some of our methodology and analyses may be flawed. 
    Lastly, we must consider the sample size of our data. Our datasets are mainly limited to hotels in the United States. 
    While this sample size is large enough for this project, some inforamtion is missing in our dataset, and therefore, we cannot cannot conclude that our data represents the whole target population."),
  br(),
  h3("Findings: Responses to Research Questions"),
  strong("1. Is there a trend between overall hotel ratings and other rating factors (i.e. cleanliness, price, etc.)?"),
  p("Cleanliness, comfort, facilities, staff and price are the variables that have high correlations with the overall scores of hotels in our datasets. 
    If hotels are aiming to have higher ratings, they should work on improving those services. 
    Moreover, we also discover some less important factors that do not have strong correlations with the hotel reviews, such as fitness centers, private parking, etc."),
  strong("2. What are the overall scores of hotels in categorized areas (that are filtered by zip codes)?"),
  p("In response to our research question #2, our interactive chart helps the viewers get better grips on some highly ranked hotels if they have already decided on areas they plan on staying. 
    Besides that, our group recognizes some areas that have plenty of hotels that have good hospitality and reviews, and we find out that most hotels that have high reviews are mostly located in tourist areas."),
  strong("3. Is there a correlation between the highest-rated hotels and their locations and vice versa with the lowest-rated hotels and their locations?"),
  p("From the visualization on the interactive map page, we observed that the U.S. has the most 5-star rated hotels compared to any other country. 
    This visualization not only displays the locations of the highest-rated hotels, but it also provides insight as to why they're located where they are. 
    One possibility for the density of highly-rated hotels in the U.S. could be tourism; however, as this density could also be caused by the majority of data collected within the U.S."),
  br(),
  h3("Discussions"),
  p("We found several patterns of hotels that have highly rated scores, which we believe our project may help future predictions of hotel ratings. 
    Moreover, this report allows hotels to improve their performance based on our observations in our datasets. 
    That being said, if hotels desire to improve their overall ratings and want to have more customers, our group suggests first working on improving the five factors, as mentioned in finding #1."),
  p("Additionally, people who have not operated hotels but planning or have the desire to do so should consider operating in popular tourist areas. 
    As concluded in our finding #2, those areas tend to have more reviews and higher ratings, and it is always a need to book a stay while traveling and touring. 
    Therefore, it is profitable to have hotels open in some tourist areas."),
  p("Last but not least, we observed that the U.S. has the most 5-star rated hotels compared to any other country; however, we detected that the majority of data are collected within the U.S., which bias may present in our conclusion. 
    The implication of our third finding is that countries that are tourist-oriented will most likely have better hotel qualities, and people will have more options in selecting places for their stays."),
  br(),
  h3("Conclusion"),
  p("Hotel reviews play a big role in helping people decide where to stay when traveling. It is by far one of the most important factors of consideration, hence, why we decided to analyze and provide interactive visualizations that accurately depict particular trends and correlations between what ultimately contributes to a hotel’s overall rating. 
    Some factors that our visualizations allow us to analyze include but are not limited to hotel cleanliness, comfort, staff, free parking, and more. 
    Oftentimes, the quality of a guest’s stay is determined by the availability of basic necessities, which is why such factors are important. We also placed emphasis on a hotel’s location, since safety, efficiency, and close proximity to the center of a city are also highly prioritized. 
    We hope that the creation of our project allows users to more accurately determine where to stay the next time they go on vacation or just more precisely analyze the factors that contribute to the overall ratings of hotels around the world. "),
  br(),
  h3("References"),
  p("1. Hotel Reviews. (2019, June 24). Kaggle. https://www.kaggle.com/datasets/datafiniti/hotel-reviews?select=7282_1.csv"),
  p("2. Hotels Reviews (booking.com). (2022, October 22). Kaggle. https://www.kaggle.com/datasets/thedevastator/sentiment-analyses-of-city-hotels"),
  p("3. Trip Advisor Hotel Reviews. (2020, September 30). Kaggle. https://www.kaggle.com/datasets/andrewmvd/trip-advisor-hotel-reviews")
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

