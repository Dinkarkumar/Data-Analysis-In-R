library(dslabs)
data("gapminder")
gapminder <- gapminder %>% mutate(dollars_per_day = gdp/population/365)
past_year = 1970
gapminder %>% filter(year==past_year & !is.na(gdp)) %>% ggplot(aes(dollars_per_day))+ geom_histogram(binwidth=1,color="black")
gapminder %>% filter(year==past_year & !is.na(gdp)) %>% ggplot(aes(dollars_per_day))+ geom_histogram(binwidth=1,color="black")+scale_x_continuous(trans="log2")