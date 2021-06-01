library(tidyverse)
library(jsonlite)
library(reshape2)
library(scales)
library(lubridate)
library(tidytext)

# Read in county-level data from DPH json file
illinois <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Illinois"))
adams <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Adams"))
alexander <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Alexander"))
bond <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Bond"))
boone <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Boone"))
brown <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Brown"))
bureau <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Bureau"))
calhoun <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Calhoun"))
carroll <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Carroll"))
cass <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Cass"))
champaign <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Champaign"))
chicago <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Chicago"))
christian <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Christian"))
clark <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Clark"))
clay <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Clay"))
clinton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Clinton"))
coles <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Coles"))
cook <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Cook"))
crawford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Crawford"))
cumberland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Cumberland"))
dekalb <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=DeKalb"))
dewitt <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=De%20Witt"))
douglas <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Douglas"))
dupage <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=DuPage"))
edgar <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Edgar"))
edwards <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Edwards"))
effingham <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Effingham"))
fayette <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Fayette"))
ford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Ford"))
franklin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Franklin"))
fulton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Fulton"))
gallatin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Gallatin"))
greene <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Greene"))
grundy <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Grundy"))
hamilton <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Hamilton"))
hancock <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Hancock"))
hardin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Hardin"))
henderson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Henderson"))
henry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Henry"))
iroquois <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Iroquois"))
jackson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Jackson"))
jasper <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Jasper"))
jefferson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Jefferson"))
jersey <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Jersey"))
jodaviess <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Jo%20Daviess"))
johnson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Johnson"))
kane <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Kane"))
kankakee <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Kankakee"))
kendall <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Kendall"))
knox <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Knox"))
lake <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Lake"))
lasalle <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=LaSalle"))
lawrence <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Lawrence"))
lee <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Lee"))
livingston <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Livingston"))
logan <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Logan"))
mcdonough <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=McDonough"))
mchenry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=McHenry"))
mclean <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=McLean"))
macon <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Macon"))
macoupin <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Macoupin"))
madison <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Madison"))
marion <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Marion"))
marshall <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Marshall"))
mason <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Mason"))
massac <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Massac"))
menard <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Menard"))
mercer <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Mercer"))
monroe <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Monroe"))
montgomery <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Montgomery"))
morgan <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Morgan"))
moultrie <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Moultrie"))
ogle <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Ogle"))
peoria <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Peoria"))
perry <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Perry"))
piatt <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Piatt"))
pike <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Pike"))
pope <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Pope"))
pulaski <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Pulaski"))
putnam <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Putnam"))
randolph <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Randolph"))
richland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Richland"))
rockisland <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Rock%20Island"))
stclair <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=St.%20Clair"))
saline <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Saline"))
sangamon <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Sangamon"))
schuyler <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Schuyler"))
scott <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Scott"))
shelby <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Shelby"))
stark <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Stark"))
stephenson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Stephenson"))
tazewell <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Tazewell"))
union <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Union"))
vermilion <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Vermilion"))
wabash <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Wabash"))
warren <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Warren"))
washington <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Washington"))
wayne <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Wayne"))
white <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=White"))
whiteside <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Whiteside"))
will <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Will"))
williamson <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Williamson"))
winnebago <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Winnebago"))
woodford <- data.frame(fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=Woodford"))

county_vaccine_data <- bind_rows(
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
today <- ymd(max(county_vaccine_data$Report_Date))
today <- format(today,"%B %d, %Y")

# CMA Vaccine count
county_vaccine_data %>%
  filter(County %in% c("Chicago", "Cook", "DuPage", "Kane", "Kendall", "McHenry", "Lake", "Will")) %>%
  #filter(daily_confirmed_cases > 0 ) %>%
ggplot() +
  geom_bar(aes(y = AdministeredPop, x = ymd(Report_Date)), stat="identity", position = position_dodge(width=1), fill="#E69F00") +
  #geom_text(aes(y = cases, x = ymd(date), label = comma(cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2, color="#2b2b2b") +
  geom_line(aes(y=AdministeredPop_7day_ma, x = ymd(Report_Date)), size = 0.5, na.rm = TRUE, color = "#7F7F7F") +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "1 month",
    expand = c(0,0.5)
  ) +
  scale_y_continuous(labels = comma) +
  facet_wrap(~County, nrow=2) +
# Theming
labs(
  title="Chicago Region COVID-19 Vaccine Administration",
  subtitle=str_glue("Number of administered vaccine doses per 1,000 residents and 7-day moving average, as of {today}"),
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
ggsave("chi-covid-chg-vaccine.png", path="./images", width=10, height=8, units="in", dpi="retina")
