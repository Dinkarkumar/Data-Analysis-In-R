library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
gapminder %>% filter(year==2012 & continent=="Africa")%>%ggplot(aes(x=fertility,y=life_expectancy,color=region))+
  geom_point()