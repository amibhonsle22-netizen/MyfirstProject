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

flights |>
  filter(month == 2 | day == 1)

flights |>
  filter(month == 2 & day == 1)

# A shorter way to select flights that departed in January or February
flights |>
  filter(month %in% c(1, 2)) ->C

flights |>
  filter(month %in% 1) ->A
flights |>
  filter(month %in% 2) ->B

dim(C)
dim(B)
dim(A)

flights |>
  arrange(year, month, day, dep_time)

flights |>
  arrange(desc(dep_delay))

#distinct()
# Remove duplicate rows, if any
flights |>
  distinct(origin, dest)

#mutate
flights |>
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60,
    .before = 1
  )
