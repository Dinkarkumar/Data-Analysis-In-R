#install.packages(c("cowplot", "googleway", "ggplot2", "ggrepel", 
 #                  "ggspatial", "libwgeom", "sf", "rnaturalearth", "rnaturalearthdata"))
#library(ggplot2)
#theme_set(theme_bw())
#library(sf)
#library(rnaturalearth)
#library(rnaturalearthdata)
#world <- ne_countries(scale = "medium",returnclass = 'sf')
#class(world)

#(g1 <- qplot(0:10,0:10))
#(g1_void <- g1 + theme_void() + theme(panel.border = element_rect(colour = "black",fill = NA)))

#g1 + annotation_custom(
#  grob = ggplotGrob(g1_void),
#  xmin = 0,
# xmax = 3,
#  ymin = 5,
#  ymax = 10
#)+ 
#  annotation_custom(
#    grob = ggplotGrob(g1_void),
#   xmax = 10,
#    ymin = 0,
#    ymax = 3
#  )

#library(cowplot)
#ggdraw(g1) + 
#  draw_plot(g1_void,width = 0.25 , height = 0.5,x = 0.02,y = 0.48) +
#  draw_plot(g1_void,width = 0.5 , height = 0.25 , x = 0.75 , y = 0.09) 


#(gworld <- ggplot(data = world) +
#    geom_sf(aes(fill = region_wb)) +
#    geom_rect(xmin = -102.15, xmax = -74.12, ymin = 7.65, ymax = 33.97, 
#              fill = NA, colour = "black", size = 1.5) +
#    scale_fill_viridis_d(option = "plasma") +
#    theme(panel.background = element_rect(fill = "azure"),
#          panel.border = element_rect(fill = NA)))

#(ggulf <- ggplot(data = world) + 
#    geom_sf(aes(fill = region_wb)) + 
#    annotate(geom = "text",x = -90,y=26,label = "Gulf of Mexico",
#             fontface = "italic",color = "grey22",size = 6)+
#    coord_sf(xlim = c(-102.15,-74.12),ylim = c(7.65,33.97),expand = FALSE) +
#    scale_fill_viridis_d(option = "plasma")+
#    theme(legend.position = "none",axis.title.x = element_blank(),
#          axis.title.y = element_blank(),panel.background = element_rect(fill = "azure"),
#          panel.border = element_rect(fill = NA
#                                      ))) "
ggplot() +
  coord_equal(xlim = c(0, 3.3), ylim = c(0, 1), expand = FALSE) +
  annotation_custom(ggplotGrob(gworld), xmin = 0, xmax = 1.5, ymin = 0, 
                    ymax = 1) +
  annotation_custom(ggplotGrob(ggulf), xmin = 1.5, xmax = 3, ymin = 0, 
                    ymax = 1) +
  theme_void()
plot_grid(gworld, ggulf, nrow = 1, rel_widths = c(2.3, 1))