library(tidyverse)
library(dplyr)
library(ggplot2)
library(dslabs)
data(heights)
heights %>% ggplot(aes(sex,height))+geom_point()+
  geom_jitter(alpha=0.2,width=0.1)