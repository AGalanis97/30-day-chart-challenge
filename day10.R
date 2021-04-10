if (!require('here')) install.packages('here'): library('here')
if (!require('ggplot2')) install.packages('ggplot2'): library('ggplot2')
if (!require('tidyverse')) install.packages('tidyverse'): library('tidyverse')
if (!require('ggpubr')) install.packages('ggpubr'): library('ggpubr')
if (!require('lubridate')) install.packages('lubridate'): library('lubridate')
  
import_co2 <- function(x) {
  x1 <- read.table(x,sep=",")
  x1[x1 == -9999] <- 0
  x1$V1 <- lubridate::dmy(x1$V1)
  x1$Average <- rowMeans(x1[,-1])
  x1$Month <- lubridate::month(x1$V1, label = T, abbr = F)
  x1$Year <- lubridate::year(x1$V1)
  x1 <- x1[,c(26,27,28)]
  x2 <- x1 %>% group_by(Month,Year) %>% summarise(Total = mean(Average))
  x2 <- x2[x2$Total > 0,]
  x2 <- x2 %>% arrange(Year)
  return(x2)
}
  
co2000 <- import_co2("CO2000.dat")
co2000$ranking <- seq(from = 1, to = 147, by = 1)
co2005 <- import_co2("CO2005.dat")
co2005$ranking <- seq(from = 148, to = 207, by = 1)

co2010 <- import_co2("CO2010.dat")
co2010$ranking <- seq(from = 208, to = 267, by = 1)

co2015 <- import_co2("CO2015.dat")
co2015$ranking <- seq(from = 268, to = 323, by = 1)

co2019 <- import_co2("CO2019.dat")
co2019$ranking <- seq(from = 324, to = 370, by = 1)

all_dates <- rbind(co2000,co2005,co2010,co2015,co2019)

p <- ggplot(all_dates, aes(x=ranking, y=Total, fill= Year)) +  geom_bar(stat="identity") +  ylim(-20,10) +  theme_minimal()  +
  geom_text(aes(x=1, y=-13, label='Atmospheric'), color='#857c85', size = 10) + geom_text(aes(x=1, y=-16.5, label='CO levels'), color='white', size = 15) + geom_text(aes(x=1, y=-20, label='in Athens'), color='#cccccc', size = 10) + geom_text(aes(x=1, y=-20, label='1988-2019'), color='#cccccc', size = 9, vjust = 2) + geom_text(aes(x=1, y=-20, label='#30DayChartChallenge | @agalanis97'), color='#857c85', size = 3, vjust = 8) + geom_text(aes(x=1, y=-20, label='Data source: ypen.gov.gr'), color='#857c85', size = 3, vjust = 10) + geom_text(aes(x=2, y=-1.5, label="1988"), color='#333333', size = 3, angle = 90) + geom_text(aes(x=138, y=-1.5, label='2000'), color='#333333', size = 3, angle = 315) + geom_text(aes(x=256, y=-1.5, label='2010'), color='#333333', size = 3, angle = 29) + 
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-2,4), "cm"), legend.position = "none", plot.background = element_rect(fill="black")) +  coord_polar(start = 0) + scale_fill_gradient(high = "#FF1493",low="#0099ff")

ggsave(p, filename="day10.pdf", height = 11, width = 11)
