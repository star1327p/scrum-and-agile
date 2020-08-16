# Create a hypothetical sprint burndown chart manually

library(ggplot2)

x_axis = c(1:10)
hours = c(50,80,120,100,80,70,35,50,20,5)

df = data.frame(x_axis,hours)

# Blue line = ideal burndown trend

chart = ggplot(df, aes(x=x_axis,y=hours)) + geom_bar(stat="identity") +
  xlab("days") + ylab("hours") +
  scale_y_continuous(limits=c(0,125),breaks=seq(from=0,to=150,by=25)) +
  scale_x_continuous(limits=c(0.5,10.5),breaks=c(1:10)) +
  geom_abline(intercept = 120, slope = -12,lwd=2,color="blue") +
  ggtitle("Sprint Burndown Chart") +
  theme_bw(base_size=20) +
  theme(plot.title = element_text(hjust = 0.5))

chart

ggsave("Sprint_Burndown_Chart.png",chart,width=6,height=4)
