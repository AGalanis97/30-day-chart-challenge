if (!require('here')) install.packages('here'): library('here')
if (!require('hrbrthemes')) install.packages('hrbrthemes'): library('hrbrthemes')
if (!require('ggimage')) install.packages('ggimage'): library('ggimage')
if (!require('ggplot2')) install.packages('ggplot2'): library('ggplot2')


df1 <- data.frame(value = c(5,5,5,5,5,5.2,5.2,5.2,5.2,5.2), bee = c(1.5,2,2.5,3,3.5,1.5,2,2.5,3,3.5), image=c("./bee-image.png","bee-image.png","bee-image-2.png","bee-image-3.png","bee-image-2.png","bee-image-4.png","bee-image-2.png","bee-image-4.png","bee-image.png","bee-image-3.png"), size = 50)

plot <- ggplot(df1, aes(bee, value), ) + geom_image(aes(image=image), size=0.1) + xlim(1,4)+ ylim(4.5,5.5)+theme(panel.grid = element_blank(), panel.background = element_rect(fill = "#d7e7dc"), axis.text = element_blank(), axis.ticks = element_blank(), axis.title = element_blank(), text = element_text(family = "Verdana"),  plot.title = element_text(size = 15,family = "sans", face = "bold"), plot.subtitle = element_text(size = 7, family = "sans", face = "plain")) + coord_polar()+ annotate(geom="text", x=4, y=5.5, label="10%", color="black", size=20) + annotate(geom="text", x=4, y=5, label="of bees \nare under \nthreat", color="black", size=10) + labs(title = "Day 2: Pictogram", subtitle = "#30DayChartChallenge | @agalanis97", caption = "Data: https://ec.europa.eu/environment/nature/conservation/species/redlist/downloads/European_bees.pdf")


ggsave(plot=plot, filename = "day2.pdf", width = 8, height = 8)
