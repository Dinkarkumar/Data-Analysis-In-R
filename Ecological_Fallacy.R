library(tidyverse)
library(dbplyr)
library(dslabs)
data("gapminder")
gapminder <- gapminder %>% 
  mutate(group=case_when(
    .$region %in% west ~ "The West",
    .$region %in% "Northern Africa" ~ "Northern Africa",
    .$region %in% c("Eastern Asia","South-Eastern Asia")~"East Asia",
    .$region == "Southern Asia" ~"Southern Asia",
    .$region %in% c("Central America","South America","Caribbean")~"Latin America",
    .$region %in% "Africa" &.$region !="Northern Africa" ~"Sub-Saharan Africa",
    .$region %in% c("Melanesia","Micronesia","Polynesia")~"Pacific Islands" 
  ))
surv_income <- gapminder %>% 
  filter(year %in% present_year & !is.na(gdp) & !is.na(infant_mortality) & !is.na(group))%>%
  group_by(group) %>%
  summarize(income=sum(gdp)/sum(population)/365,
            infant_survival_rate = 1-sum(infant_mortality/1000*population)/sum(population))
surv_income %>% arrange(income)

surv_income %>% ggplot(aes(income,infant_survival_rate,label=group,color=group))+
  scale_x_continuous(trans="log2",limit=c(0.25,150))+
  scale_y_continuous(trans="log2",limit=c(0.875,0.9981),breaks=c(0.85,0.90,0.95,.99,.995,.998))+
  geom_label(size=3,show.legend = FALSE)