library(dslabs)
library(tidyverse)
library(gtools)
set.seed(16)
act_scores <- rnorm(10000,20.9,5.7)
sd(act_scores)

x <- 1:36
cdf <- function(x){
  den <- pnorm(x,mean(act_scores),sd(act_scores))
}
dens <- sapply(x,cdf)
plot(x,dens)
dens