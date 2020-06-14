library(dslabs)
data("polls_us_election_2016")
names(polls_us_election_2016)

polls <- polls_us_election_2016 %>% filter(state == "U.S." & enddate >= "2016-10-31" & (grade %in% c("A+","A","A-","B+") | is.na(grade)))
polls <- polls %>% mutate(spread = rawpoll_clinton/100 - rawpoll_trump/100)

d_hat <- polls %>% summarize(d_hat = sum(spread*samplesize)/sum(samplesize))%>%.$d_hat

p_hat <- (d_hat+1)/2
moe <- 1.96*2*sqrt(p_hat*(1-p_hat)/sum(polls$samplesize))
moe

polls %>% ggplot(aes(spread))+geom_histogram(color="black",binwidth = 0.01)


polls %>% group_by(pollster) %>% filter(n()>=6) %>%
  ggplot(aes(pollster,spread))+geom_point()+
  theme(axis.title.x = element_text(angle = 90,hjust = 1))


#Note that to compute the exact 95% confidence interval, we would use qnorm(.975) instead of 1.96.
# collect last result before the election for each pollster
one_poll_per_pollster <- polls %>% group_by(pollster) %>% filter(enddate==max(enddate))%>%ungroup()

#histogram of spread estimates
one_poll_per_pollster %>% ggplot(aes(spread))+geom_histogram(binwidth = 0.01)
sd(one_poll_per_pollster$spread)


#construct 95% confidence interval
results <- one_poll_per_pollster %>% summarize(avg=mean(spread),se=sd(spread)/sqrt(length(spread))) %>%
  mutate(start=avg-1.96*se,end=avg+1.96*se)

round(results*100,1)