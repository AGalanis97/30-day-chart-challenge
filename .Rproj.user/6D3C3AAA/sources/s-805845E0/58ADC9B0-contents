if (!require('here')) install.packages('here'): library('here')
if (!require('ggplot2')) install.packages('ggplot2'): library('ggplot2')
if (!require('tidyverse')) install.packages('tidyverse'): library('tidyverse')
if (!require('ggpubr')) install.packages('ggpubr'): library('ggpubr')
if (!require('lubridate')) install.packages('lubridate'): library('lubridate')
if (!require('ggridges')) install.packages('ggridges'): library('ggridges')
if (!require('RColorBrewer')) install.packages('RColorBrewer'): library('RColorBrewer')


tbl2001 <- read.table("SO2_20012002.dat", sep = ",")
tbl2019 <- read.table("SO2_20162019.dat", sep = ",")

tbl2001[tbl2001 == -9999] <- 0
tbl2019[tbl2019 == -9999] <- 0

tbl2001$Average <- rowMeans(tbl2001[,-1])

tbl2001$Month <- lubridate::month(tbl2001$V1, label = T, abbr = F)

tblplot <- tbl2001[,c(26,27)]
tblplot$Month <- as.factor(tblplot$Month)
tblplot$Group <- "2001 & 2005"

tbl2019$Average <- rowMeans(tbl2019[,-1])

tbl2019$Month <- lubridate::month(tbl2019$V1, label = T, abbr = F)

tblplot2019 <- tbl2019[,c(26,27)]
tblplot2019$Month <- as.factor(tblplot2019$Month)
tblplot2019$Group <- "2016-2019"

totals <- rbind(tblplot2019,tblplot)

sulfur <- ggplot(totals, aes(x = Average, y = fct_rev(as_factor(Month)), fill = Group)) +
  geom_density_ridges(alpha = 0.3) +
  theme_ridges() + labs(x="Daily average (μg/m³)", y="", title = "Sulfur oxide") + scale_fill_brewer(palette = 1, type = "qual") + theme(legend.title = element_blank(), axis.title.x = element_text(size = 12))


NO2001 <- read.table("NO2001.dat", sep = ",")
NO2005 <- read.table("NO2005.dat", sep = ",")
NO20012005 <- rbind(NO2001,NO2005)

NO2019 <- read.table("NO20162019.dat", sep = ",")

NO20012005[NO20012005 == -9999] <- 0
NO2019[NO2019 == -9999] <- 0

NO20012005$Average <- rowMeans(NO20012005[,-1])

NO20012005$Month <- lubridate::month(NO20012005$V1, label = T, abbr = F)

NOplot2001 <- NO20012005[,c(26,27)]
NOplot2001$Month <- as.factor(NOplot2001$Month)
NOplot2001$Group <- "2001 & 2005"

NO2019$Average <- rowMeans(NO2019[,-1])

NO2019$Month <- lubridate::month(NO2019$V1, label = T, abbr = F)

NOplot2019 <- NO2019[,c(26,27)]
NOplot2019$Month <- as.factor(NOplot2019$Month)
NOplot2019$Group <- "2016-2019"

totals_no <- rbind(NOplot2019,NOplot2001)

nitric <- ggplot(totals_no, aes(x = Average, y = fct_rev(as_factor(Month)), fill = Group)) +
  geom_density_ridges(alpha = 0.3) + scale_x_continuous(limits = c(-2,45), labels = c("0","20","40"),breaks = c(0,20,40)) + theme_ridges() + labs(x="Daily average (μg/m³)", y="", title = "Nitric oxide") + scale_fill_brewer(palette = 1, type = "qual") + theme(legend.title = element_blank(), axis.title.x = element_text(size = 12)) 

arranged_plot <- ggarrange(sulfur, nitric, nrow = 1, common.legend = T, legend = "right")

p1 <- annotate_figure(arranged_plot,top = text_grob('#30DayChartChallenge | @agalanis97 \n \n',color = "#a4b56a",face = "bold", size = 8),bottom = text_grob(' \n Data from: https://ypen.gov.gr/perivallon/poiotita-tis-atmosfairas/dedomena-metriseon-atmosfairikis-rypansis/',color = "#013056",face = "bold", size = 5))


p2 <- annotate_figure(p1,top = text_grob('Aliartos, Viotia',color = "#485c04", size = 13))

p3 <- annotate_figure(p2,top = text_grob('Atmospheric pollution in a small town in Greece',color = "black",face = "bold", size = 20))

ggsave(p3, filename = "day7.pdf")
