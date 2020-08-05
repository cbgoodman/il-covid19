library(tidyverse)
library(jsonlite)
library(scales)
library(lubridate)

# Read in state-level data from DPH json file
table <- fromJSON("https://dph.illinois.gov//sitefiles/COVIDHistoricalTestResults.json")
state <- table[["state_testing_results"]]
stateDF <- do.call(rbind.data.frame, state)

# Generate lags, change in vars, 7-day moving average
stateDF <- stateDF %>%
  mutate(
    testDate = mdy(testDate),
    confirmed_cases_7day_ma = (
      confirmed_cases +
      lag(confirmed_cases, order_by = testDate) +
      lag(confirmed_cases, n = 2, order_by = testDate) +
      lag(confirmed_cases, n = 3, order_by = testDate) +
      lag(confirmed_cases, n = 4, order_by = testDate) +
      lag(confirmed_cases, n = 5, order_by = testDate) +
      lag(confirmed_cases, n = 6, order_by = testDate)
    )/7,
    deaths_7day_ma = (
      deaths +
      lag(deaths, order_by = testDate) +
      lag(deaths, n = 2, order_by = testDate) +
      lag(deaths, n = 3, order_by = testDate) +
      lag(deaths, n = 4, order_by = testDate) +
      lag(deaths, n = 5, order_by = testDate) +
      lag(deaths, n = 6, order_by = testDate)
    )/7,
    total_tested_7day_ma = (
      total_tested +
      lag(total_tested, order_by = testDate) +
      lag(total_tested, n = 2, order_by = testDate) +
      lag(total_tested, n = 3, order_by = testDate) +
      lag(total_tested, n = 4, order_by = testDate) +
      lag(total_tested, n = 5, order_by = testDate) +
      lag(total_tested, n = 6, order_by = testDate)
    )/7,
    # Create Daily Data
    # `across` requires the most recent version of dplyr
    across(total_tested:deaths, ~.x - lag(.x, order_by = testDate), .names = "daily_{col}"),
    ## Cases
    daily_confirmed_cases_7day_ma = (
      daily_confirmed_cases +
      lag(daily_confirmed_cases, order_by = testDate) +
      lag(daily_confirmed_cases, n = 2, order_by = testDate) +
      lag(daily_confirmed_cases, n = 3, order_by = testDate) +
      lag(daily_confirmed_cases, n = 4, order_by = testDate) +
      lag(daily_confirmed_cases, n = 5, order_by = testDate) +
      lag(daily_confirmed_cases, n = 6, order_by = testDate)
    )/7,
    ## Deaths
    daily_deaths_7day_ma = (
      daily_deaths +
      lag(daily_deaths, order_by = testDate) +
      lag(daily_deaths, n = 2, order_by = testDate) +
      lag(daily_deaths, n = 3, order_by = testDate) +
      lag(daily_deaths, n = 4, order_by = testDate) +
      lag(daily_deaths, n = 5, order_by = testDate) +
      lag(daily_deaths, n = 6, order_by = testDate)
    )/7,
    ## Testing
    daily_total_tested_7day_ma = (
      daily_total_tested +
      lag(daily_total_tested, order_by = testDate) +
      lag(daily_total_tested, n = 2, order_by = testDate) +
      lag(daily_total_tested, n = 3, order_by = testDate) +
      lag(daily_total_tested, n = 4, order_by = testDate) +
      lag(daily_total_tested, n = 5, order_by = testDate) +
      lag(daily_total_tested, n = 6, order_by = testDate)
    )/7,
    daily_positive_rate = daily_confirmed_cases/daily_total_tested,
    daily_positive_rate_7day_ma = (
      daily_positive_rate +
      lag(daily_positive_rate, order_by = testDate) +
      lag(daily_positive_rate, n = 2, order_by = testDate) +
      lag(daily_positive_rate, n = 3, order_by = testDate) +
      lag(daily_positive_rate, n = 4, order_by = testDate) +
      lag(daily_positive_rate, n = 5, order_by = testDate) +
      lag(daily_positive_rate, n = 6, order_by = testDate)
    )/7
  )

# Set today's date
today <- ymd(max(stateDF$testDate))
today <- format(today,"%B %d, %Y")

# Export data to csv for archive
write_csv(x = select(
  stateDF,
  -c(confirmed_cases_7day_ma, deaths_7day_ma, total_tested_7day_ma,
    daily_confirmed_cases_7day_ma, daily_deaths_7day_ma, daily_total_tested_7day_ma,
    daily_positive_rate, daily_positive_rate_7day_ma)
  ),
  path = "il-covid.csv")

# Create graphics
source("./code/il-covid-cases.r")
source("./code/il-covid-deaths.r")
source("./code/il-testing.r")
