library(tidyverse)
library(jsonlite)
library(reshape2)
library(scales)
library(lubridate)

setwd("~/Dropbox/Personal/website/il-covid19/")

# Read in state-level data from DPH json file
table <- fromJSON("https://dph.illinois.gov//sitefiles/COVIDHistoricalTestResults.json")
county <- as.data.frame(table[["historical_county"]])

county2 <- unlist(county, use.names = TRUE)
county2 <- as.data.frame(county2)

county$date <- mdy(county$values.testDate)
county$date <-ymd(county$date)
county$month <- month(county$date)
county$day <- day(county$date)
county$year <- year(county$date)
county$L1 <- as.integer(factor(county$date))


ccdf <- melt(county$values.values)
df3 <- inner_join(county[, -2], ccdf)
