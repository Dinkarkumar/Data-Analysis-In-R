#import data
library(tidyverse)
path <- system.file("extdata",package = "dslabs")
filename <- file.path(path,"life-expectancy-and-fertility-two-countries-example.csv")
raw_dat <- read_csv(filename)
select(raw_dat,1:5)

#gather all columns except country
dat <- raw_dat %>% gather(key,value,-country)
head(dat)
dat$key[1:5]

#split on all underscores and pad empty cells with NA
dat %>% separate(key,c("year","first_variable_name","second_variable_name"), fill = "right")

#separate on underscores
dat %>% separate(key,c("year","variable_name"),"_")
dat %>% separate(key,c("year","variable_name"))

#split on first underscore but keep llife_expectancy merges
dat %>% separate(key,c("year","variable_name"),sep = "_",extra = "merge")

#separate and then spread
dat %>% separate(key,c("year","first_variable_name","second_variable_name"),fill = "right") %>%
  unite(variable_name,first_variable_name,second_variable_name,sep="_")

# full code for tidying up data
dat %>%
  separate(key,c("year","first_variable_name","second_variable_name"),fill = "right") %>%
  unite(variable_name,first_variable_name,second_variable_name,sep="_") %>%
  spread(variable_name,value) %>%
  rename(fertility = fertility_NA)