#watercolor map

library(tidyverse)

test <- read_csv("~/Downloads/test - Sheet1-2.csv")

library(ggmap)
library(ggthemes)
map <- ggmap::get_map(location = c(lon = -73.2198, lat = 44.4807), zoom = 12, maptype = "watercolor")


ggmap(map) +
  geom_point(data = test,
             aes(x = longitude, y = latitude,
                 col = waterthing), size = 3) +
  theme_map()+
  scale_colour_grey(end = 0.7)+ 
  ggtitle("French placenames containing the word 'sur'") +
  theme(plot.title = element_text(lineheight=1, face="bold"))+
  theme(text = element_text(size=14),
        legend.position = "none")

devtools::install_github("dkahle/ggmap")
https://www.google.com/maps/place/44°28'33.0%22N+73°12'43.0%22W/@44.475833,-73.211944,12z/data=!4m5!3m4!1s0x0:0x0!8m2!3d44.475833!4d-73.211944?hl=en


