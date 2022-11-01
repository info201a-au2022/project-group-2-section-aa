# Analysis of Hotel Reviews and Their Impacts: Project Proposal
##### Code Name: 3 Hotel Connoisseurs
##### Date: Autumn 2022
##### Affiliation:
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington
#### Authors:
Hui-Yi Kao (hk825@uw.edu)<br>
Michelle Wu (mwu1@uw.edu)<br>
Nana Wang (xnanax51@uw.edu)
### Abstract
Our motivation for this project is to effectively and efficiently analyze hotel reviews from different booking sites and conclude how they affect hotels' future bookings. This question is important because reviews not only play a big part in deciding where to stay on a trip, but they also directly impact the reputation and popularity of the hotel itself. Thus, hotel reviews are highly influential, as they concurrently impact both the customers and the company. To address this question, we will analyze several datasets and carefully examine the reviews, from the history of the reviews to the ratings themselves. We will analyze a variety of other factors that constitute the reviews, such as cleanliness, facilities, staff, and more. We are concerned with the accuracy of the data because there might be some biases or outliers in these datasets that we want to avoid. To address this concern, we plan on applying various sources in our analysis and comparing the results between datasets with outliers and those without.
### Keywords
hotel reviews, rating spectrum, accuracy, quality of stay, popularity
### Introduction
When looking for a place to stay, people often pay attention to the hotel reviews left by previous guests on various booking platforms. These reviews not only allow people to gauge the quality of their stay, but they also prevent people from enduring unpleasant experiences. However, we often learn from the news that some reviews are inaccurate. Sometimes, we might be confused by extreme ratings and comments when reading through reviews. On the other hand, reviews are also another indicator of how well hotels are operating, which strongly influences the hotel’s reputation and popularity. As a result, we wanted to understand and analyze the accuracy of hotel reviews. In addition, we hope to discover different patterns of how highly-rated hotels operate their business. By avoiding misleading reviews and discovering patterns that successful businesses have in common, this will help us better understand the system and algorithms behind booking websites and the influence they have on the stakeholders of this project.
### Problem Domain
* **Project Framing**: In the 21st century, everyone can look up anything on the Internet. Nowadays, more and more people use online to find the information they need or to comment on the things they experience, which includes “hotel reviews.” In our project, we would like to dive into the “hotels’ world” to see how reviews and ratings play the roles in the performance of the hotels. We would like to know if reviews are trustworthy on those rating websites and to help future customers or hotel managers with their decision. In this project, we will first search and collect data from various websites, and then select datasets we want to utilize in our project. After that, we have to clean the data and find the research questions. We then analyze the data, address the problems, and make a conclusion.
* **Human Values**: Privacy, Calmness, Safety, and System Performance are the human values that we would like to explore with this dataset.
* **Direct Stakeholders**: The direct stakeholders of these datasets are hotels, hotel managers, and people who utilize the data. 
* **Indirect Stakeholders**: The indirect stakeholders are people who comment on the reviews and people who decide where to stay. 
* **Benefits**: People who benefit from the dataset are the direct stakeholders, which include hotels, hotel managers, and people who use the data. For example, hotels and hotel managers benefit from the information and data collected because they can further analyze the reviews and use the feedback given by customers to improve their services. Subsequently, people who access these datasets can use the information collected to conduct their own analyses. Besides the direct stakeholders, people who are deciding on where to stay for their next vacation also possess the advantage of getting better insights and details about the hotels they're considering.
* **Harms**: People who are not aware of the data being used might be harmed because people might want to keep their privacies and do not expect the information being viewed in such a large scale. Moreover, people who receive inaccurate information are likely to be hurt, since their expectations might be higher than actual circumstances.
* **Citations**: 
  1. https://nycdatascience.com/blog/r/hotel-bookings-data-analysis/
  2. https://www.datacamp.com/tutorial/machine-learning-hotel-reviews
  3. https://towardsdatascience.com/sentiment-analysis-for-hotel-reviews-3fa0c287d82e
  4. https://www.cloudbeds.com/articles/hotel-data-analytics/
  
### Research Questions
1. **_Do the reviews change over time? (from the same hotel)_** <br>
It’s crucial that we analyze the time frame of the reviews posted; not only will this reveal a possible pattern, but it will also help validate our findings and conclusion. A steady increase in reviews over time may indicate that the hotel is dedicated to improving the quality of customers’ stays, while a decreasing pattern implies that the hotel’s quality has also declined, which may be due to a number of reasons—changes in staff and management, outdated facilities, and more.

2. **_Are there any extreme reviews on opposite sides of the rating spectrum (i.e. one person gives a bad rating (1/5), another person gives an excellent one (5/5))?_** <br>
When analyzing a dataset, it’s important to conduct a comprehensive review of all the data, in our case, the reviews. If we notice an abnormally large amount of extreme reviews, especially within the same time frame, we’ll have to coordinate further research to explore the causes of such skewed ratings. An asymmetrical dataset can threaten the validity and credibility or imply that the hotel being analyzed is inconsistent with the quality of service that they’re providing.

3. **_Is there a particular aspect of the hotel that reviewers comment on the most (i.e. cleanliness, staff courtesy, facilities, management, etc.)?_** <br>
In relation to research question #2, an overwhelming number of reviews regarding a specific aspect of the hotel may allow us to discover specific patterns within the data that are particular to individual hotels. For example, several negative ratings that comment on the cleanliness may imply that the hotel is not taking customer complaints into account or not paying close attention to their reviews. Likewise, multiple positive reviews may indicate that the hotel takes the comfort and hygiene of guests seriously and/or quality of employee training is highly valued.

4. **_Are the reviews up-to-date?_** <br>
This is an important question to understand because it mainly determines the accuracy of reviews. People who want to book stays would feel more confident about their stays. Additionally, reviews provide fresh perspectives for future customers. If the reviews are outdated, people might encounter false and unrealistic information. Up-to-date reviews and a continuous increase in additional comments imply that hotels are improving or getting worse, so customers have better insights into the hotels.


### The Dataset
1. We collected three hotel review datasets from kaggle.com. These datasets contain information (e.g. city, country, comfort, cleanliness, staff, facilities, value for money, Wi-Fi, shuttle, and the number of reviewers) that help us analyze and address problems in our project. 

2. Dataset Stats
| Name                         | # of Observations | # of Variables | 
| ---------------------------- | ----------------- | -------------- |
| Hotels Reviews (booking.com) | 1,003             | 49             |
| Trip Advisor Hotel Reviews   | 20,491            | 2              |
| Hotel Reviews                | 1,000             | 19             |

3. Dataset Citations

   * _Hotel Reviews._ (2019, June 24). Kaggle. https://www.kaggle.com/datasets/datafiniti/hotel-reviews?select=7282_1.csv

   * _Hotels Reviews (booking.com)._ (2022, October 22). Kaggle. https://www.kaggle.com/datasets/thedevastator/sentiment-analyses-of-city-hotels

   * _Trip Advisor Hotel Reviews._ (2020, September 30). Kaggle. https://www.kaggle.com/datasets/andrewmvd/trip-advisor-hotel-reviews

4. Datafiniti is the data collector of our first dataset. The purpose of the first dataset is to collect information on hotels in different cities in the U.S., which helps us evaluate the correlation between reviews and locations. Subsequently, the second dataset is collected by Larxel, which mostly is about reviews and ratings on tripadvisor.com. Finally, The Devastator collected the third dataset, which mainly focused on booking.com. This dataset will be our major focus in the project because it records many categories of data we need for our project. Investors and large companies funded the Kaggle website, and data are uploaded by individuals. People who are likely to benefit from the datasets are hotel managers because they have to refer to these reviews and comments in order to make improvements. In addition, people like us who want to use this information are also benefactors, which we are able to utilize the data and get our work done in this case. We found this data by looking at the suggestions on the project design brief file. We do credit the source of the data at the “Reference” section of the project.

### Expected Implications
From the datasets we found, we expect to see how specific factors such as cleanliness, staff, comfort, Wi-Fi, etc. will affect the rating of the hotel. With this information, the designers, or the hotel managers in this case, can analyze the feedback they’ve received and use it to improve their services. They can use the details in the reviews left by guests to identify certain problem areas that should be prioritized for improvement. For technologists, we expect them to clean and sort the data so that it can be presented and shared with the public. This will help the public identify the process behind the reviews they see online. For policymakers, we expect them to update the policies on hotel review websites to ensure that there are no biases in the reviews. They may also use the information presented to modify or tighten policies regarding how hotel's operate their businesses.

### Limitations
While we have access to several tools, there are still some limitations we must consider prior to the project. One limitation is restricted access to the datasets we are using. Though they already provide enough information for us to utilize in our project, we do not know how the creators gathered and analyzed the data. As a result, this may skew some of our results and make it harder to locate biases within the dataset. Another limitation we may encounter regards our domain of knowledge. Throughout the past few weeks, we have learned a variety of different skills when conducting data analysis; however, we are not professionally experienced, so some of our methodology and analyses may be flawed. Lastly, we must consider the sample size of our data. Our datasets are mainly limited to hotels in the United States and only consist of about 1,000 different values. While this sample size is large enough for this project, we cannot conclude that our data represents the whole target population.

### References
_Hotel Reviews._ (2019, June 24). Kaggle. https://www.kaggle.com/datasets/datafiniti/hotel-reviews?select=7282_1.csv

_Hotels Reviews (booking.com)._ (2022, October 22). Kaggle. https://www.kaggle.com/datasets/thedevastator/sentiment-analyses-of-city-hotels

_Trip Advisor Hotel Reviews._ (2020, September 30). Kaggle. https://www.kaggle.com/datasets/andrewmvd/trip-advisor-hotel-reviews

### Appendix A: Questions
None at the moment.
