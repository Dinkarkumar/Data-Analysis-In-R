s <- heights %>% filter(sex=="Male") %>% summarize(average=mean(height),standard_deviation=sd(height))
heights %>% filter(sex=="Male") %>% summarize(median= median(height),minimum = min(height),maximum=max(height))

