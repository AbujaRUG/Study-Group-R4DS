# install.packages("nycflights13")
library(nycflights13)
library(tidyverse)

# dplyr package

flights
glimpse(flights)

# dplyr basics
flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )

# Rows - filter()
# flights with departure delay greater than 120minutes
flights |> 
  filter(dep_delay > 120)

# Flights that departed on January 1
flights |> 
  filter(month == 1 & day == 1)

# Flights that departed in January or February
flights |> 
  filter(month == 1 | month == 2)

# There’s a useful shortcut when you’re combining | and ==: %in%.
# It keeps rows where the variable equals one of the values on the right:
# A shorter way to select flights that departed in January or February
flights |> 
  filter(month %in% c(1, 2))

# When you run filter() dplyr executes the filtering operation, creating a new data frame, and then prints it.
# To save the result, you need to use the assignment operator, <-:
jan1 <- flights |> 
  filter(month == 1 & day == 1)

# Common mistakes
# 1.
flights |> 
  filter(month = 1)
# 2.
flights |> 
  filter(month == 1 | 2)

# arrange()
flights |> 
  arrange(year, month, day, dep_time)

# use desc() on a column inside of arrange() to re-order the data frame 
# based on that column in descending (big-to-small) order
flights |> 
  arrange(desc(dep_delay))

# distinct()
# Remove duplicate rows, if any
flights |> 
  distinct()

# Find all unique origin and destination pairs
flights |> 
  distinct(origin, dest)

# Alternatively, if you want to the keep other columns when filtering 
# for unique rows, you can use the .keep_all = TRUE option.
# It’s not a coincidence that all of these distinct flights are on January 1:
# distinct() will find the first occurrence of a unique row in the dataset 
# and discard the rest.
flights |> 
  distinct(origin, dest, .keep_all = TRUE)

# find the number of occurrences instead, you’re better off swapping distinct() 
# for count(), and with the sort = TRUE argument you can arrange them in descending 
# order of number of occurrences.
flights |>
  count(origin, dest, sort = TRUE)

Exercises
In a single pipeline for each condition, find all flights that meet the condition:
  
  Had an arrival delay of two or more hours
Flew to Houston (IAH or HOU)
Were operated by United, American, or Delta
Departed in summer (July, August, and September)
Arrived more than two hours late, but didn’t leave late
Were delayed by at least an hour, but made up over 30 minutes in flight
Sort flights to find the flights with longest departure delays. Find the flights that left earliest in the morning.

Sort flights to find the fastest flights. (Hint: Try including a math calculation inside of your function.)

Was there a flight on every day of 2013?
  
  Which flights traveled the farthest distance? Which traveled the least distance?
  
  Does it matter what order you used filter() and arrange() if you’re using both? Why/why not? Think about the results and how much work the functions would have to do.
























