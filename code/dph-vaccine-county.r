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
  population = case_when(
    County == "Illinois" ~ 12671.821,
    County == "Adams" ~ 65.435,
    County == "Alexander" ~ 5.761,
    County == "Bond" ~ 16.426,
    County == "Boone" ~ 53.544,
    County == "Brown" ~ 6.578,
    County == "Bureau" ~ 32.628,
    County == "Calhoun" ~ 4.739,
    County == "Carroll" ~ 14.305,
    County == "Cass" ~ 12.147,
    County == "Champaign" ~ 209.689,
    County == "Chicago" ~ 2693.976,
    County == "Christian" ~ 32.304,
    County == "Clark" ~ 15.441,
    County == "Clay" ~ 13.184,
    County == "Clinton" ~ 37.562,
    County == "Coles" ~ 50.621,
    County == "Cook" ~ 2456.257,
    County == "Crawford" ~ 18.667,
    County == "Cumberland" ~ 10.766,
    County == "DeKalb" ~ 104.897,
    County == "De Witt" ~ 15.638,
    County == "Douglas" ~ 19.465,
    County == "DuPage" ~ 922.921,
    County == "Edgar" ~ 17.161,
    County == "Edwards" ~ 6.395,
    County == "Effingham" ~ 34.008,
    County == "Fayette" ~ 21.336,
    County == "Ford" ~ 12.961,
    County == "Franklin" ~ 38.469,
    County == "Fulton" ~ 34.34,
    County == "Gallatin" ~ 4.828,
    County == "Greene" ~ 12.969,
    County == "Grundy" ~ 51.054,
    County == "Hamilton" ~ 8.116,
    County == "Hancock" ~ 17.708,
    County == "Hardin" ~ 3.821,
    County == "Henderson" ~ 6.646,
    County == "Henry" ~ 48.913,
    County == "Iroquois" ~ 27.114,
    County == "Jackson" ~ 56.75,
    County == "Jasper" ~ 9.61,
    County == "Jefferson" ~ 37.684,
    County == "Jersey" ~ 21.773,
    County == "Jo Daviess" ~ 21.235,
    County == "Johnson" ~ 12.417,
    County == "Kane" ~ 532.403,
    County == "Kankakee" ~ 109.862,
    County == "Kendall" ~ 128.99,
    County == "Knox" ~ 49.699,
    County == "Lake" ~ 696.535,
    County == "LaSalle" ~ 108.669,
    County == "Lawrence" ~ 15.678,
    County == "Lee" ~ 34.096,
    County == "Livingston" ~ 35.648,
    County == "Logan" ~ 28.618,
    County == "McDonough" ~ 29.682,
    County == "McHenry" ~ 307.774,
    County == "McLean" ~ 171.517,
    County == "Macon" ~ 104.009,
    County == "Macoupin" ~ 44.926,
    County == "Madison" ~ 262.966,
    County == "Marion" ~ 37.205,
    County == "Marshall" ~ 11.438,
    County == "Mason" ~ 13.359,
    County == "Massac" ~ 13.772,
    County == "Menard" ~ 12.196,
    County == "Mercer" ~ 15.437,
    County == "Monroe" ~ 34.637,
    County == "Montgomery" ~ 28.414,
    County == "Morgan" ~ 33.658,
    County == "Moultrie" ~ 14.501,
    County == "Ogle" ~ 50.643,
    County == "Peoria" ~ 179.179,
    County == "Perry" ~ 20.916,
    County == "Piatt" ~ 16.344,
    County == "Pike" ~ 15.561,
    County == "Pope" ~ 4.177,
    County == "Pulaski" ~ 5.335,
    County == "Putnam" ~ 5.739,
    County == "Randolph" ~ 31.782,
    County == "Richland" ~ 15.513,
    County == "Rock Island" ~ 141.879,
    County == "St. Clair" ~ 259.686,
    County == "Saline" ~ 23.491,
    County == "Sangamon" ~ 194.672,
    County == "Schuyler" ~ 6.768,
    County == "Scott" ~ 4.951,
    County == "Shelby" ~ 21.634,
    County == "Stark" ~ 5.342,
    County == "Stephenson" ~ 44.498,
    County == "Tazewell" ~ 131.803,
    County == "Union" ~ 16.653,
    County == "Vermilion" ~ 75.758,
    County == "Wabash" ~ 11.52,
    County == "Warren" ~ 16.844,
    County == "Washington" ~ 13.887,
    County == "Wayne" ~ 16.215,
    County == "White" ~ 13.537,
    County == "Whiteside" ~ 55.175,
    County == "Will" ~ 690.743,
    County == "Williamson" ~ 66.597,
    County == "Winnebago" ~ 282.572,
    County == "Woodford" ~  38.459
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
    path = "il-covid-vaccine-county.csv"
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
