library(tidyverse)
library(dslabs)
data("polls_us_election_2016")

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

mu <- 0
tau <- 0.035
sigma <- results$se
Y <- results$avg
B <- sigma^2/(sigma^2+tau^2)

posterior_mean <- B*mu + (1-B)*Y
posterior_se <- sqrt(1/(1/sigma^2 + 1/tau^2))
posterior_mean
posterior_se

#Credible interval
posterior_mean + c(-1.96,1.96)*posterior_se

# Code for d>=0
1-pnorm(0,posterior_mean,posterior_se)

#Code : simulated data with Xj = d+Ej
J <- 6
N <- 2000
d <- 0.021
p <- (d+1)/2
X <- d + rnorm(J,0,2*sqrt(p*(1-p)/N))

#Code : Simulated data with Xi,j
I <- 5
J <- 6
N <- 2000
d <- 0.021
p <- (d+1)/2
X <- sapply(1:I,function(i){
  d+rnorm(J,0,2*sqrt(p*(1-p)/N))
})

#Code : Simulated data with Xi,j = d + Hi+Ei,j
I <- 5
J <- 6
N <- 2000
d <- 0.021
p <- (d+1)/2
h <- rnorm(I,0,0.025) #assume standard error of pollster-to-pollster variability is 0.025
X <- sapply(1:I,function(i){
  d +h[i] + rnorm(J,0,2*sqrt(p*(1-p)/N))
})


# Code : Calculating probability of d>0 with general bias
#Note that sigma now includes an estimate of the variability due to general bias sigma_b = 0.025
mu <- 0
tau <- 0.035
sigma <- sqrt(results$se^2 + 0.025^2)
Y <- results$avg
B <- sigma^2/(sigma^2 + tau^2)

posterior_mean <- B*mu + (1-B)*Y
posterior_se <- sqrt(1/(1/sigma^2 + 1/tau^2))

1-pnorm(0,posterior_mean,posterior_se)


