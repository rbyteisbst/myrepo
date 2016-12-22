library(tidyverse)
library(lubridate)
library(scales)

state_building <- read_csv("~/Downloads/State_Building_Energy_Costs_2009-2013.csv")

state_building %>% 
  filter(Town == 'Burlington') %>% 
  mutate(Year = year(mdy_hms(Year))) %>% 
  gather(key=type,value=value,5:29) %>% 
  filter(!is.na(value) & !grepl("Oil",type)) %>% 
  mutate(value2=as.numeric(gsub("$","",value,fixed=TRUE))) %>% 
  ggplot(aes(Year,value2,color=`Building Name`,group=`Building Name`))+
  geom_line()+
  scale_y_continuous(labels = scales::comma)+
  facet_wrap(~type,scales = "free_y")
