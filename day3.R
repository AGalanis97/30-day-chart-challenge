if (!require('here')) install.packages('here'): library('here')
if (!require('hrbrthemes')) install.packages('hrbrthemes'): library('hrbrthemes')
if (!require('ggimage')) install.packages('ggimage'): library('ggimage')
if (!require('ggplot2')) install.packages('ggplot2'): library('ggplot2')
if (!require('RColorBrewer')) install.packages('RColorBrewer'): library('RColorBrewer')

# Code adapted from https://benalexkeen.com/creating-a-timeline-graphic-using-r-and-ggplot2/

sequencing <- read.csv("sequencing.csv")
status_levels <- c("Initial", "Major", "Breakthrough")
status_colors <- brewer.pal(n = 3, name = "Dark2")

sequencing$Status <- factor(sequencing$Status, levels=status_levels, ordered=TRUE)


sequencing$position <- c(0.2, 0.15, 0.4, 0.65, 0.3)
sequencing$text_position <- c(0.3,0.25,0.5,0.8,0.4)


timeline_plot<-ggplot(sequencing,aes(x=Year,y=0, col=Status, label=Milestone))
timeline_plot<-timeline_plot+labs(col="Milestones")
timeline_plot<-timeline_plot+scale_color_manual(values=status_colors, labels=status_levels, drop = FALSE)
timeline_plot<-timeline_plot+theme_classic()

# Plot horizontal black line for timeline
timeline_plot<-timeline_plot+geom_hline(yintercept=0, 
                                        color = "black", size=0.3) + xlim(1945,2020) + ylim(-0.5,1)

# Plot vertical segment lines for milestones
timeline_plot<-timeline_plot+geom_segment(data=sequencing, aes(y=position,yend=0,xend=Year), color='#CBBEB5', size=0.2)

# Plot scatter points at zero and date
timeline_plot<-timeline_plot+geom_point(aes(y=0), size=3)

# Don't show axes, appropriately position legend
timeline_plot<-timeline_plot+theme(axis.line.y=element_blank(),
                                   axis.text.y=element_blank(),
                                   axis.title.x=element_blank(),
                                   axis.title.y=element_blank(),
                                   axis.ticks.y=element_blank(),
                                   axis.text.x =element_blank(),
                                   axis.ticks.x =element_blank(),
                                   axis.line.x =element_blank(),
                                   legend.position = "bottom"
)

# Show text for each month
timeline_plot<-timeline_plot+geom_text(data=sequencing, aes(x=Year,y=-0.1,label=Year),size=5,vjust=0.5, color='black', angle=90)

# Show text for each milestone
plot <-timeline_plot+geom_text(aes(y=text_position,label=stringr::str_wrap(Milestone, width = 18)),size=5) + theme(legend.position = "none") + labs(title="Day 3: Historical. \nDevelopments in DNA sequencing.", subtitle = "#30DayChartChallenge | @agalanis97", caption = "Data: Heather and Chain (2016)")

ggsave(plot = plot, filename = "day3.pdf")


