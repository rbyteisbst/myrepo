#watercolor map

library(tidyverse)
library(lubridate)
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

#devtools::install_github("dkahle/ggmap")
#https://www.google.com/maps/place/44°28'33.0%22N+73°12'43.0%22W/@44.475833,-73.211944,12z/data=!4m5!3m4!1s0x0:0x0!8m2!3d44.475833!4d-73.211944?hl=en

drought <- read_csv("~/Downloads/test - Sheet1-3.csv")
drought_desc <- read_csv("~/Downloads/test - Sheet1-4.csv")

library(scales)

summary(drought) 

drought %>% 
  gather(key=drought_type,value=percent_applicable,-Week) %>% 
  inner_join(drought_desc) %>% 
  transmute(Year = Week,percent_applicable = percent_applicable/100,description) %>% 
  #filter(year(Year)==2001) %>% 
 # filter(drought_type %in% c('D0-D4','D1-D4','D2-D4')  ) %>% 
  filter(!grepl("E", description)) %>% 
#grep("E",drought_desc$description)
  ggplot(aes(Year,percent_applicable,color=description))+
  geom_point()+
  #geom_line()+
  geom_smooth(se=F)+
  scale_y_continuous(label=percent)+
  facet_wrap(~description)


drought %>% 
  gather(key=drought_type,value=percent_applicable,-Week) %>% 
  inner_join(drought_desc) %>% 
  transmute(Year = year(Week),percent_applicable = percent_applicable/100,description) %>% 
  #filter(year(Year)==2001) %>% 
  # filter(drought_type %in% c('D0-D4','D1-D4','D2-D4')  ) %>% 
  filter(!grepl("E", description) & percent_applicable > 0) %>% 
  group_by(Year,description) %>% 
  summarize(non_zero_weeks = n()) %>% 
  #grep("E",drought_desc$description)
  ggplot(aes(Year,non_zero_weeks,color=description))+
  geom_point()+
  geom_line(alpha=.1)+
  scale_y_continuous(label=percent)
