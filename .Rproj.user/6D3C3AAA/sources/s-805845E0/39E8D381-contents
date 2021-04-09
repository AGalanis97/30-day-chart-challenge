if (!require('here')) install.packages('here'): library('here')
if (!require('ggplot2')) install.packages('ggplot2'): library('ggplot2')
if (!require('tidyverse')) install.packages('tidyverse'): library('tidyverse')
if (!require('ggpubr')) install.packages('ggpubr'): library('ggpubr')
if (!require('cowplot')) install.packages('cowplot'): library('cowplot')
if (!require('ggthemes')) install.packages('ggthemes'): library('ggthemes')


experiment <- read.csv("plant_experiment.csv")

experiment_bee <- experiment %>% filter(Group == "Bee" | Group == "Silent")
experiment_bee$average <- (experiment_bee$SugCon1 + experiment_bee$SugCon2)/2

box <- ggboxplot(experiment_bee, x = "Group", y = "average", width = 0.8, add = "jitter") + theme(axis.ticks.x = element_blank(), axis.line.x = element_blank(), axis.title.y = element_blank(), plot.background = element_rect(fill = "#fefcd7"), panel.background = element_blank()) + scale_y_continuous(name = "Sugar concentration (%)",limits = c(0,60), breaks = c(0,10,20,30,40,60), labels = c("0","10","20","30","40","")) + scale_x_discrete(labels= c("Bee" = "Bee sound", "Silent" = "Silence"))

box2 <- box  + ggtitle("Can plants hear?", subtitle = "#30DayChartChallenge | @agalanis97") + coord_flip()

box3 <- box2 + annotate("text", label = 'Plants respond\nto the buzz\nof bees\nby making\ntheir nectar\nsweeter,\neven within\n3 minutes!',x=1.5, y = 60, size = 8, colour = "black", hjust = 1) + theme(axis.title.x = element_text(hjust = 0.3), title = element_text(size = 15)) + annotate("text", label = "Data from: Veits et al., 2019" , x = 0, y = 60, size = 3, colour = "black", hjust = 1, vjust = -1)

ggsave(box3, filename = "day6.pdf")
