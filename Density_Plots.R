library(tidyverse)
library(dplyr)
library(dslabs)
data("gapminder")
past_year = 1970
present_year = 2010
gapminder <- gapminder %>% mutate(dollars_per_day = gdp/population/365)
west <- c("Western Europe","Northern Europe","Southern Europe","Northern America","Australia and New Zealand")
country_list_1 <- gapminder %>% filter(year==past_year & !is.na(dollars_per_day)) %>% .$country
country_list_2 <- gapminder %>% filter(year==present_year & is.na(dollars_per_day)) %>% .$country
country_list <- intersect(country_list_1,country_list_2)
gapminder %>%
  filter(year == past_year & country %in% country_list) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>% group_by(group) %>%
  summarize(n = n()) %>% knitr::kable()
aes(x=dollars_per_day,y=..count..)
p<-gapminder %>% filter(year %in% c(past_year,present_year)& country %in% country_list)%>%
  mutate(group=ifelse(region %in% west,"West","Developing")) %>% ggplot(aes(dollars_per_day, y= ..count..,fill=group))+
  scale_x_continuous(trans="log2")
p+geom_density(alpha=0.2)+facet_grid(year ~ .)
gapminder <- gapminder %>% 
  mutate(group=case_when(
    .$region %in% west ~ "West",
    .$region %in% c("Eastern Asia","South-Eastern Asia") ~ "East Asia",
    .$region %in% c("Caribbean","Central America","South America")~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa"~"Sub-Saharan Africa",
    TRUE~"oTHERS"
  ))