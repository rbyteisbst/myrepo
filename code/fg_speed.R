library(tidyverse)
library(GGally)
library(baseballr)
library(plotly)

function fgyear(year){
  
  
  
}


fg_2016 <- fg_bat_leaders(2016, 2016,league = "all", qual = "0",ind = 0)

fg_2016 %>% 
  filter(!is.na(wGDP)) %>% 
  transmute(wGDP,BsR,wSB,nonSB = wGDP + BsR) %>% 
  ggpairs()
  
fg_2016 %>% 
  filter(!is.na(wGDP)) %>% 
  transmute(Name,wGDP,BsR,wSB,nonSB = wGDP + BsR) %>% 
  ggplot(aes(nonSB,wSB))+
  geom_point()+
  geom_smooth()

fg_2016 %>% 
  filter(!is.na(wGDP)) %>% 
  transmute(Name,wGDP,BsR,wSB,nonSB = wGDP + BsR) %>% 
  ggplot(aes(nonSB,wSB,label=Name))+
  geom_text()

ggplotly()

