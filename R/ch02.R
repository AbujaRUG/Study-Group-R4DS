## 2  Workflow: basics ----------------------------------

### 2.1 Coding basics -----------------------------------

1 / 200 * 30

(59 + 73 + 2) / 3

sin(pi / 2)

mean(c(1,23,4,54.9))

# create new objects with the assignment operator <-:
  
x <- 3 * 4

x

# combine multiple elements into a vector with c():
  
primes <- c(2, 3, 5, 7, 11, 13)

# apply basic arithmetic on vectors which is applied to every element of of the vector:
  
primes * 2

primes

primes - 1

# assignment statements have the same form:
# this is just an example of a named object
object_name <- "john"

### 2.2 Comments -------------------------------------

# Comments can be helpful for briefly describing what the following code does.

# create vector of primes numbers
primes <- c(2, 3, 5, 7, 11, 13)

# multiply primes by 2
primes * 2

### 2.3 What’s in a name? ----------------------------------
# 1. Object names must start with a letter 
# and can only contain 
#  - letters, 
#  - numbers, _, and .. You want your object names to be descriptive, so you’ll need to adopt a convention for multiple words. We recommend snake_case, where you separate lowercase words with _.

i_use_snake_case
otherPeopleUseCamelCase
some.people.use.periods
And_aFew.People_RENOUNCEconvention

x

this_is_a_really_long_name <- 2.5

# Another assignment

r_rocks <- 2^3

r_rock
#> Error: object 'r_rock' not found
R_rocks
#> Error: object 'R_rocks' not found
r_rocks

# 2.4 Calling functions

# function_name(argument1 = value1, argument2 = value2, ...)
empty_vector <- c()

seq()
?seq

seq(from = 1, to = 10)

# We often omit the names of the first several arguments in function calls, 
# so we can rewrite this as follows:
  
seq(1, 10)


x <- "hello world"

# handy help from R when you omit something
x <- "hello"

# Exercises

my_variable <- 10
my_variable


library(tidyverse)
?ggplot

ggplot(mpg) + 
  geom_point(aes(displ, hwy)) +
  geom_smooth(aes(displ, hwy), 
              method = lm, se=FALSE)
  

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)


my_bar_plot <- ggplot(mpg, aes(x = class)) +
  geom_bar()
my_scatter_plot <- ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave(filename = "mpg-plot.png", plot = my_bar_plot)



























