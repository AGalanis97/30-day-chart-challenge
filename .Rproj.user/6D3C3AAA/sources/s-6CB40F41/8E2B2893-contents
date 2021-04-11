if (!require('here')) install.packages('here'): library('here')
if (!require('ggplot2')) install.packages('ggplot2'): library('ggplot2')
if (!require('tidyverse')) install.packages('tidyverse'): library('tidyverse')
if (!require('ggthemes')) install.packages('ggthemes'): library('ggthemes')
if (!require('cowplot')) install.packages('cowplot'): library('cowplot')

accidents <- read.csv("accidents_per_month.csv")
accidents$Year <- as.numeric(accidents$Year)

p1 <- ggplot(accidents, aes(x=Month, y=Year, fill=Deaths)) +
  geom_tile(colour="white") +
  scale_fill_gradient(low = "white", high = "#c85c32") + xlim(-11,13) + ylim(2000,2020) +
  coord_polar(theta = "x", start = pi/3)  + 
  theme(panel.background=element_rect(fill = "#f1eeea"),
        axis.title=element_blank(),
        panel.grid=element_blank(),
        axis.text.x = element_blank(),
        axis.ticks=element_blank(),
        axis.text.y=element_blank(),
        legend.position = c(0.48,0.52), legend.direction = "vertical", legend.background = element_blank(), legend.text = element_text(size = 8)) +
  geom_text(aes(x=12.5, y=Year, label=Year),hjust=-0.2, color="#b7b1ab", size=2.5, angle= -53, inherit.aes = FALSE, fontface = "plain") + geom_text(aes(x=1, y=2020, label="Jan"),hjust=0.5, vjust = 0, color="#fcfbfa", size=5, angle= 120, inherit.aes = FALSE, fontface = "plain") + geom_text(aes(x=12, y=2020, label="Dec"),hjust=0.5, vjust = 0, color="#fcfbfa", size=5, angle= -44, inherit.aes = FALSE )+ guides(fill = guide_colourbar(barheight = 2.5, barwidth = 1, ticks= F,title.position = "left", title.theme = element_text(size = 12, angle = 90), label.theme = element_text(size = 7)))


p2 <- ggdraw(p1) + draw_label("Deaths from\ncar accidents\nin Greece", x = 0.8, y = 0.25, hjust = 1, vjust = 0,fontfamily = "", fontface = "plain", color = "#4c3e2e", size = 30) + draw_label("#30DayChartChallenge | @agalanis97", x = 0.8, y = 0.22, hjust = 1, vjust = 0, fontfamily = "", fontface = "plain", color = "#a59e96", size = 8)+ draw_label("Data source: statistics.gr", x = 0.8, y = 0.20, hjust = 1, vjust = 0,fontfamily = "", fontface = "plain", color = "#a59e96", size = 6)


ggsave(p2, filename = "day11.pdf")
