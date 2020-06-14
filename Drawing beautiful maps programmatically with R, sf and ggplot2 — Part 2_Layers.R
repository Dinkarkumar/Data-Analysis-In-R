library(ggplot2)
theme_set(theme_bw())
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

world <- ne_countries(scale="medium",returnclass = "sf")
class(world)
(sites <- data.frame(dataset_2014_05$longitude,dataset_2014_05$latitude))
head(sites)
ggplot(data=world) + 
  geom_sf() + 
  geom_point(data = sites,aes(x = longitude,y=latitude),size = 1, shape = 23, fill = "darkred")+
  coord_sf(xlim = c(-8.862002,-8.326483),ylim = c(40.10702,40.80377),expand = FALSE)
#ggsave("map2.pdf")
(sites <- st_as_sf(sites,coords = c("dataset_2014_05.longitude","dataset_2014_05.latitude"),crs = 4326,agr = "constant"))
ggplot(data=world)+
  geom_sf()+
  geom_sf(data = sites,size=4,shape = 23,fill = "darkred")+
  coord_sf(xlim = c(-8.862002,-8.326483),ylim = c(40.10702,40.80377),expand = FALSE)
#ggsave("map3.x`xpdf")
library(maps)
states <- st_as_sf(map("state",plot = FALSE,fill = TRUE))
#head(states)
states <- cbind(states,st_coordinates(st_centroid(states)))
library("tools")
ggplot(data = world) + 
  geom_sf() + 
  geom_sf(data = states,fill=NA) + 
  geom_text(data = states,aes(X,Y,label = ID),size = 5) + 
  coord_sf(xlim = c(-88,-78),ylim = c(24.5,33),expand = FALSE)
states$nudge_y <- -1
states$nudge_y[states$ID == "Florida"] <- 0.5
states$nudge_y[states$ID == "South Carolina"] <- -1.5
ggplot(data = world) + 
  geom_sf() + 
  geom_sf(data = states,fill = NA) + 
  geom_label(data = states,aes(X,Y,label = ID),size = 5,fontface = "bold",nudge_y = states$nudge_y) + 
  coord_sf(xlim = c(-88,-78),ylim = c(24.5,33),expand = FALSE)
counties <- st_as_sf(map("county",plot = FALSE,fill = TRUE))
counties <- subset(counties,grepl("florida",counties$ID))
counties$area <- as.numeric(st_area(counties))
head(counties)
ggplot(data = world) + 
  geom_sf() + 
  geom_sf(data = counties,fill = NA,color = gray(.5)) +
  coord_sf(xlim = c(-88,-78),ylim = c(24.5,33),expand = FALSE)
ggplot(data = world) + 
  geom_sf()+
  geom_sf(data = counties,aes(fill = area)) +
  scale_fill_viridis_c(trans = "sqrt",alpha = 0.4) +
  coord_sf(xlim = c(-88,-78),ylim = c(24.5,33),expand = FALSE)
flcities <- data.frame(state = rep("Florida", 5), city = c("Miami", 
                                                           "Tampa", "Orlando", "Jacksonville", "Sarasota"), lat = c(25.7616798, 
                                                                                                                    27.950575, 28.5383355, 30.3321838, 27.3364347), lng = c(-80.1917902, 
                                                                                                                                                                            -82.4571776, -81.3792365, -81.655651, -82.5306527))
library(googleway)
key <- "AIzaSyAA5wOCWz7vvkpbVC_krb9KPLeb0RPAgmw"
flcities <- data.frame(state = rep("Florida",5),city = c("Miami","Tampa","Orlando","Jacksonville","Sarasota"))
coords <- apply(flcities,1,function(x){
  google_geocode(address = paste(x["city"],x["state"],sep = ","),key = key)
})
flcities <- cbind(flcities,do.call(rbind,lapply(coords,geocode_coordinates)))
(flcities <- st_as_sf(flcities,coords = c("lng","lat"),remove = FALSE,crs = 4326 , agr = "constant"))