if (!require('here')) install.packages('here'): library('here')
if (!require('ggplot2')) install.packages('ggplot2'): library('ggplot2')
if (!require('tidyverse')) install.packages('tidyverse'): library('tidyverse')
if (!require('ggpubr')) install.packages('ggpubr'): library('ggpubr')
if (!require('readr')) install.packages('readr'): library('readr')


bombus <- readr::read_delim("bombus_data.csv", delim = "\t", escape_double = FALSE, col_names = TRUE, na = c("", "NA"))

bees <- bombus[,c(19,20,32, 33)]
bees$individualCount <- replace_na(bees$individualCount,1)
bees_new <- bees[bees$year >= 2000,]
bees_tot <- na.omit(bees_new)

p1 <- ggplot(bees_tot, aes(x=month)) +
  geom_density(fill="#FEFF8F", color="#e9ecef", alpha=0.8) + scale_x_continuous(limits = c(1,12), breaks = c(1,3,6,9,12), labels = c("January","March","June","September","December")) + scale_color_gradient(low = 'green', high = 'red') + theme(panel.background = element_rect(fill = "#323232"), panel.grid = element_blank(), plot.background = element_rect(fill = "#323232"), axis.title.x = element_blank(), axis.text.x = element_text(size = 12, colour = "white"), axis.title.y = element_blank(), axis.text.y = element_text(colour = "#cccccc")) + scale_y_continuous(limits = c(0,0.35), breaks = c(0,0.1,0.2), labels = c("0","0.1","0.2"))

p2 <- p1 + annotate("text", label = "When will you see\nBombus bees in Greece?",x=1, y = 0.32, size = 8, colour = "#FEFF8F", hjust =0) + annotate("text", label = "#30DayChartChallenge | @agalanis97",x=1, y = 0.285, size = 5, colour = "#7f7f7f", hjust =0) + annotate("text", label = "Data source: GBIF.org. DOI: 10.15468/dl.sm7aqj",x=1, y = 0.27, size = 3, colour = "#7f7f7f", hjust =0)


ggsave(p2, filename = "day8.pdf")