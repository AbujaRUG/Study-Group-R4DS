library(palmerpenguins)
library(ggthemes)
library(tidyverse)

shopping_trends_data <- read_csv("data/shopping_trends.csv")

glimpse(shopping_trends_data)

glimpse(shopping_trends_data |> 
  mutate(across(is.character, as.factor)))

shopping_trends_data <- shopping_trends_data |> 
  mutate(across(is.character, as.factor))

shopping_trends_data |> 
  ggplot(aes(Gender, fill=Gender))+
  geom_bar()

shopping_trends_data |> 
  ggplot(aes(y=`Purchase Amount (USD)`, x=Gender))+
  geom_boxplot()

shopping_trends_data |> 
  ggplot(aes(x=`Purchase Amount (USD)`))+
  geom_histogram(bins = 20, color="white", fill="grey")

shopping_trends_data |> 
  ggplot(aes(x=`Purchase Amount (USD)`, fill=Gender))+
  geom_density(color="white")

