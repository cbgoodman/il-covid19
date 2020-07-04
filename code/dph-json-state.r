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
    confirmed_cases_1 = lag(confirmed_cases, order_by = date),
    confirmed_cases_2 = lag(confirmed_cases, n = 2, order_by = date),
    confirmed_cases_3 = lag(confirmed_cases, n = 3, order_by = date),
    confirmed_cases_4 = lag(confirmed_cases, n = 4, order_by = date),
    confirmed_cases_5 = lag(confirmed_cases, n = 5, order_by = date),
    confirmed_cases_6 = lag(confirmed_cases, n = 6, order_by = date),
    confirmed_cases_7day_ma = (
      confirmed_cases +
      confirmed_cases_1 +
      confirmed_cases_2 +
      confirmed_cases_3 +
      confirmed_cases_4 +
      confirmed_cases_5 +
      confirmed_cases_6
    )/7,
    deaths_1 = lag(deaths, order_by = date),
    deaths_2 = lag(deaths, n = 2, order_by = date),
    deaths_3 = lag(deaths, n = 3, order_by = date),
    deaths_4 = lag(deaths, n = 4, order_by = date),
    deaths_5 = lag(deaths, n = 5, order_by = date),
    deaths_6 = lag(deaths, n = 6, order_by = date),
    deaths_7day_ma = (
      deaths +
      deaths_1 +
      deaths_2 +
      deaths_3 +
      deaths_4 +
      deaths_5 +
      deaths_6
    )/7,
    total_tested_1 = lag(total_tested, order_by = date),
    total_tested_2 = lag(total_tested, n = 2, order_by = date),
    total_tested_3 = lag(total_tested, n = 3, order_by = date),
    total_tested_4 = lag(total_tested, n = 4, order_by = date),
    total_tested_5 = lag(total_tested, n = 5, order_by = date),
    total_tested_6 = lag(total_tested, n = 6, order_by = date),
    total_tested_7day_ma = (
      total_tested +
      total_tested_1 +
      total_tested_2 +
      total_tested_3 +
      total_tested_4 +
      total_tested_5 +
      total_tested_6
    )/7,
    # Create Daily Data
    # `across` requires the most recent version of dplyr
    across(total_tested:deaths, ~.x - lag(.x, order_by = date), .names = "daily_{col}"),
    ## Cases
    daily_confirmed_cases_1 = lag(daily_confirmed_cases, order_by = date),
    daily_confirmed_cases_2 = lag(daily_confirmed_cases, n = 2, order_by = date),
    daily_confirmed_cases_3 = lag(daily_confirmed_cases, n = 3, order_by = date),
    daily_confirmed_cases_4 = lag(daily_confirmed_cases, n = 4, order_by = date),
    daily_confirmed_cases_5 = lag(daily_confirmed_cases, n = 5, order_by = date),
    daily_confirmed_cases_6 = lag(daily_confirmed_cases, n = 6, order_by = date),
    daily_confirmed_cases_7day_ma = (
      daily_confirmed_cases +
      daily_confirmed_cases_1 +
      daily_confirmed_cases_2 +
      daily_confirmed_cases_3 +
      daily_confirmed_cases_4 +
      daily_confirmed_cases_5 +
      daily_confirmed_cases_6
    )/7,
    ## Deaths
    daily_deaths_1 = lag(daily_deaths, order_by = date),
    daily_deaths_2 = lag(daily_deaths, n = 2, order_by = date),
    daily_deaths_3 = lag(daily_deaths, n = 3, order_by = date),
    daily_deaths_4 = lag(daily_deaths, n = 4, order_by = date),
    daily_deaths_5 = lag(daily_deaths, n = 5, order_by = date),
    daily_deaths_6 = lag(daily_deaths, n = 6, order_by = date),
    daily_deaths_7day_ma = (
      daily_deaths +
      daily_deaths_1 +
      daily_deaths_2 +
      daily_deaths_3 +
      daily_deaths_4 +
      daily_deaths_5 +
      daily_deaths_6
    )/7,
    ## Testing
    daily_total_tested_1 = lag(daily_total_tested, order_by = date),
    daily_total_tested_2 = lag(daily_total_tested, n = 2, order_by = date),
    daily_total_tested_3 = lag(daily_total_tested, n = 3, order_by = date),
    daily_total_tested_4 = lag(daily_total_tested, n = 4, order_by = date),
    daily_total_tested_5 = lag(daily_total_tested, n = 5, order_by = date),
    daily_total_tested_6 = lag(daily_total_tested, n = 6, order_by = date),
    daily_total_tested_7day_ma = (
      daily_total_tested +
      daily_total_tested_1 +
      daily_total_tested_2 +
      daily_total_tested_3 +
      daily_total_tested_4 +
      daily_total_tested_5 +
      daily_total_tested_6
    )/7,
    daily_positive_rate = daily_confirmed_cases/daily_total_tested,
    daily_positive_rate_1 = lag(daily_positive_rate, order_by = date),
    daily_positive_rate_2 = lag(daily_positive_rate, n = 2, order_by = date),
    daily_positive_rate_3 = lag(daily_positive_rate, n = 3, order_by = date),
    daily_positive_rate_4 = lag(daily_positive_rate, n = 4, order_by = date),
    daily_positive_rate_5 = lag(daily_positive_rate, n = 5, order_by = date),
    daily_positive_rate_6 = lag(daily_positive_rate, n = 6, order_by = date),
    daily_positive_rate_7day_ma = (
      daily_positive_rate +
      daily_positive_rate_1 +
      daily_positive_rate_2 +
      daily_positive_rate_3 +
      daily_positive_rate_4 +
      daily_positive_rate_5 +
      daily_positive_rate_6
    )/7
  )

# Create graphics
source("./code/il-covid-cases.r")
source("./code/il-covid-deaths.r")
source("./code/il-testing.r")
