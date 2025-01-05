## map functions overview
## using map_df with read_csv

library(tidyverse)

sqrt(100)
1:10 %>%
  map(.x = ., .f = sqrt) %>%
  unlist()

 # instead of unlist, can use map_dbl
1:10 %>%
  map_dbl(.x = ., .f = sqrt)

 # do not really need to call .x parameter
1:10 %>%
  map_dbl(sqrt)

 # could force into a char vector (but might throw a warning)
1:10 %>%
  map_chr(sqrt)

## using map_df()
temp_df <- list.files(path = "Zip_files", pattern = ".csv$", full.names = T) %>%
  map_df(.x = ., .f = read_csv, col_names = F, n_max = 500)


######################## more on map functions 

## alt way to incorporate function parameters 
 # use a tilda before the function 
temp_df2 <- list.files(path = "Zip_files", pattern = ".csv$", full.names = T) %>%
  map_df(~read_csv(file = ., col_names = F, n_max = 500))


## on functions in map functions
rnorm(n = 10, mean = 5, sd = 1)

 # get 10 sets of 20 numbers from normal distribution 
1:10 %>%
  map(rnorm, n = 20)

1:2 %>%
  map(~rnorm(n = 20, mean = 10, sd = 2))

## maps on maps -- not clear why ~ is not needed for second map func

1:2 %>%
  map(~rnorm(n = 20, mean = 10, sd = 2)) %>%
  map_dbl(mean)

 # can replace parameters with the .x values 
1:2 %>%
  map(~rnorm(n = 20, mean = ., sd = 2)) %>%
  map_dbl(mean)

# can replace parameters with the .x values 
1:2 %>%
  map(~rnorm(n = 20, mean = 10, sd = .)) %>%
  map_dbl(sd)

