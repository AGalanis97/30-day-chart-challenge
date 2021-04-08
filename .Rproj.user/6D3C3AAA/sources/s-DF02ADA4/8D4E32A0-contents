if (!require('here')) install.packages('here'): library('here')
if (!require('ggplot2')) install.packages('ggplot2'): library('ggplot2')
library(waffle)
if (!require('ggpubr')) install.packages('ggpubr'): library('ggpubr')


data1 <- data.frame(
  parts = c("Unprotected","Protected","Unprotected","Protected"),
  vals = c(72,28,100,0),
  col = c("green", "black", "green","black"),
  fct = c(rep("Up to May 2020", 2), rep("Since May 2020", 2)))


plot1 <- waffle(c(Unprotected = 72, Protected = 28), rows = 5,colors = c("#696969","#70bb4c"), title = "May 4th, 2020", size = 2) + theme(legend.text = element_text(size=14), title = element_text(size = 10))
plot2 <- waffle(c(Unprotected = 100, Protected = 0), rows = 5, colors = c("#696969","#70bb4c"), title = "May 5th, 2020",size = 2)+ theme(legend.text = element_text(size=14),title = element_text(size = 10))
plot3 <- ggarrange(plot1,plot2, ncol = 1, common.legend = T, legend = "bottom")  
  
plot4 <- annotate_figure(plot3,bottom = text_grob("\n \nOn May 4th, 2020, a new bill was passed by the Greek government that essentially eliminates all protected areas. \nGreece is home to over 2000 native animal species and 1150 plant species that exist only in Greece. \nThis bill explicitly makes mining, hunting, oil extraction, and other destructive activities legal within protected areas.", size = 12), top = text_grob("Day 4: Magical. \n Magical elimination of protected areas in Greece. \n \n", size = 20))

plot5 <- annotate_figure(plot4, top = text_grob("\n #30DayChartChallenge | @agalanis97", color = "black", size = 8, hjust=0.55), bottom = text_grob("\n \nData source: wwf.gr", color = "black", hjust = 1, x = 1, size = 8)) 


ggsave(plot5, filename = "day4.pdf", width = 10)
