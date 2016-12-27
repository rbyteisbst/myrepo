library(data.table)
library(lubridate)
library(ggplot2)
library(ggmap)
library(gridExtra)
library(forecast)

meta_data <- fread("~/R/myrepo/data/all-data/meta/all_sites.csv")
str(meta_data)

