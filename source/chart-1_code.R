library(tidyverse)
library(ggplot2)

hr_booking <-  read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/Hotels%20Reviews%20(booking.com).csv")
View(hr_booking)

overall_price_corr <- ggplot(hr_booking) +
  geom_point(mapping = aes(x = Overall.score, y = Value.for.money)) +
  labs(x = "Overall Score", y = "Price", title = "Correlation Between Overall Score and Price") 
overall_price_corr