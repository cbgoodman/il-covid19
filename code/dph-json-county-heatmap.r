

# CMA Daily case count
county_data_heatmap %>%
filter(!County %in% c("Illinois", "Suburban Cook", "Out Of State", "Unassigned")) %>%
filter(testDate>="2020-03-24") %>%
ggplot() +
  geom_tile(aes(y = fct_rev(as.factor(County)), x = ymd(testDate), fill = brks), height = 1) +
  geom_rect(aes(y = fct_rev(as.factor(County)), x = ymd(testDate), xmin = ymd("2020-03-24") , ymin = -Inf , xmax = ymd("2020-05-29"), ymax = Inf) , color = "white", alpha=0) +
  annotate(
    "text",
    x = ymd("2020-05-30"),
    y = "Fulton",
    label = "Shelter in place\norder ends",
    color = "white",
    family="Public Sans SemiBold",
    hjust=0,
    size=2) +
  scale_x_date(
    date_labels = "%Y-%m-%d",
    date_breaks = "1 month",
    expand = c(0,0.5)
  ) +
  scale_fill_viridis(
    na.translate=FALSE,
    option = "plasma",
    #name = "Daily case count per 1,000 residents",
    alpha = 1,
    discrete = T,
    direction = 1,
    begin=0,
    end=1,
    guide = guide_legend(
      #keyheight = unit(5, units = "mm"),
      title.position = 'top',
      reverse = F
  )) +
# Theming
labs(
  title="COVID-19 Cases are more widespread",
  subtitle=str_glue("Number of confirmed cases per 100,000 residents by county as of {today.county}"),
  caption="Author: Chris Goodman (@cbgoodman), Data: IL Department of Public Health (https://dph.illinois.gov/).",
  y=NULL,
  x=NULL) +
theme_minimal(base_family="Public Sans Thin") +
theme(
  legend.title = element_blank(),
  legend.position = "top",
  legend.text.align = 0,
  legend.title.align = 0.5
  ) +
# breathing room for the plot
theme(plot.margin=unit(rep(0.5, 4), "cm")) +
# format x-axis for 45 degree
theme(axis.text.x=element_text(size=6, hjust=0.95, vjust = 0.95, angle = 45)) +
# shrink y-axis
theme(axis.text.y=element_text(size=6)) +
theme(plot.title=element_text(family="Public Sans SemiBold", size=11, margin=margin(b=15))) +
# make the subtitle italic
theme(plot.subtitle=element_text(family="Public Sans Italic", size=9)) +
theme(plot.caption=element_text(size=8, hjust=0, margin=margin(t=15)))
ggsave("covid-heatmap.png", path="./images", width=8, height=10, units="in", dpi="retina", bg = "#ffffff")
