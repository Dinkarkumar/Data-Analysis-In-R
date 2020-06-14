library(dslabs)
data("gapminder")
gapminder %>% filter(country=="United States") %>% ggplot(aes(year,fertility))+geom_line()
countries = c("South Korea","Germany")
gapminder %>% filter(country %in% countries) %>% ggplot(aes(year,fertility,col=country))+geom_line()
labels <- data.frame(country = countries,x = c(1975,1965),y = c(60,72))
gapminder %>% filter(country %in% countries) %>% ggplot(aes(year,life_expectancy,col=country))+geom_line()+
  geom_text(data= labels,aes(x,y,label = country),size=5)+theme(legend.position = "none")

