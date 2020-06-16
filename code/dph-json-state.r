library(tidyverse)
library(jsonlite)
library(scales)
library(lubridate)

# Read in state-level data from DPH json file
table <- fromJSON("https://dph.illinois.gov//sitefiles/COVIDHistoricalTestResults.json")
state <- table[["state_testing_results"]]
stateDF <- do.call(rbind.data.frame, state)

# Format date from json
stateDF$date <- mdy(stateDF$testDate)

# Set today's date
today <- today()
today <- format(today,"%B %d, %Y")

# Export data to csv for archive
write_csv(x = select(stateDF,-c(testDate)), path = "il-covid.csv")

# Generate lags, change in vars, 7-day moving average
stateDF <- stateDF %>%
  mutate(
    # Cases
    lag.cases = lag(confirmed_cases, order_by = date),
    lag2.cases = lag(confirmed_cases, n = 2, order_by = date),
    lag3.cases = lag(confirmed_cases, n = 3, order_by = date),
    lag4.cases = lag(confirmed_cases, n = 4, order_by = date),
    lag5.cases = lag(confirmed_cases, n = 5, order_by = date),
    lag6.cases = lag(confirmed_cases, n = 6, order_by = date),
    cases.ma.7day = (confirmed_cases + lag.cases + lag2.cases + lag3.cases + lag4.cases + lag5.cases + lag6.cases)/7,
    chg.cases = confirmed_cases - lag.cases,
    lag.chg.cases = lag(chg.cases, order_by = date),
    lag2.chg.cases = lag(chg.cases, n = 2, order_by = date),
    lag3.chg.cases = lag(chg.cases, n = 3, order_by = date),
    lag4.chg.cases = lag(chg.cases, n = 4, order_by = date),
    lag5.chg.cases = lag(chg.cases, n = 5, order_by = date),
    lag6.chg.cases = lag(chg.cases, n = 6, order_by = date),
    cases.ma.7day.chg = (chg.cases + lag.chg.cases + lag2.chg.cases + lag2.chg.cases + lag4.chg.cases + lag5.chg.cases + lag6.chg.cases)/7,
    # Deaths
    lag.deaths = lag(deaths, order_by = date),
    lag2.deaths = lag(deaths, n = 2, order_by = date),
    lag3.deaths = lag(deaths, n = 3, order_by = date),
    lag4.deaths = lag(deaths, n = 4, order_by = date),
    lag5.deaths = lag(deaths, n = 5, order_by = date),
    lag6.deaths = lag(deaths, n = 6, order_by = date),
    deaths.ma.7day = (deaths + lag.deaths + lag2.deaths + lag3.deaths + lag4.deaths + lag5.deaths + lag6.deaths)/7,
    chg.deaths = deaths - lag.deaths,
    lag.chg.deaths = lag(chg.deaths, order_by = date),
    lag2.chg.deaths = lag(chg.deaths, n = 2, order_by = date),
    lag3.chg.deaths = lag(chg.deaths, n = 3, order_by = date),
    lag4.chg.deaths = lag(chg.deaths, n = 4, order_by = date),
    lag5.chg.deaths = lag(chg.deaths, n = 5, order_by = date),
    lag6.chg.deaths = lag(chg.deaths, n = 6, order_by = date),
    deaths.ma.7day.chg = (chg.deaths + lag.chg.deaths + lag2.chg.deaths + lag3.chg.deaths + lag4.chg.deaths + lag5.chg.deaths + lag6.chg.deaths)/7,
    # Testing
    lag.tested = lag(total_tested, order_by = date),
    lag2.tested = lag(total_tested, n = 2, order_by = date),
    lag3.tested = lag(total_tested, n = 3, order_by = date),
    lag4.tested = lag(total_tested, n = 4, order_by = date),
    lag5.tested = lag(total_tested, n = 5, order_by = date),
    lag6.tested = lag(total_tested, n = 6, order_by = date),
    tested.ma.7day = (total_tested + lag.tested + lag2.tested + lag3.tested + lag4.tested + lag5.tested + lag6.tested)/7,
    chg.tested = total_tested - lag.tested,
    lag.chg.tested = lag(chg.tested, order_by = date),
    lag2.chg.tested = lag(chg.tested, n = 2, order_by = date),
    lag3.chg.tested = lag(chg.tested, n = 3, order_by = date),
    lag4.chg.tested = lag(chg.tested, n = 4, order_by = date),
    lag5.chg.tested = lag(chg.tested, n = 5, order_by = date),
    lag6.chg.tested = lag(chg.tested, n = 6, order_by = date),
    tested.ma.7day.chg = (chg.tested + lag.chg.tested + lag2.chg.tested + lag3.chg.tested + lag4.chg.tested + lag5.chg.tested + lag6.chg.tested)/7,
    perc.positive = chg.cases/chg.tested,
    lag.perc.positive = lag(perc.positive, order_by = date),
    lag2.perc.positive = lag(perc.positive, n = 2, order_by = date),
    lag3.perc.positive = lag(perc.positive, n = 3, order_by = date),
    lag4.perc.positive = lag(perc.positive, n = 4, order_by = date),
    lag5.perc.positive = lag(perc.positive, n = 5, order_by = date),
    lag6.perc.positive = lag(perc.positive, n = 6, order_by = date),
    perc.positive.ma.7day = (perc.positive + lag2.perc.positive + lag3.perc.positive + lag4.perc.positive + lag5.perc.positive + lag6.perc.positive)/7
  )

# Create graphics
source("./code/il-covid-cases.r")
source("./code/il-covid-deaths.r")
source("./code/il-testing.r")
