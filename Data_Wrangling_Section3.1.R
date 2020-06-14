#import a webpage into R
#library(rvest)
#url <- "https://en.wikipedia.org/wiki/Murder_in_the_United_States_by_state"
#h <- read_html(url)
#class(h)
#htab <- h %>% html_nodes("table")
#htab
#htab <- htab[[2]]
#htab
#tab <- htab %>% html_table
#class(tab)
#tab <- tab %>% setNames(c("state","population","total","murders","gun_murders","gun_ownership","total_rate","murder_rate","gun_murder_rate"))
#head(tab)


#For the guacamole recipe page, we already have done this and determined that we need the following selectors:
h <- read_html("http://www.foodnetwork.com/recipes/alton-brown/guacamole-recipe-1940609")
recipe <- h %>% html_node(".o-AssetTitle__a-Headlinetext") %>% html_text()
prep_time <- h %>% html_node(".m-RecipeInfo__a-Description--Total") %>% html_text()
ingredients <- h %>% html_nodes(".o-Ingredients__a-Ingredient") %>% html_text()
guacamole <- list(recipe,prep_time,ingredients)
guacamole
class(guacamole)

get_recipe <- function(url) {
  h <- read_html(url)
  recipe <- h %>% html_node(".o-AssetTitle__a-Headlinetext") %>% html_text()
  prep_time <- h %>% html_node(".m-RecipeInfo__a-Description--Total") %>% html_text()
  ingredients <- h %>% html_nodes(".o-Ingredients__a-Ingredient") %>% html_text()
  return(list(recipe = recipe,prep_time=prep_time,ingredients = ingredients))
}
class(get_recipe("http://www.foodnetwork.com/recipes/food-network-kitchen/pancakes-recipe-1913844"))