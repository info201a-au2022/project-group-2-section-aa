#chart

library("tidyverse")
library("ggplot2")

review_from_1000 <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/Hotel%20Revires%20(1000%20hotels).csv")

review_from_booking <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/Hotels%20Reviews%20(booking.com).csv")

new_data <- review_from_booking %>%
  filter(Number.of.reviewers >= 0) %>%
  group_by(name)%>%
  summarise(number_of_reviewers = max(Number.of.reviewers, na.rm= TRUE)) %>%
  arrange(desc(number_of_reviewers)) %>%
  slice(1:15)

View(new_data)


#chart - bar graph
bar_graph <- ggplot(new_data, aes(x= name, y=number_of_reviewers)) +
  geom_col() +
  coord_flip()+
  theme_classic()+
  labs(title = "Most Reviews for Hotels", 
       x= "Name", 
       y= "number of reviewers")
bar_graph

