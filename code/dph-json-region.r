

region_data %>%
mutate(ReportDate = ymd_hms(ReportDate)) %>%
ggplot() +
  geom_line(aes(y=TestPositivity_RollingAvg, x = ymd(ReportDate), group = as.factor(RegionID), color = as.factor(RegionID)), size = 0.75, na.rm = TRUE) +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "1 month",
    expand = c(0,0)
  ) +
  scale_y_continuous(
    sec.axis = sec_axis(~ ., breaks = d_ends),
    breaks = c(0,2,4,6,8,10,12,14,16,18,20,22,24,26),
    labels = label_percent(scale=1)) +
  scale_color_viridis_d(
    name = "Region",
    guide = guide_legend(
      direction = "horizontal",
      title.position = "left",
      label.position = "bottom",
      label.hjust = 0.5,
      label.vjust = 1,
      nrow = 1
    )
  ) +
  # Theming
  labs(
    title="IL Regional COVID-19 Positivity Rate",
    subtitle=str_glue("7-day moving average, as of {today.region}"),
    caption="Author: Chris Goodman (@cbgoodman), Data: IL Department of Public Health (https://dph.illinois.gov/).",
    y=NULL,
    x=NULL) +
  theme_minimal(base_family="Public Sans Thin") +
  # legend formatting
  theme(legend.position="bottom") +
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
  ggsave("regional-positivity-rate.png", path="./images", width=10, height=8, units="in", dpi="retina", bg = "#ffffff")
