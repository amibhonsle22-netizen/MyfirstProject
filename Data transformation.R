#Data Wrongling

install.packages("nycflights13")
install.packages("dplyr")
library(nycflights13)
library(dplyr)
flights
glimpse(flights)
library(tidyverse)
install.packages("tidyverse")

flights |>
  filter(dep_delay > 120)

# Flights that departed on January 1
flights |>
  filter(month == 1 & day == 1)

flights |>
  filter(month == 1 | month == 2)
