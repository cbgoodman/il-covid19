library(tidyverse)
library(jsonlite)
library(reshape2)
library(scales)
library(lubridate)

# Read in hospitalization data from DPH json file
#json <- fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVID/GetHospitalizationResults")
json <- fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetHospitalUtilizationResults")
# Save statewide date
json_data <- as_tibble(json$HospitalUtilizationResults)
# Create variables
json_data <- json %>%
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


json_dates <- json %>% select(ReportDate) %>% mutate(ReportDate = ymd_hms(ReportDate))
today <- ymd(max(json_dates$ReportDate))
today <- format(today,"%B %d, %Y")

# Hospitalization
json_data %>%
ggplot() +
  geom_bar(aes(y = TotalInUseBedsCOVID, x = ymd(ReportDate)), stat="identity", fill="#E69F00") +
  #geom_text(aes(y = cases, x = ymd(date), label = comma(cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2, color="#2b2b2b") +
  geom_line(aes(y=TotalInUseBedsCOVID_7day_ma, x = ymd(ReportDate)), size = 1, na.rm = TRUE, color = "#7F7F7F") +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "2 weeks",
    expand = c(0,0.5)
  ) +
  scale_y_continuous(labels = comma) +
# Theming
labs(
  title="Hospital utilization in Illinois",
  subtitle=str_glue("Total hospital beds in use by COVID-19 patients and 7-day moving average, as of {today}"),
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
ggsave("hospitalization.png", path="./images", width=10, height=8, units="in", dpi="retina")

# Hospital Utilization Rate
json_data %>%
ggplot() +
  geom_line(aes(y = hospitalutilizationCOVID, x = ymd(ReportDate)), size = 1, na.rm = TRUE, color="#E69F00") +
  #geom_text(aes(y = cases, x = ymd(date), label = comma(cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2, color="#2b2b2b") +
  geom_line(aes(y=hospitalutilizationCOVID_7day_ma, x = ymd(ReportDate)), size = 1, na.rm = TRUE, color = "#7F7F7F") +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "2 weeks",
    expand = c(0,0.5)
  ) +
  scale_y_continuous(labels = percent) +
# Theming
labs(
  title="Hospital utilization rate in Illinois",
  subtitle=str_glue("Total hospital beds in use by COVID-19 patients divided by total hospital beds (orange) and 7-day moving average (grey), as of {today}"),
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
ggsave("hospital_util_rate.png", path="./images", width=10, height=8, units="in", dpi="retina")

# ICU Usage
json_data %>%
ggplot() +
  geom_bar(aes(y = ICUInUseBedsCOVID, x = ymd(ReportDate)), stat="identity", fill="#E69F00") +
  #geom_text(aes(y = cases, x = ymd(date), label = comma(cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2, color="#2b2b2b") +
  geom_line(aes(y=ICUInUseBedsCOVID_7day_ma, x = ymd(ReportDate)), size = 1, na.rm = TRUE, color = "#7F7F7F") +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "2 weeks",
    expand = c(0,0.5)
  ) +
  scale_y_continuous(labels = comma) +
# Theming
labs(
  title="ICU utilization in Illinois",
  subtitle=str_glue("Total ICU beds in use by COVID-19 patients and 7-day moving average, as of {today}"),
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
ggsave("icu.png", path="./images", width=10, height=8, units="in", dpi="retina")

# ICU Utilization Rate
json_data %>%
ggplot() +
  geom_line(aes(y = icuutilizationCOVID, x = ymd(ReportDate)), size = 1, na.rm = TRUE, color ="#E69F00") +
  #geom_text(aes(y = cases, x = ymd(date), label = comma(cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2, color="#2b2b2b") +
  geom_line(aes(y=icuutilizationCOVID_7day_ma, x = ymd(ReportDate)), size = 1, na.rm = TRUE, color = "#7F7F7F") +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "2 weeks",
    expand = c(0,0.5)
  ) +
  scale_y_continuous(labels = percent) +
# Theming
labs(
  title="ICU utilization rate in Illinois",
  subtitle=str_glue("Total ICU beds in use by COVID-19 patients divided by total ICU beds (orange) and 7-day moving average (grey), as of {today}"),
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
ggsave("icu_util_rate.png", path="./images", width=10, height=8, units="in", dpi="retina")
