library(dplyr)

hr_booking_summary <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-2-section-aa/main/data/Hotels%20Reviews%20(booking.com).csv")
View(hr_booking_summary)

summary_info <- list()
summary_info$Number.of.reviewers <- hr_booking_summary %>%
  filter(Number.of.reviewers == max(Number.of.reviewers, na.rm = T)) %>%
  select(name, Number.of.reviewers)
summary_info$Overall.score <- hr_booking_summary %>%
  filter(Overall.score == max(Overall.score, na.rm = T)) %>%
  select(name, Overall.score)
summary_info$Cleanliness <- hr_booking_summary %>%
  filter(Cleanliness == max(Cleanliness, na.rm = T)) %>%
  select(name, Cleanliness)
View(summary_info)