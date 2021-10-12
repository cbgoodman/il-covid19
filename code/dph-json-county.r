library(tidyverse)
library(jsonlite)
library(reshape2)
library(scales)
library(lubridate)
library(tidytext)

# Read in county-level data from DPH json file
illinois <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Illinois"))
adams <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Adams"))
alexander <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Alexander"))
bond <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Bond"))
boone <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Boone"))
brown <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Brown"))
bureau <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Bureau"))
calhoun <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Calhoun"))
carroll <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Carroll"))
cass <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Cass"))
champaign <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Champaign"))
chicago <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Chicago"))
christian <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Christian"))
clark <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Clark"))
clay <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Clay"))
clinton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Clinton"))
coles <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Coles"))
cook <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Cook"))
crawford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Crawford"))
cumberland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Cumberland"))
dekalb <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=DeKalb"))
dewitt <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=De%20Witt"))
douglas <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Douglas"))
dupage <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=DuPage"))
edgar <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Edgar"))
edwards <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Edwards"))
effingham <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Effingham"))
fayette <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Fayette"))
ford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Ford"))
franklin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Franklin"))
fulton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Fulton"))
gallatin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Gallatin"))
greene <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Greene"))
grundy <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Grundy"))
hamilton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Hamilton"))
hancock <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Hancock"))
hardin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Hardin"))
henderson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Henderson"))
henry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Henry"))
iroquois <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Iroquois"))
jackson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Jackson"))
jasper <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Jasper"))
jefferson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Jefferson"))
jersey <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Jersey"))
jodaviess <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Jo%20Daviess"))
johnson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Johnson"))
kane <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Kane"))
kankakee <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Kankakee"))
kendall <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Kendall"))
knox <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Knox"))
lake <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Lake"))
lasalle <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=LaSalle"))
lawrence <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Lawrence"))
lee <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Lee"))
livingston <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Livingston"))
logan <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Logan"))
mcdonough <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=McDonough"))
mchenry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=McHenry"))
mclean <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=McLean"))
macon <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Macon"))
macoupin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Macoupin"))
madison <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Madison"))
marion <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Marion"))
marshall <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Marshall"))
mason <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Mason"))
massac <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Massac"))
menard <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Menard"))
mercer <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Mercer"))
monroe <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Monroe"))
montgomery <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Montgomery"))
morgan <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Morgan"))
moultrie <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Moultrie"))
ogle <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Ogle"))
peoria <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Peoria"))
perry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Perry"))
piatt <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Piatt"))
pike <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Pike"))
pope <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Pope"))
pulaski <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Pulaski"))
putnam <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Putnam"))
randolph <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Randolph"))
richland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Richland"))
rockisland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Rock%20Island"))
stclair <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=St.%20Clair"))
saline <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Saline"))
sangamon <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Sangamon"))
schuyler <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Schuyler"))
scott <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Scott"))
shelby <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Shelby"))
stark <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Stark"))
stephenson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Stephenson"))
tazewell <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Tazewell"))
union <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Union"))
vermilion <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Vermilion"))
wabash <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Wabash"))
warren <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Warren"))
washington <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Washington"))
wayne <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Wayne"))
white <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=White"))
whiteside <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Whiteside"))
will <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Will"))
williamson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Williamson"))
winnebago <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Winnebago"))
woodford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetCountyHistorical?countyName=Woodford"))

county_data <- bind_rows(
  illinois,
  adams,
  alexander,
  bond,
  boone,
  brown,
  bureau,
  calhoun,
  carroll,
  cass,
  champaign,
  chicago,
  christian,
  clark,
  clay,
  clinton,
  coles,
  cook,
  crawford,
  cumberland,
  dekalb,
  dewitt,
  douglas,
  dupage,
  edgar,
  edwards,
  effingham,
  fayette,
  ford,
  franklin,
  fulton,
  gallatin,
  greene,
  grundy,
  hamilton,
  hancock,
  hardin,
  henderson,
  henry,
  iroquois,
  jackson,
  jasper,
  jefferson,
  jersey,
  jodaviess,
  johnson,
  kane,
  kankakee,
  kendall,
  knox,
  lake,
  lasalle,
  lawrence,
  lee,
  livingston,
  logan,
  mcdonough,
  mchenry,
  mclean,
  macon,
  macoupin,
  madison,
  marion,
  marshall,
  mason,
  massac,
  menard,
  mercer,
  monroe,
  montgomery,
  morgan,
  moultrie,
  ogle,
  peoria,
  perry,
  piatt,
  pike,
  pope,
  pulaski,
  putnam,
  randolph,
  richland,
  rockisland,
  stclair,
  saline,
  sangamon,
  schuyler,
  scott,
  shelby,
  stark,
  stephenson,
  tazewell,
  union,
  vermilion,
  wabash,
  warren,
  washington,
  wayne,
  white,
  whiteside,
  will,
  williamson,
  winnebago,
  woodford
) %>%
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
today <- ymd(max(county_data$testDate))
today <- format(today,"%B %d, %Y")

# Export data to csv for archive
write_csv(x = select(
  county_data,
  -c(confirmed_cases_7day_ma, daily_confirmed_cases_pc, daily_confirmed_cases_pc_7day_ma,
    daily_deaths_pc, daily_deaths_pc_7day_ma, daily_positive_rate,
    daily_positive_rate_7day_ma, weekly_cases_pc)
  ),
    file = "il-covid-county.csv"
  )

# CMA Daily case count
county_data %>%
  filter(County %in% c("Chicago", "Cook", "DuPage", "Kane", "Kendall", "McHenry", "Lake", "Will")) %>%
  filter(daily_confirmed_cases > 0 ) %>%
ggplot() +
  geom_bar(aes(y = daily_confirmed_cases_pc, x = ymd(testDate)), stat="identity", position = position_dodge(width=1), color=NA, fill="#617A89", alpha = 0.25) +
  #geom_text(aes(y = cases, x = ymd(date), label = comma(cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2, color="#2b2b2b") +
  geom_line(aes(y=daily_confirmed_cases_pc_7day_ma, x = ymd(testDate)), size = 0.5, na.rm = TRUE, color = "#617A89") +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "3 months",
    expand = c(0,0.5)
  ) +
  scale_y_continuous(labels = comma) +
  facet_wrap(~County, nrow=2) +
# Theming
labs(
  title="Chicago Region COVID-19 Case Count",
  subtitle=str_glue("Number of confirmed cases per 100,000 residents and 7-day moving average, as of {today}"),
  caption="Author: Chris Goodman (@cbgoodman), Data: IL Department of Public Health (https://dph.illinois.gov/).",
  y=NULL,
  x=NULL) +
theme_minimal(base_family="Public Sans Thin") +
# light, dotted major y-grid lines only
theme(panel.grid=element_line())+
theme(panel.grid.major.y=element_line(color="#2b2b2b", linetype="dotted", size=0.15))+
theme(panel.grid.major.x=element_blank())+
theme(panel.grid.minor.x=element_blank())+
theme(panel.grid.minor.y=element_blank())+
# light x-axis line only
theme(axis.line=element_line())+
theme(axis.line.y=element_blank())+
theme(axis.line.x=element_blank())+
# tick styling
theme(axis.ticks=element_line())+
theme(axis.ticks.x=element_blank())+
theme(axis.ticks.y=element_blank())+
theme(axis.ticks.length=unit(5, "pt"))+
# x-axis labels
theme(axis.text.x=element_text(size=8, hjust=0.95, vjust = 0.5, angle = 90))+
# breathing room for the plot
theme(plot.margin=unit(rep(0.5, 4), "cm"))+
# move the y-axis tick labels over a bit
#theme(axis.text.y=element_text(margin=margin(r=-5)))+
#theme(axis.text.x=element_text(margin=margin(r=-5)))+
# make the plot title bold and modify the bottom margin a bit
theme(plot.title=element_text(family="Public Sans SemiBold", size=11, margin=margin(b=15)))+
# make the subtitle italic
theme(plot.subtitle=element_text(family="Public Sans Italic", size=9))+
theme(plot.caption=element_text(size=8, hjust=0, margin=margin(t=15)))
ggsave("chi-covid-chg-cases.png", path="./images", width=10, height=8, units="in", dpi="retina", bg = "#ffffff")

unis <- c(
  "Coles County\nEastern Illinois University",
  "McLean County\nIllinois State University",
  "Sangamon County\nUniversity of Illinois - Springfield",
  "Champaign County\nUniversity of Illinois - Urbana Champaign",
  "DeKalb County\nNorthern Illinois University",
  "Jackson County\nSouthern Illinois Unversity - Carbondale",
  "Madison County\nSouthern Illinois University - Edwardsville",
  "McDonough County\nWestern Illinois University"
)
names(unis) <- c("Coles", "McLean", "Sangamon", "Champaign", "DeKalb", "Jackson", "Madison", "McDonough")
# College Counties Daily case count
county_data %>%
  filter(County %in% c("Coles", "McLean", "Sangamon", "Champaign", "DeKalb", "Jackson", "Madison", "McDonough")) %>%
  filter(daily_confirmed_cases > 0 ) %>%
ggplot() +
  geom_bar(aes(y = daily_confirmed_cases_pc, x = ymd(testDate)), stat="identity", position = position_dodge(width=1), color=NA, fill="#617A89", alpha = 0.25) +
  #geom_text(aes(y = cases, x = ymd(date), label = comma(cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2, color="#2b2b2b") +
  geom_line(aes(y=daily_confirmed_cases_pc_7day_ma, x = ymd(testDate)), size = 0.5, na.rm = TRUE, color = "#617A89") +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "3 months",
    expand = c(0,0.5)
  ) +
  scale_y_continuous(labels = comma) +
  facet_wrap(~County, nrow=2, labeller = labeller(County = unis)) +
# Theming
labs(
  title="Illinois 4-Year State University Counties COVID-19 Case Count",
  subtitle=str_glue("Number of confirmed cases per 100,000 residents and 7-day moving average, as of {today}"),
  caption="Author: Chris Goodman (@cbgoodman), Data: IL Department of Public Health (https://dph.illinois.gov/).",
  y=NULL,
  x=NULL) +
theme_minimal(base_family="Public Sans Thin") +
# light, dotted major y-grid lines only
theme(panel.grid=element_line())+
theme(panel.grid.major.y=element_line(color="#2b2b2b", linetype="dotted", size=0.15))+
theme(panel.grid.major.x=element_blank())+
theme(panel.grid.minor.x=element_blank())+
theme(panel.grid.minor.y=element_blank())+
# light x-axis line only
theme(axis.line=element_line())+
theme(axis.line.y=element_blank())+
theme(axis.line.x=element_blank())+
# tick styling
theme(axis.ticks=element_line())+
theme(axis.ticks.x=element_blank())+
theme(axis.ticks.y=element_blank())+
theme(axis.ticks.length=unit(5, "pt"))+
# x-axis labels
theme(axis.text.x=element_text(size=8, hjust=0.95, vjust = 0.5, angle = 90))+
# breathing room for the plot
theme(plot.margin=unit(rep(0.5, 4), "cm"))+
# move the y-axis tick labels over a bit
#theme(axis.text.y=element_text(margin=margin(r=-5)))+
#theme(axis.text.x=element_text(margin=margin(r=-5)))+
# make the plot title bold and modify the bottom margin a bit
theme(plot.title=element_text(family="Public Sans SemiBold", size=11, margin=margin(b=15)))+
# make the subtitle italic
theme(plot.subtitle=element_text(family="Public Sans Italic", size=9))+
theme(plot.caption=element_text(size=8, hjust=0, margin=margin(t=15)))
ggsave("college-covid-chg-cases.png", path="./images", width=10, height=8, units="in", dpi="retina", bg = "#ffffff")

#########################
# Experimental
#########################
# Create weekly data to mirror state community spread data
#weekly_data <- county_data %>%
#  select(testDate, County, daily_confirmed_cases, daily_total_tested, daily_deaths, population) %>%
#  mutate(
#    week = epiweek(testDate),
#    week_date = paste(
#      floor_date(testDate, unit = "weeks"), "-", ceiling_date(testDate, unit = "weeks")-1
#    )
#  ) %>%
#  group_by(County, week) %>%
#  mutate(
#    daily_confirmed_cases = if_else(daily_confirmed_cases < 0,0, as.numeric(daily_confirmed_cases)),
#    daily_total_tested = as.numeric(daily_total_tested),
#    daily_deaths = as.numeric(daily_deaths),
#    County = as.factor(County)
#  ) %>%
#  summarize(
#    weekly_confirmed_cases = sum(daily_confirmed_cases),
#    weekly_total_tested = sum(daily_total_tested),
#    weekly_deaths = sum(daily_deaths),
#    population = first(population),
#    week_date = first(week_date)
#  ) %>%
#  mutate(
#    weekly_confirmed_cases_pc = weekly_confirmed_cases/(population/100),
#    weekly_chg_deaths = weekly_deaths-lag(weekly_deaths, order_by = week),
#    weekly_positive_rate = weekly_confirmed_cases/weekly_total_tested,
#    cases_target = case_when(weekly_confirmed_cases_pc<=50 ~ "Target", TRUE ~ "Warning"),
#    deaths_target = case_when(weekly_chg_deaths<= 0 ~ "Target", TRUE ~ "Warning"),
#    positve_target = case_when(weekly_positive_rate<=0.08 ~ "Target", TRUE ~ "Warning")
#  ) %>%
#  ungroup() %>%
#  mutate(
#    County=reorder_within(County,-weekly_confirmed_cases_pc, week)
#  )
#
#weekly_data %>%
#  filter(!County %in% c("Illinois", "Suburban Cook", "Out Of State", "Unassigned")) %>%
#  filter(
#    week == max(week)-1 |
#    week == max(week)-2 |
#    week == max(week)-3 |
#    week == max(week)-4 |
#    week == max(week)-5 |
#    week == max(week)-6
#  ) %>%
#  ggplot() +
#  geom_bar(
#    aes(y = weekly_confirmed_cases_pc, x = County, fill = as.factor(cases_target)),
#    stat="identity",
#    width = 0.75,
#    position = position_dodge(width = 1)
#  ) +
#  scale_y_continuous(labels = comma) +
#  facet_wrap(~week_date, nrow=2, scales = "free_x") +
#  # Theming
#  labs(
#    title="Illinois 4-Year State University Counties COVID-19 Case Count",
#    subtitle=str_glue("Number of confirmed cases per 100,000 residents and 7-day moving average, as of {today}"),
#    caption="Author: Chris Goodman (@cbgoodman), Data: IL Department of Public Health (https://dph.illinois.gov/).",
#    y=NULL,
#    x=NULL) +
#  theme_minimal(base_family="Public Sans Thin") +
#  # light, dotted major y-grid lines only
#  theme(panel.grid=element_line())+
#  theme(panel.grid.major.y=element_line(color="#2b2b2b", linetype="dotted", size=0.15))+
#  theme(panel.grid.major.x=element_blank())+
#  theme(panel.grid.minor.x=element_blank())+
#  theme(panel.grid.minor.y=element_blank())+
#  # light x-axis line only
#  theme(axis.line=element_line())+
#  theme(axis.line.y=element_blank())+
#  theme(axis.line.x=element_blank())+
#  # tick styling
#  theme(axis.ticks=element_line())+
#  theme(axis.ticks.x=element_blank())+
#  theme(axis.ticks.y=element_blank())+
#  theme(axis.ticks.length=unit(5, "pt"))+
#  # x-axis labels
#  theme(axis.text.x=element_blank())+
#  # breathing room for the plot
#  theme(plot.margin=unit(rep(0.5, 4), "cm"))+
#  # move the y-axis tick labels over a bit
#  #theme(axis.text.y=element_text(margin=margin(r=-5)))+
#  #theme(axis.text.x=element_text(margin=margin(r=-5)))+
#  # make the plot title bold and modify the bottom margin a bit
#  theme(plot.title=element_text(family="Public Sans SemiBold", size=11, margin=margin(b=15)))+
#  # make the subtitle italic
#  theme(plot.subtitle=element_text(family="Public Sans Italic", size=9))+
#  theme(plot.caption=element_text(size=8, hjust=0, margin=margin(t=15)))
