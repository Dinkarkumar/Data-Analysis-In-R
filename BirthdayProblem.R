library(gtools)
# Checking for duplicated bdays in one 50 person group
n <- 50
bdays <- sample(1:365,n,replace=TRUE) # generate n random birthdays
any(duplicated(bdays)) #Check if any birthdays are duplicated

# Monte Carlo simulation with B=10000 replicates
B <- 10000
results <- replicate(B,{
  bdays<- sample(1:365,n,replace=TRUE)
  any(duplicated(bdays))
})
mean(results) #calculates proportion of group with duplicated bdays