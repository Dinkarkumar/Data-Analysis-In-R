filter(gapminder,year%in%c(1962,2012)) %>%
  ggplot(aes(fertility,life_expectancy,col=continent))+
  geom_point()+facet_grid(continent~year)
filter(gapminder,year%in%c(1962,2012)) %>% ggplot(aes(fertility,life_expectancy,col = continent))+
  geom_point()+facet_grid(.~year)
years <- c(1960,1970,1980,1990,2000,2010)
continents <- c("Asia","Europe")

filter(gapminder,year%in%years&continent%in%continents) %>% ggplot(aes(fertility,life_expectancy,col=continent))+geom_point()+facet_wrap(~year)
