#install.packages(c("cowplot","googleway","ggrepel","ggspatial","libwgeom","rnaturalearth","rnaturalearthdata","ggplot2","sf"))
#library(ggplot2)
#library(dplyr)
#library(rgdal)
#library(raster)
#library(ggsn)
#library(rworldmap)

#theme_set(theme_bw())
#library("sf")
#library("rnaturalearth")
#library(rnaturalearthdata)
#world <- ne_countries(scale = "medium",returnclass = "sf")
#class(world)
#ggplot(data = world)+geom_sf()
#ggplot(data = world)+geom_sf()+xlab("Longitude")+ylab("Latitude")+ggtitle("World Map",subtitle = paste0("(",length(unique(world$name))," countries)"))
#ggplot(data = world)+geom_sf(color="black",fill="lightgreen")+xlab("Longitude")+ylab("Latitude")+ggtitle("World Map",subtitle = paste0("(",length(unique(world$name))," countries)"))
#ggplot(data = world) + 
 # geom_sf(aes(fill=pop_est)) + 
  #scale_fill_viridis_c(option = "plasma",trans="sqrt")
#ggplot(data = world) +
 # geom_sf()+
  #coord_sf(crs = "+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +ellps=GRS80 +units=m +no_defs ")
#ggplot(data=world) + 
 # geom_sf() + 
  #coord_sf(crs = st_crs(3035))
#ggplot(data = world) + 
 # geom_sf() + 
  #coord_sf(crs = "+init=epsg:3035")
#ggplot(data = world)+
 # geom_sf()+
  #coord_sf(xlim = c(-8.686364,-8.496908),ylim = c(40.48099,41.11463),expand = FALSE)
#library(ggspatial)
#ggplot(data = world) + 
#  geom_sf() + 
#  annotation_scale(location="bl",width_hint = 0.5) + 
#  annotation_north_arrow(location = "bl",which_north = "true",pad_x = unit(0.75,"in"),pad_y = unit(0.5,"in"),style = north_arrow_fancy_orienteering)+
#  coord_sf(xlim = c(-102.15,-74.12),ylim = c(7.65,33.97))
#library("sf")
#world_points <- st_centroid(world)
#world_points <- cbind(world,st_coordinates(st_centroid(world$geometry)))
#ggplot(data = world) + 
#  geom_sf() +
#  geom_text(data = world_points,aes(x=X,y=Y,label=name),
#            color = "darkblue",fontface = "bold",check_overlap = FALSE) +
#  annotate(geom = "text",x= -90,y = 26,label = "Gulf of Mexico",fontface = "italic",color = "grey22",size = 2)+
#  coord_sf(xlim = c(-102.15,-74.12),ylim = c(7.65,33.97),expand = FALSE)
ggplot(data = world)+
  geom_sf(fill = "antiquewhite")+
  geom_text(data = world_points,aes(x = Y,y = Y,label = name),color = "darkblue",fontface = "bold",check_overlap = FALSE) +
  annotate(geom = "text",x = -90,y = 26,label = "Gulf of Mexico",fontface = "italic",color = "grey22",size = 6) +
  annotation_scale(location = "bl",width_hint = 0.5) + 
  annotation_north_arrow(location = "bl",which_north = "true",pad_x = unit(0.75,"in"),pad_y = unit(0.5,"in"),style = north_arrow_fancy_orienteering)+
  coord_sf(xlim = c(-8.686364,-8.496908),ylim = c(40.48099,41.11463),expand = FALSE) + xlab("Longitude") + ylab("Latitude") + 
  ggtitle("A Santo André de Vagos, Portugal")+theme(panel.grid.major = element_line(color = gray(.5),linetype = "dashed",size = 0.5),panel.background = element_rect(fill = "aliceblue"))
#ggsave("map1.pdf")
#ggsave("map_web1.png",width = 6,height = 6,dpi = "screen")