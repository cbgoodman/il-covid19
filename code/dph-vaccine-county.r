

# CMA Vaccine count
county_vaccine_data %>%
  filter(County %in% c("Chicago", "Cook", "DuPage", "Kane", "Kendall", "McHenry", "Lake", "Will")) %>%
  #filter(daily_confirmed_cases > 0 ) %>%
ggplot() +
  geom_bar(aes(y = AdministeredPop, x = ymd(Report_Date)), stat="identity", position = position_dodge(width=1), color = NA, fill="#617A89", alpha = 0.25) +
  #geom_text(aes(y = cases, x = ymd(date), label = comma(cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2, color="#2b2b2b") +
  geom_line(aes(y=AdministeredPop_7day_ma, x = ymd(Report_Date)), size = 0.5, na.rm = TRUE, color = "#617A89") +
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
  subtitle=str_glue("Number of administered vaccine doses per 1,000 residents and 7-day moving average, as of {today.county.vax}"),
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
ggsave("chi-covid-chg-vaccine.png", path="./images", width=10, height=8, units="in", dpi="retina", bg = "#ffffff")
