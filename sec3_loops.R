## unzipping zipped files (with R.utils and purrr walk() )
install.packages("R.utils")
library(R.utils)

 # look at files to do for loop on 
list.files(path = "Zip_files/")

 # find only the zip files 
list.files(path = "Zip_files/", pattern = ".gz")

 # get full path for each file
list.files(path = "Zip_files/", pattern = ".gz", full.names = T)

myzipfile = list.files(path = "Zip_files/", pattern = ".gz", 
                       full.names = T)

myzipfile[1]

## unzip a file with the gunzip from R.utils
 # this is a large file (1G+), will take a minute but will put 
 # the .csv in the folder AND delete the original zip file unless using
 # remove = T
# gunzip(myzipfile[1], remove = F)

## Note: can use F1 to pull up help panel for that function 

## loop to unzip the myzipfile
for(i in myzipfile){
  print(i)
}

for(i in myzipfile){
  print(i)
  gunzip(i, remove = F)
}


############################## walk to unzip 
# library(purrr)
library(tidyverse)

 # same vector as above
myzipfile = list.files(path = "Zip_files/", pattern = ".gz", 
                       full.names = T)

walk(.x = myzipfile, .f = gunzip, remove = F)

 # allow walk to skip if error (existing file) occurs
  # add safely() function around gunzip
walk(.x = myzipfile, .f = safely(gunzip), remove = F)


