## copying files between folders
## creating a directory, folder and populate them with files

file.copy() # this is in a family of functions 

list.files(path = "Weather/")
list.files(path = "Weather/2017/")

from_path = list.files(path = "Weather/2017/", full.names = T)

# take one file and move it up into the Weather folder 
file.copy(from = from_path, to = "Weather")

# finding the pattern for a loop
"Weather/2017/2017.csv"
"Weather/2018/2018.csv"
paste0("Weather/","2018","/2018.csv")
y <- 2018
paste0("Weather/",y,"/",y,".csv" )

y <- 2017:2020
paste0("Weather/",y,"/",y,".csv" )

my_copy_function <- function(x) {
  paste0("Weather/",x,"/",x,".csv" )
}

my_copy_function(2017)

my_copy_function <- function(x) {
  from_path <- paste0("Weather/",x,"/",x,".csv" )
  file.copy(from = from_path, to = "Weather")
}

## using the new function inside of walk()
library(tidyverse)
walk(.x = 2017:2020, .f = my_copy_function)
 # can wrap function in safely() to avoid error stoppage
walk(.x = 2017:2020, .f = safely(my_copy_function))

 
 # for loop that does the above
for (i in 2017:2020) {
  my_copy_function()
}


############################# creating the Weather folder 
library(tidyverse)

file.remove("Weather")  # permission error 
unlink(x = "Weather", recursive = T)  # this will delete it 


## create a new empty folder 
dir.create(path = "Weather")

## create the subfolders for each year 
"Weather/2017"
x <- 2017:2020
paste0("Weather/",x)

path_func <- function(x) {
  dir.create(path = paste0("Weather/",x) )
}

walk(.x = 2017:2020, .f = safely(path_func) )
 # could use piping 
2017:2020 %>% walk(.x = ., .f = safely(path_func) )

## populate new subfolders with the new .csv files 
 # note the .csvs are huge with 30M+ records -- use n_max to limit recs

read_csv(file = "Zip_files/2017.csv", col_names = F,
         n_max = 2000)
write_csv(x = , path = )

 # do the above with piping 
read_csv(file = "Zip_files/2017.csv", col_names = F,
         n_max = 2000) %>%
write_csv(x = ., file = "Weather/2017/2017test.csv")

 # now do it within a function 

read_n_write <- function(x) {
  read_csv(file = paste0("Zip_files/",x,".csv"), col_names = F,
           n_max = 2000) %>%
    write_csv(x = ., file = paste0("Weather/",x,"/",x,".csv") )
}

walk(.x = 2017:2020, .f = safely(read_n_write) )


############# add the 2013 - 2016 folders and files
 # create subfolders 
walk(.x = 2013:2016, .f = safely(path_func) )


 # create vector of file paths
myzipfile2 = list.files(path = "Zip_files/ExerciseData", pattern = ".gz", 
                       full.names = T)


 # unzip the files 
walk(.x = myzipfile2, .f = gunzip, remove = F)


 # create the read write function 
read_n_write2 <- function(x) {
  read_csv(file = paste0("Zip_files/ExerciseData/",x,".csv"), col_names = F,
           n_max = 2000) %>%
    write_csv(x = ., file = paste0("Weather/",x,"/",x,".csv") )
}


 # read/write the files to the new subfolders 
walk(.x = 2013:2016, .f = safely(read_n_write2) )
