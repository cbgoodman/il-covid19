# Generate lags, change in vars, 7-day moving average for state dataset
stateDF <- stateDF %>%
  mutate(
    testDate = ymd_hms(testDate),
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
today.state <- ymd(max(stateDF$testDate))
today.state <- format(today.state,"%B %d, %Y")

# Export data to csv for archive
write_csv(x = select(
  stateDF,
  -c(confirmed_cases_7day_ma, deaths_7day_ma, total_tested_7day_ma,
     daily_confirmed_cases_7day_ma, daily_deaths_7day_ma, daily_total_tested_7day_ma,
     daily_positive_rate, daily_positive_rate_7day_ma)
),
file = "il-covid.csv")

# Process statewide vaccine data
statewide_vaccine <- vax %>%
  mutate(
    Report_Date = ymd_hms(Report_Date),
    AdministeredCountChange_7day_ma = (
      AdministeredCountChange +
        lag(AdministeredCountChange, order_by = Report_Date) +
        lag(AdministeredCountChange, n = 2, order_by = Report_Date) +
        lag(AdministeredCountChange, n = 3, order_by = Report_Date) +
        lag(AdministeredCountChange, n = 4, order_by = Report_Date) +
        lag(AdministeredCountChange, n = 5, order_by = Report_Date) +
        lag(AdministeredCountChange, n = 6, order_by = Report_Date)
    )/7
  )

vax_dates <- vax %>% select(Report_Date) %>% mutate(Report_Date = ymd_hms(Report_Date))
today.vax <- ymd(max(vax_dates$Report_Date))
today.vax <- format(today.vax,"%B %d, %Y")

# Hospitalization Rates
hospitalization <- hospitalization %>%
  mutate (
    ReportDate = ymd_hms(ReportDate),
    TotalInUseBedsCOVID_7day_ma = (
      TotalInUseBedsCOVID +
        lag(TotalInUseBedsCOVID, order_by = ReportDate) +
        lag(TotalInUseBedsCOVID, n = 2, order_by = ReportDate) +
        lag(TotalInUseBedsCOVID, n = 3, order_by = ReportDate) +
        lag(TotalInUseBedsCOVID, n = 4, order_by = ReportDate) +
        lag(TotalInUseBedsCOVID, n = 5, order_by = ReportDate) +
        lag(TotalInUseBedsCOVID, n = 6, order_by = ReportDate)
    )/7,
    ICUInUseBedsCOVID_7day_ma = (
      ICUInUseBedsCOVID +
        lag(ICUInUseBedsCOVID, order_by = ReportDate) +
        lag(ICUInUseBedsCOVID, n = 2, order_by = ReportDate) +
        lag(ICUInUseBedsCOVID, n = 3, order_by = ReportDate) +
        lag(ICUInUseBedsCOVID, n = 4, order_by = ReportDate) +
        lag(ICUInUseBedsCOVID, n = 5, order_by = ReportDate) +
        lag(ICUInUseBedsCOVID, n = 6, order_by = ReportDate)
    )/7,
    hospitalutilizationCOVID = TotalInUseBedsCOVID/TotalBeds,
    hospitalutilizationCOVID_7day_ma = (
      hospitalutilizationCOVID +
        lag(hospitalutilizationCOVID, order_by = ReportDate) +
        lag(hospitalutilizationCOVID, n = 2, order_by = ReportDate) +
        lag(hospitalutilizationCOVID, n = 3, order_by = ReportDate) +
        lag(hospitalutilizationCOVID, n = 4, order_by = ReportDate) +
        lag(hospitalutilizationCOVID, n = 5, order_by = ReportDate) +
        lag(hospitalutilizationCOVID, n = 6, order_by = ReportDate)
    )/7,
    icuutilizationCOVID = ICUInUseBedsCOVID/ICUBeds,
    icuutilizationCOVID_7day_ma = (
      icuutilizationCOVID +
        lag(icuutilizationCOVID, order_by = ReportDate) +
        lag(icuutilizationCOVID, n = 2, order_by = ReportDate) +
        lag(icuutilizationCOVID, n = 3, order_by = ReportDate) +
        lag(icuutilizationCOVID, n = 4, order_by = ReportDate) +
        lag(icuutilizationCOVID, n = 5, order_by = ReportDate) +
        lag(icuutilizationCOVID, n = 6, order_by = ReportDate)
    )/7
  )

hosp_dates <- hospitalization %>% select(ReportDate)
today.hosp <- ymd(max(hosp_dates$ReportDate))
today.hosp <- format(today.hosp,"%B %d, %Y")

# Reform county-level data
county_data <- county_data %>% 
rename(
  testDate = values.ReportDate,
  County = values.CountyName,
  confirmed_cases = values.CumulativeCases,
  tested = values.TotalTested,
  deaths = values.Deaths,
  #latitude = values.latitude,
  #longitude = values.longitude
) %>%
  #select(-c(latitude,longitude)) %>%
  mutate(
    # 2020 Census Population Estimates
    population = case_when(
      County == "Illinois" ~ 12587.53,
      County == "Adams" ~ 64.783,
      County == "Alexander" ~ 5.497,
      County == "Bond" ~ 16.262,
      County == "Boone" ~ 52.777,
      County == "Brown" ~ 6.546,
      County == "Bureau" ~ 32.303,
      County == "Calhoun" ~ 4.616,
      County == "Carroll" ~ 14.241,
      County == "Cass" ~ 11.925,
      County == "Champaign" ~ 209.192,
      County == "Chicago" ~ 2677.643,
      County == "Christian" ~ 32.075,
      County == "Clark" ~ 15.268,
      County == "Clay" ~ 13.079,
      County == "Clinton" ~ 37.398,
      County == "Coles" ~ 50.383,
      County == "Cook" ~ 2430.641,
      County == "Crawford" ~ 18.512,
      County == "Cumberland" ~ 10.649,
      County == "DeKalb" ~ 104.491,
      County == "De Witt" ~ 15.368,
      County == "Douglas" ~ 19.51,
      County == "DuPage" ~ 917.481,
      County == "Edgar" ~ 16.858,
      County == "Edwards" ~ 6.356,
      County == "Effingham" ~ 34.065,
      County == "Fayette" ~ 21.264,
      County == "Ford" ~ 12.949,
      County == "Franklin" ~ 38.06,
      County == "Fulton" ~ 33.69,
      County == "Gallatin" ~ 4.793,
      County == "Greene" ~ 12.702,
      County == "Grundy" ~ 50.993,
      County == "Hamilton" ~ 8.084,
      County == "Hancock" ~ 17.422,
      County == "Hardin" ~ 3.808,
      County == "Henderson" ~ 6.535,
      County == "Henry" ~ 48.411,
      County == "Iroquois" ~ 26.711,
      County == "Jackson" ~ 56.675,
      County == "Jasper" ~ 9.465,
      County == "Jefferson" ~ 37.235,
      County == "Jersey" ~ 21.616,
      County == "Jo Daviess" ~ 21.239,
      County == "Johnson" ~ 12.358,
      County == "Kane" ~ 531.01,
      County == "Kankakee" ~ 108.594,
      County == "Kendall" ~ 130.638,
      County == "Knox" ~ 49.053,
      County == "Lake" ~ 693.593,
      County == "LaSalle" ~ 107.571,
      County == "Lawrence" ~ 15.467,
      County == "Lee" ~ 33.647,
      County == "Livingston" ~ 35.414,
      County == "Logan" ~ 28.383,
      County == "McDonough" ~ 29.295,
      County == "McHenry" ~ 305.888,
      County == "McLean" ~ 171.256,
      County == "Macon" ~ 103.015,
      County == "Macoupin" ~ 44.567,
      County == "Madison" ~ 262.635,
      County == "Marion" ~ 37.045,
      County == "Marshall" ~ 11.309,
      County == "Mason" ~ 13.173,
      County == "Massac" ~ 13.636,
      County == "Menard" ~ 12.068,
      County == "Mercer" ~ 15.225,
      County == "Monroe" ~ 34.739,
      County == "Montgomery" ~ 28.045,
      County == "Morgan" ~ 33.4,
      County == "Moultrie" ~ 14.347,
      County == "Ogle" ~ 50.306,
      County == "Peoria" ~ 177.652,
      County == "Perry" ~ 20.664,
      County == "Piatt" ~ 16.355,
      County == "Pike" ~ 15.239,
      County == "Pope" ~ 4.142,
      County == "Pulaski" ~ 5.201,
      County == "Putnam" ~ 5.716,
      County == "Randolph" ~ 31.351,
      County == "Richland" ~ 15.507,
      County == "Rock Island" ~ 140.907,
      County == "St. Clair" ~ 258.046,
      County == "Saline" ~ 23.182,
      County == "Sangamon" ~ 193.882,
      County == "Schuyler" ~ 6.738,
      County == "Scott" ~ 4.95,
      County == "Shelby" ~ 21.299,
      County == "Stark" ~ 5.262,
      County == "Stephenson" ~ 43.831,
      County == "Tazewell" ~ 130.777,
      County == "Union" ~ 16.498,
      County == "Vermilion" ~ 74.855,
      County == "Wabash" ~ 11.19,
      County == "Warren" ~ 16.696,
      County == "Washington" ~ 13.764,
      County == "Wayne" ~ 16.031,
      County == "White" ~ 13.364,
      County == "Whiteside" ~ 54.656,
      County == "Will" ~ 688.726,
      County == "Williamson" ~ 66.415,
      County == "Winnebago" ~ 281.295,
      County == "Woodford" ~ 38.091
    )
  ) %>%
  group_by(County) %>%
  mutate(
    testDate = ymd_hms(testDate),
    confirmed_cases_7day_ma = (
      confirmed_cases +
        lag(confirmed_cases, order_by = testDate) +
        lag(confirmed_cases, n = 2, order_by = testDate) +
        lag(confirmed_cases, n = 3, order_by = testDate) +
        lag(confirmed_cases, n = 4, order_by = testDate) +
        lag(confirmed_cases, n = 5, order_by = testDate) +
        lag(confirmed_cases, n = 6, order_by = testDate)
    )/7,
    across(c(confirmed_cases, tested, deaths), ~.x - lag(.x, order_by = testDate), .names = "daily_{col}"),
    #across(tested:deaths, ~.x - lag(.x, order_by = testDate), .names = "daily_{col}"),
    daily_confirmed_cases_pc = daily_confirmed_cases/(population/100),
    daily_confirmed_cases_pc_7day_ma = (
      daily_confirmed_cases_pc +
        lag(daily_confirmed_cases_pc, order_by = testDate) +
        lag(daily_confirmed_cases_pc, n = 2, order_by = testDate) +
        lag(daily_confirmed_cases_pc, n = 3, order_by = testDate) +
        lag(daily_confirmed_cases_pc, n = 4, order_by = testDate) +
        lag(daily_confirmed_cases_pc, n = 5, order_by = testDate) +
        lag(daily_confirmed_cases_pc, n = 6, order_by = testDate)
    )/7,
    daily_deaths_pc = daily_deaths/(population/100),
    daily_deaths_pc_7day_ma = (
      daily_deaths_pc +
        lag(daily_deaths_pc, order_by = testDate) +
        lag(daily_deaths_pc, n = 2, order_by = testDate) +
        lag(daily_deaths_pc, n = 3, order_by = testDate) +
        lag(daily_deaths_pc, n = 4, order_by = testDate) +
        lag(daily_deaths_pc, n = 5, order_by = testDate) +
        lag(daily_deaths_pc, n = 6, order_by = testDate)
    )/7,
    daily_positive_rate = daily_confirmed_cases/daily_tested,
    daily_positive_rate_7day_ma = (
      daily_positive_rate +
        lag(daily_positive_rate, order_by = testDate) +
        lag(daily_positive_rate, n = 2, order_by = testDate) +
        lag(daily_positive_rate, n = 3, order_by = testDate) +
        lag(daily_positive_rate, n = 4, order_by = testDate) +
        lag(daily_positive_rate, n = 5, order_by = testDate) +
        lag(daily_positive_rate, n = 6, order_by = testDate)
    )/7,
    weekly_cases_pc = (
      daily_confirmed_cases +
        lag(daily_confirmed_cases, order_by = testDate) +
        lag(daily_confirmed_cases, n = 2, order_by = testDate) +
        lag(daily_confirmed_cases, n = 3, order_by = testDate) +
        lag(daily_confirmed_cases, n = 4, order_by = testDate) +
        lag(daily_confirmed_cases, n = 5, order_by = testDate) +
        lag(daily_confirmed_cases, n = 6, order_by = testDate)
    )/(population/100)
  ) %>%
  ungroup()

# Set today's date
today.county <- ymd(max(county_data$testDate))
today.county <- format(today.county,"%B %d, %Y")

# Export data to csv for archive
write_csv(x = select(
  county_data,
  -c(confirmed_cases_7day_ma, daily_confirmed_cases_pc, daily_confirmed_cases_pc_7day_ma,
     daily_deaths_pc, daily_deaths_pc_7day_ma, daily_positive_rate,
     daily_positive_rate_7day_ma, weekly_cases_pc)
),
file = "il-covid-county.csv"
)

# Reform county-level vax data
county_vaccine_data <- county_vaccine_data %>% 
  rename(
  County = CountyName
) %>%
  mutate(
    # 2020 Census Population Estimates
    population = case_when(
      County == "Illinois" ~ 12587.53,
      County == "Adams" ~ 64.783,
      County == "Alexander" ~ 5.497,
      County == "Bond" ~ 16.262,
      County == "Boone" ~ 52.777,
      County == "Brown" ~ 6.546,
      County == "Bureau" ~ 32.303,
      County == "Calhoun" ~ 4.616,
      County == "Carroll" ~ 14.241,
      County == "Cass" ~ 11.925,
      County == "Champaign" ~ 209.192,
      County == "Chicago" ~ 2677.643,
      County == "Christian" ~ 32.075,
      County == "Clark" ~ 15.268,
      County == "Clay" ~ 13.079,
      County == "Clinton" ~ 37.398,
      County == "Coles" ~ 50.383,
      County == "Cook" ~ 2430.641,
      County == "Crawford" ~ 18.512,
      County == "Cumberland" ~ 10.649,
      County == "DeKalb" ~ 104.491,
      County == "De Witt" ~ 15.368,
      County == "Douglas" ~ 19.51,
      County == "DuPage" ~ 917.481,
      County == "Edgar" ~ 16.858,
      County == "Edwards" ~ 6.356,
      County == "Effingham" ~ 34.065,
      County == "Fayette" ~ 21.264,
      County == "Ford" ~ 12.949,
      County == "Franklin" ~ 38.06,
      County == "Fulton" ~ 33.69,
      County == "Gallatin" ~ 4.793,
      County == "Greene" ~ 12.702,
      County == "Grundy" ~ 50.993,
      County == "Hamilton" ~ 8.084,
      County == "Hancock" ~ 17.422,
      County == "Hardin" ~ 3.808,
      County == "Henderson" ~ 6.535,
      County == "Henry" ~ 48.411,
      County == "Iroquois" ~ 26.711,
      County == "Jackson" ~ 56.675,
      County == "Jasper" ~ 9.465,
      County == "Jefferson" ~ 37.235,
      County == "Jersey" ~ 21.616,
      County == "Jo Daviess" ~ 21.239,
      County == "Johnson" ~ 12.358,
      County == "Kane" ~ 531.01,
      County == "Kankakee" ~ 108.594,
      County == "Kendall" ~ 130.638,
      County == "Knox" ~ 49.053,
      County == "Lake" ~ 693.593,
      County == "LaSalle" ~ 107.571,
      County == "Lawrence" ~ 15.467,
      County == "Lee" ~ 33.647,
      County == "Livingston" ~ 35.414,
      County == "Logan" ~ 28.383,
      County == "McDonough" ~ 29.295,
      County == "McHenry" ~ 305.888,
      County == "McLean" ~ 171.256,
      County == "Macon" ~ 103.015,
      County == "Macoupin" ~ 44.567,
      County == "Madison" ~ 262.635,
      County == "Marion" ~ 37.045,
      County == "Marshall" ~ 11.309,
      County == "Mason" ~ 13.173,
      County == "Massac" ~ 13.636,
      County == "Menard" ~ 12.068,
      County == "Mercer" ~ 15.225,
      County == "Monroe" ~ 34.739,
      County == "Montgomery" ~ 28.045,
      County == "Morgan" ~ 33.4,
      County == "Moultrie" ~ 14.347,
      County == "Ogle" ~ 50.306,
      County == "Peoria" ~ 177.652,
      County == "Perry" ~ 20.664,
      County == "Piatt" ~ 16.355,
      County == "Pike" ~ 15.239,
      County == "Pope" ~ 4.142,
      County == "Pulaski" ~ 5.201,
      County == "Putnam" ~ 5.716,
      County == "Randolph" ~ 31.351,
      County == "Richland" ~ 15.507,
      County == "Rock Island" ~ 140.907,
      County == "St. Clair" ~ 258.046,
      County == "Saline" ~ 23.182,
      County == "Sangamon" ~ 193.882,
      County == "Schuyler" ~ 6.738,
      County == "Scott" ~ 4.95,
      County == "Shelby" ~ 21.299,
      County == "Stark" ~ 5.262,
      County == "Stephenson" ~ 43.831,
      County == "Tazewell" ~ 130.777,
      County == "Union" ~ 16.498,
      County == "Vermilion" ~ 74.855,
      County == "Wabash" ~ 11.19,
      County == "Warren" ~ 16.696,
      County == "Washington" ~ 13.764,
      County == "Wayne" ~ 16.031,
      County == "White" ~ 13.364,
      County == "Whiteside" ~ 54.656,
      County == "Will" ~ 688.726,
      County == "Williamson" ~ 66.415,
      County == "Winnebago" ~ 281.295,
      County == "Woodford" ~ 38.091
    )
  ) %>%
  group_by(County) %>%
  mutate(
    Report_Date = ymd_hms(Report_Date),
    AdministeredPop = AdministeredCountChange/population,
    AdministeredPop_7day_ma = (
      AdministeredPop +
        lag(AdministeredPop, order_by = Report_Date) +
        lag(AdministeredPop, n = 2, order_by = Report_Date) +
        lag(AdministeredPop, n = 3, order_by = Report_Date) +
        lag(AdministeredPop, n = 4, order_by = Report_Date) +
        lag(AdministeredPop, n = 5, order_by = Report_Date) +
        lag(AdministeredPop, n = 6, order_by = Report_Date)
    )/7,
  ) %>%
  ungroup()

write_csv(x = select(
  county_vaccine_data,
  -c(population, AdministeredPop, AdministeredPop_7day_ma)
),
file = "il-covid-vaccine-county.csv"
)

# Set today's date
today.county.vax <- ymd(max(county_vaccine_data$Report_Date))
today.county.vax <- format(today.county.vax,"%B %d, %Y")


d_ends <- region_data %>%
  group_by(RegionID) %>%
  top_n(1, ymd_hms(ReportDate)) %>%
  pull(TestPositivity_RollingAvg)

# Set today's date
today.region <- ymd_hms(max(region_data$ReportDate))
today.region <- format(today.region,"%B %d, %Y")

# County Data Heatmap
county_data_heatmap <- county_data %>%
  mutate(
    daily_confirmed_cases_pc = replace(daily_confirmed_cases_pc, daily_confirmed_cases_pc < 0, 0)
  )

pretty.breaks <- c(10, 20, 30, 40)
# find min and max values of pop growth
minVal <- min(county_data_heatmap$daily_confirmed_cases_pc, na.rm = T)
maxVal <- round(max(county_data_heatmap$daily_confirmed_cases_pc, na.rm = T))
# compute pop growth labels
labels <- c()
brks <- c(minVal, pretty.breaks, maxVal)
# round the labels (actually, only the extremes)
labels <- c()
for(idx in 1:length(brks)){
  labels <- c(labels, paste0(round(brks[idx], 2),
                             " – ",
                             round(brks[idx + 1], 2)))
}
# Minus one label to remove the odd ending one
labels <- labels[1:length(labels)-1]
# Create new variable for fill
county_data_heatmap$brks <- cut(county_data_heatmap$daily_confirmed_cases_pc,
                        breaks = brks,
                        labels = labels,
                        include.lowest = T)