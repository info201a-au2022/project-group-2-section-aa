###SERVER

#packages
library(dplyr)
library(ggplot2)
library(tidyverse)
library(shiny)

#load dataset


# Define a variable `intro_panel` for your first page. 
intro_panel <- tabPanel(
  "Introduction",
  
  titlePanel("Introduction"),
  
  p(""),
  
  p('Click on the Widget tabs to see an interactive diagram')
)

# Define a variable `inter_vis_i` for your first page. 
inter_vis_i <- tabPanel(
  "Interactive visualization",
  
  titlePanel(""),
  
  p("")
)


# Define a variable `inter_vis_ii` for your first page. 
inter_vis_ii <- tabPanel(
  "Interactive visualization",
  
  titlePanel(""),
  
  p("")
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
  
  titlePanel("Summary"),
  
  p(""),
  
  p('')
)

# Define a variable `report_panel` for your first page. 
report_panel <- tabPanel(
  "Report Page",
  
  titlePanel("Key Goals"),
  
  p(""),
  
  p('')
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