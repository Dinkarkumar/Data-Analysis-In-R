library(gtools)
library(dslabs)
library(tidyverse)

n <- 1000
loss_per_foreclosure <- -200000
p <- 0.02
defaults <- sample(c(0,1),n,prob=c(1-p,p),replace=TRUE)
sum(defaults*loss_per_foreclosure)

B <- 10000
losses <- replicate(B,{
  defaults <- sample(c(0,1),n,prob=c(1-p,p),replace=TRUE)
  sum(defaults*loss_per_foreclosure)
})
data.frame(losses_in_millions = losses/10^6)%>%ggplot(aes(losses_in_millions))+geom_histogram(binwidth = 0.6,col="black")

n*(p*loss_per_foreclosure+(1-p)*0)
sqrt(n)*abs(loss_per_foreclosure)*sqrt(p*(1-p))

-loss_per_foreclosure*p/(1-p)