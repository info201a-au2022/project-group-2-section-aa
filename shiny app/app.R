# Load libraries so they are available
library(shiny)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(shiny)
library(plotly)
library(maps)
library(leaflet)
#library(zipcodeR)

# Use source() to execute the `app_ui.R` and `app_server.R` files. These will
# define the UI value and server function respectively.
source("app_ui.R")
source("app_server.R")

# Create a new `shinyApp()` using the loaded `ui` and `server` variables
shinyApp(ui = ui, server = server)