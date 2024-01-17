library(palmerpenguins)
library(ggthemes)
library(tidyverse)

palmerpenguins::penguins

penguin_df <- penguins

dplyr::glimpse(penguin_df)

# visualization

?ggplot2::ggplot()


ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g))

penguins |> 
  ggplot(mapping = aes(x = flipper_length_mm, y = body_mass_g))

ggplot(
  data = penguins
)+
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()

# Adding aesthetics and layers

unique(penguins$species)


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point()+
  geom_smooth(method = "lm")


gg <- ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, 
                y = body_mass_g, 
                color = species)
) +
  geom_point() +
  geom_smooth(method = "lm")

ggsave(filename = "viz/my_plot.png",plot = gg,
       width = 250,height = 250, units = "px")


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm")


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm")


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) + 
  scale_color_colorblind()


# Exercises
# How many rows are in penguins? How many columns?
#   
# What does the bill_depth_mm variable in the penguins data frame describe? Read the help for ?penguins to find out.
# 
# Make a scatterplot of bill_depth_mm vs. bill_length_mm. 
# That is, make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm on the x-axis. 
# Describe the relationship between these two variables.

ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) +
  geom_point() 


# What happens if you make a scatterplot of species vs. bill_depth_mm? 
# What might be a better choice of geom?

penguins |> count(species) |> ggplot(
  mapping = aes(x=species, y=n)
) +
  geom_bar(stat = "identity")


  ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm)
) +
  geom_boxplot()
 
# Why does the following give an error and how would you fix it?
#   
  ggplot(data = penguins) +
  geom_point()

# What does the na.rm argument do in geom_point()? 
# What is the default value of the argument? 
# Create a scatterplot where you successfully use this argument 
# set to TRUE.
ggplot(
    data = penguins,
    mapping = aes(x = bill_length_mm, y = bill_depth_mm)
  ) +
    geom_point(na.rm = TRUE) 
   
# Add the following caption to the plot you made in the previous exercise: “Data come from the palmerpenguins package.” Hint: Take a look at the documentation for labs().

ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) +
  geom_point(aes(),na.rm = TRUE) 
# Recreate the following visualization. What aesthetic should bill_depth_mm be mapped to?
# And should it be mapped at the global level or at the geom level?

# Visualizing distributions

## A categorical variable
glimpse(penguins)
ggplot(penguins, aes(x = species)) +
  geom_bar()

## reordering categorical variable
ggplot(penguins, aes(x = fct_infreq(species))) +
  geom_bar()

## A numerical variable (or quantitative)
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(color="white", bins = 15, binwidth = 400)

# always explore a variety of binwidths when working with histograms, 
# as different binwidths can reveal different patterns.
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 20)
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 2000)

## density plot - It shows fewer details than a histogram 
# but can make it easier to quickly glean the shape of the distribution, particularly with respect to modes and skewness.
ggplot(penguins, aes(x = body_mass_g)) +
  geom_density()

# Exercises
# Make a bar plot of species of penguins, where you assign species to the y aesthetic. 
# How is this plot different?
penguins |> 
  ggplot(aes(y=species))+
  geom_bar()

# How are the following two plots different? 
# Which aesthetic, color or fill, is more useful for changing the color of bars?
  
ggplot(penguins, aes(x = species)) +
geom_bar(color = "red")

ggplot(penguins, aes(x = species)) +
geom_bar(fill = "red")

# What does the bins argument in geom_histogram() do?
# The bins argument in geom_histogram() from the ggplot2 package 
# allows you to specify the number of bins or bars to use in the histogram. A bin is a range of values that is grouped together as a single category on the X-axis of the histogram. The bins argument controls how many categories or groups are created and how wide each bin is. 

# Make a histogram of the carat variable in the diamonds dataset that is available 
# when you load the tidyverse package. Experiment with different binwidths. What binwidth reveals the most interesting patterns?
diamonds |> 
  ggplot(aes(x=carat))+
  geom_histogram(binwidth = 10)

# Visualizing relationships

##  A numerical and a categorical variable
ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()

# Alternatively, we can make density plots with geom_density().
ggplot(penguins, aes(x = body_mass_g, color = species)) +
  geom_density(linewidth = 0.75)

# map species to both color and fill aesthetics and use the alpha aesthetic to add transparency to the filled density curves
ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
  geom_density(alpha = 0.5)

## Two categorical variables
# We can use stacked bar plots to visualize the relationship between two categorical variables.
# plot shows the frequencies of each species of penguins on each island
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar()

# a relative frequency plot created by setting position = "fill" in the geom, is more useful for comparing species distributions across islands since it’s not affected by the unequal numbers of penguins across the islands. 
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")

## Two numerical variables
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

# Three or more variables
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = island))

# facet plot by a single variable
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island)

# Saving your plots
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()
ggsave(filename = "penguin-plot.png")

