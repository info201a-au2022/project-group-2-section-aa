#chart

library("tidyverse")
library("ggplot2")

new_data <- review_from_booking %>%
  filter(Number.of.reviewers > 100) %>%
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

