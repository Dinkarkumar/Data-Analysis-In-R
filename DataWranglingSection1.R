library(dslabs)
library(tidyverse)
library(readxl)

# See Working Directory
getwd()

# change your working directory
setwd("C:/Users/user/Documents")

# set path to the location for raw data files in the dslabs package and list files
path <- system.file("extdata",package = "dslabs")
list.files(path)

# generate a full path to a file
filename <- "murders.csv"
fullpath <- file.path(path,filename)
fullpath

# copy file from dslabs package to your working directory
file.copy(fullpath,getwd())

# check if the file exists
file.exists(filename)

# inspect the first 3  lines
readLines("murders.csv")
nrow(murders)

# read file in CSV format
dat <- read_csv(filename)

# read using full path
dat <- read.csv(fullpath)
head(dat)

# Ex:
path <- system.file("extdata",package="dslabs")
files <- list.files(path)
files

filename <- "murders.csv"
filename1 <- "life-expectancy-and-fertility-two-countries-example.csv"
filename2 <- "fertility-two-countries-example.csv"
dat = read.csv(file.path(path,filename))
dat1 = read.csv(file.path(path,filename1))
dat2 = read.csv(file.path(path,filename2))

# read_csv() function and other import functions can read a URL directly
url = "https://algs4.cs.princeton.edu/15uf/largeUF.txt"
dat <- read_csv(url)
download.file(url,"largeUF.txt")
tempfile()
tmp_filename <- tempfile()
download.file(url,tmp_filename)
dat <- read_csv(tmp_filename)
file.remove(tmp_filename)