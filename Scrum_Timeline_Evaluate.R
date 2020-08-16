library(ggplot2)

frame = ggplot(cars, aes(speed, dist)) + 
  xlab("time") + ylab("output") +
  scale_y_continuous(limits=c(-0.5,100),breaks=c(0,100)) +
  scale_x_continuous(limits=c(-0.5,100),breaks=c(0,100)) +
  geom_abline(intercept = 5, slope = 2,lwd=2,color="darkgreen") +
  geom_abline(intercept = -0.5, slope = 1,lwd=2,color="red") +
  theme_classic(base_size = 20) +
  theme(axis.ticks=element_blank(), axis.text=element_blank())

# Last line suppresses axis numbers, making everything difficult to debug.
# Hence, we should add this only after everything is ready.

ggsave("Scrum_Frame.png",frame,width=4,height=3)

# -----------------------------------------------------------------

fixed_scope = frame + geom_hline(yintercept = 50, lwd=2,color="darkgray") +
  geom_segment(x = 23.5, y = 52, xend = 51.5, yend = 52, lwd=2,color="black") +
  ggtitle("Fixed Scope") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Scrum_Fixed_Scope.png",fixed_scope,width=4,height=3)

# -----------------------------------------------------------------

fixed_time = frame + geom_vline(xintercept = 30, lwd=2,color="darkgray") +
  geom_segment(x = 31.5, y = 31.5, xend = 31.5, yend = 65, lwd=2,color="black") +
  ggtitle("Fixed Time") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Scrum_Fixed_Time.png",fixed_time,width=4,height=3)

# -----------------------------------------------------------------

fixed_time_and_scope = frame + 
  annotate("text", x = 20, y = 80,label="X", size = 10) +
  geom_segment(x = 20, y = 78, xend = 20, yend = 20, lwd=2,color="darkgray") +
  geom_segment(x = 20.5, y = 80, xend = 80, yend = 80, lwd=2,color="darkgray") +
  geom_segment(x = 20.5, y = 22.5, xend = 77.5, yend = 79, lwd=2, color="black") +
  ggtitle("Fixed Time and Scope") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave("Scrum_Fixed_Time_and_Scope.png",fixed_time_and_scope,width=4,height=3)