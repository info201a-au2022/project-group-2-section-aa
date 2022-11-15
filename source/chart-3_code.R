library("tidyverse")
library("ggplot2")

trip_advisor_reviews <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/tripadvisor_hotel_reviews.csv")
View(trip_advisor_reviews)

data <- trip_advisor_reviews %>%
  group_by(Rating) %>%
  count() %>% 
  ungroup() %>% 
  mutate(perc = `n` / sum(`n`)) %>% 
  arrange(perc) %>%
  mutate(labels = scales::percent(perc))
View(data)

pie_chart <- ggplot(data, aes(x = "", y = perc, fill = Rating)) + 
  geom_col() +
  geom_label(aes(label=labels),
             color = "white",
             position = position_stack(vjust = 0.5),
             show.legend = TRUE) + 
  coord_polar(theta = "y")
pie_chart