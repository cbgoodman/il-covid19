# Create two figures measuring total confirmed cases and daily change in
# confirmed cases of COVID-19 in Illinois

# Cases plot
il.cases <- ggplot(stateDF) +
  geom_bar(aes(y = confirmed_cases, x = ymd(date)), stat="identity", fill="#E69F00") +
  #geom_text(aes(y = cases, x = ymd(date), label = comma(cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2, color="#2b2b2b") +
  geom_line(aes(y=confirmed_cases_7day_ma, x = ymd(date)), size = 1, na.rm = TRUE, color = "#7F7F7F") +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "3 days",
    expand = c(0,0.5)
  ) +
  scale_y_continuous(labels = comma) +
# Theming
labs(
  title="Illinois COVID-19 Case Count",
  subtitle=str_glue("Number of confirmed cases and 7-day moving average, as of {today}"),
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
ggsave(plot=il.cases, "il-covid-cases.png", path="./images", width=10, height=6, units="in", dpi="retina")


# Change in Cases plot
il.chg.cases <- ggplot(stateDF) +
  geom_bar(aes(y = daily_confirmed_cases, x = ymd(date)), stat="identity", fill="#E69F00") +
  #geom_text(aes(y = chg.cases, x = ymd(date), label = comma(chg.cases, accuracy=1)), position=position_dodge(width=0.9), vjust=-0.25,
  #family="Public Sans Thin", lineheight=0.95, size=2.25, color="#2b2b2b") +
  geom_line(aes(y=daily_confirmed_cases_7day_ma, x = ymd(date)), size = 1, na.rm = TRUE, color = "#7F7F7F") +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "3 days",
    expand = c(0,0.25)
  ) +
  scale_y_continuous(labels = comma) +
# Theming
labs(
  title="Illinois COVID-19 Case Count",
  subtitle=str_glue("Change in the number of confirmed cases and 7-day moving average, as of {today}"),
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
ggsave(plot=il.chg.cases, "il-covid-chg-cases.png", path="./images", width=10, height=6, units="in", dpi="retina")
