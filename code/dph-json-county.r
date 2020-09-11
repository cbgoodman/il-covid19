library(tidyverse)
library(jsonlite)
library(reshape2)
library(scales)
library(lubridate)

# Read in county-level data from DPH json file
json <- fromJSON("https://dph.illinois.gov//sitefiles/COVIDHistoricalTestResults.json")
# Save statewide date
json_dates <- as_tibble(json$historical_county$values)
json_dates <- json_dates %>% select(testDate) %>% mutate(testDate = mdy(testDate))
# Save county-level list as a dataset
json_values <- tibble(values = json$historical_county$values$values)

# Set today's date
today <- ymd(max(json_dates$testDate))
today <- format(today,"%B %d, %Y")

# 1. Merge two datasets together
# 2. Unnest the values list
# 3. Drop unnecessary vars
# 4. Convert daily lists to rows
# 5. Var formation
county_data <- bind_cols(json_dates, json_values)  %>%
  unnest_wider(values) %>%
  select(-c(lat,lon,negative)) %>%
  unnest(c(County, confirmed_cases, total_tested, deaths)) %>%
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
    confirmed_cases_7day_ma = (
      confirmed_cases +
      lag(confirmed_cases, order_by = testDate) +
      lag(confirmed_cases, n = 2, order_by = testDate) +
      lag(confirmed_cases, n = 3, order_by = testDate) +
      lag(confirmed_cases, n = 4, order_by = testDate) +
      lag(confirmed_cases, n = 5, order_by = testDate) +
      lag(confirmed_cases, n = 6, order_by = testDate)
    )/7,
    across(confirmed_cases:deaths, ~.x - lag(.x, order_by = testDate), .names = "daily_{col}"),
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
    daily_positive_rate = daily_confirmed_cases/daily_total_tested,
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

# Export data to csv for archive
write_csv(x = select(
  county_data,
  -c(confirmed_cases_7day_ma, daily_confirmed_cases_pc, daily_confirmed_cases_pc_7day_ma,
    daily_deaths_pc, daily_deaths_pc_7day_ma, daily_positive_rate,
    daily_positive_rate_7day_ma, weekly_cases_pc)
  ),
    path = "il-covid-county.csv"
  )

# CMA Daily case count
county_data %>%
  filter(County %in% c("Chicago", "Cook", "DuPage", "Kane", "Kendall", "McHenry", "Lake", "Will")) %>%
  filter(daily_confirmed_cases > 0 ) %>%
ggplot() +
  geom_bar(aes(y = daily_confirmed_cases_pc, x = ymd(testDate)), stat="identity", position = position_dodge(width=1), fill="#E69F00") +
  #geom_text(aes(y = cases, x = ymd(date), label = comma(cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2, color="#2b2b2b") +
  geom_line(aes(y=daily_confirmed_cases_pc_7day_ma, x = ymd(testDate)), size = 0.5, na.rm = TRUE, color = "#7F7F7F") +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "2 weeks",
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
ggsave("chi-covid-chg-cases.png", path="./images", width=10, height=8, units="in", dpi="retina")

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
  geom_bar(aes(y = daily_confirmed_cases_pc, x = ymd(testDate)), stat="identity", position = position_dodge(width=1), fill="#E69F00") +
  #geom_text(aes(y = cases, x = ymd(date), label = comma(cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2, color="#2b2b2b") +
  geom_line(aes(y=daily_confirmed_cases_pc_7day_ma, x = ymd(testDate)), size = 0.5, na.rm = TRUE, color = "#7F7F7F") +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "2 weeks",
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
ggsave("college-covid-chg-cases.png", path="./images", width=10, height=8, units="in", dpi="retina")
