if (!require('here')) install.packages('here'): library('here')
if (!require('ggplot2')) install.packages('ggplot2'): library('ggplot2')
library(waffle)
if (!require('tidyverse')) install.packages('tidyverse'): library('tidyverse')
if (!require('ggthemes')) install.packages('ggthemes'): library('ggthemes')
if (!require('extrafont')) install.packages('extrafont'): library('extrafont')


df <- read.csv("pesticides_europe.csv")
df$Value <- str_replace(df$Value, ":", as.character(0))
df$Value <- str_remove_all(df$Value, ",")
df$Value <- as.numeric(df$Value)

df2 <- df %>% group_by(TIME, GEO) %>% summarise(Total = sum(Value))

df2011 <- df2[df2$TIME==2011,]
df2011 <- df2011[df2011$Total > 0,]
df2011$GEO[9] <- "Germany"

df2019 <- df2[df2$TIME == 2019,]
df2019$GEO[11] <- "Germany"
df2019 <- df2019[df2019$Total > 0,]

df2019 <- df2019[df2019$GEO %in% df2011$GEO,]
df2011 <- df2011[df2011$GEO %in% df2019$GEO,]
df4 <- rbind(df2011,df2019)
df4$pairs <- rep(1:27,2)
df4$t <- rep(1:2, each=27)

df5 <- df4
change <- as.data.frame(((df5$Total[df5$TIME == 2019] - df5$Total[df5$TIME == 2011])/df5$Total[df5$TIME==2011])*100)
change$GEO <- df2011$GEO
  
  
df5$colours <- ifelse(df5$GEO == "Germany", "#F45500", ifelse(df5$GEO == "Italy", "#40b000", ifelse(df5$GEO == "Greece", "#0070e0", ifelse(df5$GEO == "Spain","#FF9C38" , "#B5A891"))))


theme_set(theme_classic())


plot <- ggplot(df5,aes(t, Total, group=pairs, colour = I(colours))) + 
  geom_vline(xintercept = 1, colour="#b0aaa3", linetype = "longdash", alpha = 0.3)+ 
  
  geom_vline(xintercept = 2, colour="#b0aaa3", linetype = "longdash", alpha = 0.3) + 
  
  geom_line(aes(alpha = ifelse(df5$GEO == "Greece", 1, ifelse(df5$GEO == "Italy", 1, ifelse(df5$GEO == "Germany", 1, ifelse(df5$GEO == "Spain", 1 ,0.2))))), size = 1) + 
  
  geom_point(size=4, alpha = 1, colour = "#666666") + 
  
  geom_point(size=4, alpha = ifelse(df5$GEO == "Greece", 1, ifelse(df5$GEO == "Italy", 1, ifelse(df5$GEO == "Germany", 1,ifelse(df5$GEO == "Spain", 1, 0.2))))) + xlim(1,5) +
  
  
  scale_y_continuous("Million kg", breaks = c(0,25000000,50000000,75000000), labels = c(0,25,50,75), limits = c(0,80000000)) + theme(legend.position = "none")


plot2 <- plot + annotate("text", label = "Italy (-31 %)", x = 2.1, y = 48405281, size = 4, colour = "white", hjust = 0) + annotate("text", label = "Germany (+3 %)", x = 2.1, y = 45176037, size = 4, colour = "white", hjust = 0) + annotate("text", label = "Greece (+6 %)", x = 2.1, y = 4867463, size = 4, colour = "white", hjust = 0)  + annotate("text", label = "Spain (+3 %)", x = 2.1, y = 75190440, size = 4, colour = "white", hjust = 0)

plot3 <- plot2 + theme(axis.line = element_blank(), axis.ticks.x = element_blank(), axis.text.x = element_blank(), axis.title.x = element_blank(), panel.background = element_rect(fill = "#666666"), plot.background=element_rect(fill="#666666"), axis.text.y = element_text(colour = "black"))

plot4 <- plot3 + geom_text(label="2011", x=1, y=81500000, vjust=0, size=5, angle = 90, colour = "#999999") + geom_text(label="2019", x=2, y=81500000, vjust=0, size=5, angle = 90,colour = "#999999") + theme(text = element_text(family = "Titillium Web")) + annotate("text", label = 'Pesticide sales\nin the EU', x = 5, y = 75000000, size = 10, colour = "#fff379", hjust = 1, fontface=2) + annotate("text", label = '#30DayChartChallenge\n@agalanis97', x = 5, y = 67000000, size = 3.5, colour = "#e5e5e5", hjust = 1) + annotate("text", label = 'Pesticide sales have been stable\noverall in the EU (change: -0.6 %).\nHowever, illegal pesticides are sold in\nthe EU, which are not officially reported.\nAccording to the European Commission,\n14 % of pesticides in the EU\nare illegally sold (1).\nSuch pesticides are unregulated\nand pose a threat to\nhuman, animal,\ncrop, and soil health.', x = 5, y = 40000000, size = 5, colour = "#e5e5e5", hjust = 1) + annotate("text", label = "(1): European Commission "Ad-hoc study on the trade of\nillegal and counterfeit pesticides in the EU"\n \nData source: Eurostat" , x = 5, y = 0, size = 2, colour = "white", hjust = 1, vjust = -1)

ggsave(plot = plot4, filename = "day5.pdf")
