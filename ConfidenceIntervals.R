library(tidyverse)
library(dslabs)
library(dplyr)
data(nhtemp)
data.frame(year = as.numeric(time(nhtemp)),temperature=as.numeric(nhtemp)) %>%
  ggplot(aes(year,temperature))+
  geom_point()+
  geom_smooth()+
  ggtitle("Average Yearly Temperatures in new Haven")



p <- 0.45
N <- 1000
X <- sample(c(1,0),N,replace=TRUE,prob=c(p,1-p))
X_hat <- mean(X)
SE_hat <- sqrt(X_hat*(1-X_hat)/N)
c(X_hat-2*SE_hat,X_hat+2*SE_hat)

z <- qnorm(0.995)
z

#Monte Carlo Simulation
B <- 10000
inside <- replicate(B,{
  X <- sample(c(0,1),size = N,replace=TRUE,prob = c(1-p,p))
  X_hat <- mean(X)
  SE_hat <- sqrt(X_hat*(1-X_hat)/N)
  between(p,X_hat -2*SE_hat,X_hat+2*SE_hat) #TRUE if p in confidence interval
})
mean(inside)




#Code: Confidence interval for the spread with sample size of 25
#Note that to compute the exact 95% confidence interval, we would use c(-qnorm(.975), qnorm(.975)) instead of 1.96.
N <- 25
X_hat <- 0.48
(2*X_hat - 1)+c(-2,2)*2*sqrt(X_hat*(1-X_hat)/N)


#P_values
#Code: Computing a p-value for observed spread of 0.02

N <- 100
z <- sqrt(N)*0.02/0.5
1-(pnorm(z)-pnorm(-z))