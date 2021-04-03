if (!require('maps')) install.packages('maps'); library('maps')
if (!require('sf')) install.packages('sf'); library('sf')
if (!require('rnaturalearth')) install.packages('rnaturalearth'); library('rnaturalearth')
if (!require('here')) install.packages('here'): library('here')
if (!require('rnaturalearthdata')) install.packages('rnaturalearthdata'); library('rnaturalearthdata')
if (!require('ggplot2')) install.packages('ggplot2'); library('ggplot2')
if (!require('ggspatial')) install.packages('ggspatial'); library('ggspatial')
if (!require('rgeos')) install.packages('rgeos'); library('rgeos')
if (!require('cowplot')) install.packages('cowplot'); library('cowplot')
if (!require('here')) install.packages('here'); library('here')


# Load world data
world <- ne_countries(scale = "medium", returnclass = "sf")

# Extract the Mediterranean
mediterranean <- ggplot(data = world) +
  geom_sf(color = NA) +
  labs( x = "", y = "") +
  coord_sf(xlim = c(-10, 37), ylim = c(30, 46), expand = FALSE) +
  theme_bw() + theme(panel.background = element_rect(fill = "aliceblue"), axis.ticks = element_blank(), axis.text = element_blank(), rect = element_blank(), panel.grid = element_blank(), plot.title = element_text(size = 15,family = "sans", face = "bold", vjust = 4), plot.subtitle = element_text(size = 10, family = "sans", face = "plain", vjust = 4)) + labs(title = "Day 1: Part-to-whole", subtitle = "#30DayChartChallenge | @agalanis97", caption = "Data: https://ec.europa.eu/jrc")

# Now let's make a mock donut chart. Code edited from R graph gallery
data <- data.frame(
  category=c("A", "B"),
  count=c(90, 10)
)

# Compute the cumulative percentages (top of each rectangle)
data$ymax <- cumsum(data$count)

# Compute the bottom of each rectangle
data$ymin <- c(0, head(data$ymax, n=-1))

# Make the donut plot
pie <- ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category, alpha = 0.6)) +
  geom_rect() + scale_fill_manual(values = c("A" = "#536298", "B" = "#eff1f8"))+
  coord_polar(theta="y")+
  xlim(c(1, 4)) +
  theme_void() +
  theme(legend.position = "none") 


plot <- ggdraw(mediterranean) + draw_plot(pie, scale = 0.45, x=-0.25, y=-0.007) + draw_label("of fish in the Mediterranean", color = "black", size = 30, x = 0.7, y=0.6) + draw_label("90%", color = "black", size = 57, x = 0.25, y=0.5) + draw_label("are overfished.", color = "black", size = 40, x = 0.7, y=0.5, fontface = "bold") + draw_label("It has also lost 41% of marine mammals.", color = "black", size = 15, x = 0.7, y=0.4) 

save_plot(plot = plot, filename = "day1.pdf", base_width = 10, base_height = 10)

