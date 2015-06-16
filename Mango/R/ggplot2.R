require(mangoTraining)


plot(demoData$Weight, demoData$Height)


getwd()
setwd("C:/Users/agott/Desktop/Data Visualisation/")


pdf("myPlot.pdf")
plot(demoData$Weight, demoData$Height)
dev.off()

graphics.off()

plot(demoData$Weight, demoData$Height, col = "red")


length(colours())
sample(colours(), 10)


rgb(255, 0, 0, maxColorValue = 255)


require(ggplot2)


qplot(x = Weight, y = Height, data = demoData)

qplot(Height, data = demoData)


myPlot <- qplot(x = Weight, y = Height, 
                data = demoData)
myPlot


qplot(x = Weight, y = Height, data = demoData,
      main = "Height against Weight",
      xlab = "Weight (kg)", 
      ylab = "Height (cm)")


qplot(x = Weight, y = Height, data = demoData,
      main = "Height against Weight",
      xlab = "Weight (kg)", 
      ylab = expression("Height (" * mu * ")"))


qplot(x = Weight, y = Height, data = demoData,
      main = "Height against Weight",
      xlab = "Weight (kg)", 
      ylab = "Height (cm)", 
      xlim = c(0, 90),
      ylim = c(0, 200))

# 1. Create a plot of Ozone against Wind from 
#    airquality.  Ensure that the plot has 
#    appropriate titles and axis labels
qplot(Wind, Ozone, data = airquality,
      main = "Ozone against Wind for 
      1973 New York Air Quality Measurements",
      xlab = "Wind (mph)",
      ylab = "Ozone (ppb)")
# 2. Ensure that the Wind axis begins at zero
ozonePlot <- qplot(Wind, Ozone, data = airquality,
      main = "Ozone against Wind for 
      1973 New York Air Quality Measurements",
      xlab = "Wind (mph)",
      ylab = "Ozone (ppb)",
      xlim = c(0, max(airquality$Wind)))
# 3. Create a histogram of wt from mtcars
wtPlot <- qplot(wt, data = mtcars, binwidth = 0.5,
      main = "Histogram of Weight for Car Road Tests",
      xlab = "Weight (lb/1000)")

# 4. Write the above plots to a single pdf file.  
pdf("qplotExamples.pdf")
ozonePlot
wtPlot
dev.off()



qplot(Wind, Ozone, data = airquality,
      main = "Ozone against Wind for 
      1973 New York Air Quality Measurements",
      xlab = "Wind (mph)",
      ylab = "Ozone (ppb)")


qplot(Wind, Ozone, data = airquality) + 
  ggtitle("Ozone against Wind")


myPlot <- qplot(Wind, Ozone, data = airquality)

myPlot + ggtitle("Ozone against Wind")



myPlot <- qplot(Wind, Ozone, data = airquality) +
  ggtitle("Ozone against Wind")



qplot(Line, TOTAL, data = tubeData,
      geom = "boxplot")

qplot(Line, TOTAL, data = tubeData) + 
  geom_boxplot()

qplot(Height, Weight, data = demoData) + 
  geom_smooth()


lam <- read.csv("./USB/Data/Lambourn.csv")
lam$Year <- factor(lam$Year) # Convert year to a factor

# 1. Create a boxplot of MDD for each Year 
#    using the Lambourn river data
qplot(Year, MDD, data = lam, geom = "boxplot")
# 2. Generate some random numbers using rnorm 
#    and draw a simple "density" plot to 
#    display the data
normData <- rnorm(1000)
qplot(x = normData, geom = "density")
# 3. Create a plot of Ozone against Wind 
#    from airquality
ozonePlot <- qplot(Wind, Ozone, data = airquality)

# 4. Add a smoothing line to the plot.
ozonePlot + geom_smooth()
# Extension Question:
# 5. Change the smoothing function in the 
#    previous exercise to a linear ("lm") 
#    smoother and remove the error bars.

qplot(Year, MDD, data = lam, geom = "violin")



qplot(Type, data = tubeData, geom = "bar")


exampleData <- data.frame(group = c("A", "B"), 
                          number = c(40, 50))

qplot(group, number, data = exampleData, 
      geom = "bar", stat = "identity")


mtcars$gear <- factor(mtcars$gear)
mtcars$cyl <- factor(mtcars$cyl)

qplot(gear, data = mtcars, geom = "bar", 
      fill = cyl, position = "fill")


qplot(Excess, data = tubeData, 
      geom = "histogram", binwidth = 0.5)

qplot(Excess, data = tubeData, 
      geom = "histogram", 
      breaks = c(0, 5, 10, 15, 20, 25))


qplot(Excess, y = ..density.., data = tubeData, 
      geom = "histogram", binwidth = 1) +
  geom_density(col = "red")


# 1. Create a bar chart of Smokes with bars 
#    coloured by Sex using demoData
qplot(Smokes, data = demoData, geom = "bar", 
      fill = Sex)
# 2. Create a density histogram of MDD from 
#    the Lambourn data
qplot(MDD, ..density.., data = lam, 
      geom = "histogram")
# 3. Overlay a density plot for this data
qplot(MDD, ..density.., data = lam, 
      geom = "histogram") +
  geom_density(col = "red")


qplot(Time, Conc, data = pkData, geom = "line")

qplot(Time, Conc, data = pkData, geom = "path")


qplot(Weight, Height, data = demoData, geom = "line")


head(lam)

dates <- paste(lam$Year, lam$Month, 
               lam$Day, sep = "-")
lam$Date <- as.Date(dates)


qplot(Date, MDD, data = lam, geom = "line",
      xlim = c(as.Date("2001-01-01"), 
               as.Date("2002-01-01")))



qplot(Scheduled, Excess, data = tubeData,
      col = Line)

qplot(Scheduled, Excess, data = tubeData,
      shape = Type, size = TOTAL)


qplot(Scheduled, Excess, data = tubeData,
      col = Line, size = I(3))


qplot(Scheduled, Excess, data = tubeData,
      col = I("blue"))


qplot(Wind, Ozone, data = airquality,
      col = factor(Month))

qplot(Wind, Ozone, data = airquality,
      shape = Month)

# 1.   Create a scatter plot of Height against Weight using demoData.  Use a different colour to distinguish between males and females and a different plotting symbol dependent upon whether the subject smokes or not.
qplot(Weight, Height, data = demoData, 
      col = Sex, shape = Smokes)
# 2. 	Add a 'Date' variable to the Lambourn data using as.Date and the columns Year, Month and Day.
dates <- paste(lam$Year, lam$Month, 
               lam$Day, sep = "-")
lam$Date <- as.Date(dates)
# 3. 	Create a plot of MDD against the Date, coloured by MDD.  Reduce the size of the points to 0.5.
qplot(Date, MDD, data = lam, col = MDD,
      size = I(0.5))




qplot(Weight, Height, data = demoData, 
      shape = I(8))

qplot(Weight, Height, data = demoData, 
      shape = I(21), col = I("red"), 
      fill = I("yellow"), size = I(4))

qplot(Weight, Height, data = demoData, 
      geom = "line", linetype = I(2))


qplot(Weight, Height, data = demoData, 
      shape = Smokes) +
  scale_shape_manual(values = c(8, 0))


qplot(Weight, Height, data = demoData, 
      col = Sex) +
  scale_colour_manual("Gender", values = c("red", "blue"))



qplot(Weight, Height, data = demoData, 
      facets = . ~ Sex)

qplot(Weight, Height, data = demoData) + 
  facet_grid(. ~ Sex)

qplot(Month, Excess, data = tubeData,
      facets =  ~ Line)

qplot(Month, Excess, data = tubeData) +
  facet_wrap( ~ Line, ncol = 5)




# 1.   Draw a line plot of Conc against Time from pkData and colour by Dose.  Ensure that the plot elements are labelled appropriately.
qplot(Time, Conc, data = pkData, geom = "line")

# 2. 	Change the previous plot so that each level of Dose is instead represented by a separate panel
qplot(Time, Conc, data = pkData, 
      geom = "line", facets = . ~ Dose)

qplot(Time, Conc, data = pkData, 
      group = Subject, 
      geom = "line", facets = . ~ Dose)


## ggplot

ggplot() +
  geom_line(aes(x = Time, y = Conc,
                group = Subject, 
                col = factor(Dose)), data = pkData)

ggplot() +
  geom_line(aes(x = Time, y = Conc,
                group = Subject), 
            data = pkData) +
  facet_grid(. ~ Dose)


ggplot(aes(x = Time, y = Conc,
           group = Subject), 
       data = pkData) +
  geom_line() +
  facet_grid(. ~ Dose)

require(reshape2)
pkMelt <- melt(pkData, measure.vars = "Conc")

pkMin <- dcast(pkMelt, Time ~ variable, min)
pkMax <- dcast(pkMelt, Time ~ variable, max)

pkSummary <- rbind(pkMin, pkMax[nrow(pkMax):1, ])


ggplot() + 
  geom_polygon(aes(Time, Conc), data = pkSummary,
               alpha = 0.5) +
  geom_line(aes(Time, Conc, 
                group = Subject), data = pkData) +
  facet_grid(. ~ Dose)


qplot(Month, Excess, data = tubeData) +
  scale_y_reverse()


require(scales)
qplot(Month, Excess, data = tubeData) +
  scale_y_continuous(labels = scientific)


qplot(Weight, data = demoData, geom = "histogram",
      binwidth = 5) + 
  facet_grid(Sex ~ . , scale = "free_y", 
             space = "free") +
  coord_cartesian(xlim = c(60, 80))




qplot(Excess, Scheduled, data = tubeData)

qplot(Time, Conc, data = pkData) + 
  geom_smooth(method = "lm", se = FALSE, 
              na.rm = TRUE)


airMelt <- melt(airquality, id.vars = c("Month", "Day"))

cast(airMelt, Month + variable ~ . , quantile, 
      probs = c(0.05, 0, 0.95), na.rm = TRUE)


pkSummary <- cast(pkMelt, Time + variable ~ . , quantile, 
      probs = c(0.05, 0, 0.95))

qplot(x = Time, y = X5., ymin = X0., ymax = X95.,
      data = pkSummary, geom = "ribbon", 
      alpha = I(0.3)) + 
  geom_line()




qplot(Time, Conc, data = pkData) + 
  stat_summary(fun.y = "median", geom = "point",
               col = "red", size = 4)


quantFun <- function(x, ...){
  
  out <- quantile(x, probs = c(0.05, 0.5, 0.95))
  names(out) <- c("ymin", "y", "ymax")
  out
  
} 

qplot(Time, Conc, data = pkData, geom = "blank") + 
  stat_summary(fun.data = "quantFun", 
               geom = "pointrange",
               col = "red")



# 1.  Create a plot of MDD against Date using the Lambourn data
mddPlot <- qplot(Date, MDD, data = lam)
# 2.	Add a smooth spline to this plot in a different colour
mddPlot + geom_smooth(col = "red")
# 3.	Instead create a scatter plot of the MDD values against year
qplot(Year, MDD, data = lam)
# 4.	Overlay the median values onto the plot with a large, red "x"
qplot(Year, MDD, data = lam) + 
  stat_summary(fun.y = "median", geom = "point", 
               col = "red", shape = I("X"), 
               size = I(5)) 



qplot(Month, Excess, data = tubeData) + 
  theme_bw()


qplot(Month, Excess, data = tubeData) + 
  theme_classic()

qplot(Month, Excess, data = tubeData) + 
  theme_classic(base_size = 16)

# Set theme for session
theme_set(theme_classic(base_size = 16))

qplot(Month, Excess, data = tubeData) +
  facet_wrap(~Line) 

qplot(Weight, Height, data = demoData, 
      facets = Sex ~ Smokes) +
  theme(strip.text.y = element_text(angle = 0))


?theme

qplot(Month, Excess, data = tubeData, col = Line) +
  theme(legend.position = "bottom")

theme_update(legend.position = "bottom")

qplot(Month, Excess, data = tubeData, col = Line)

qplot(Weight, Height, data = demoData, col = Sex)


?guides

qplot(Month, Excess, data = tubeData, col = Line) +
  guides(col = guide_legend(title.position = "top",
                            nrow = 3))

qplot(Month, Excess, data = tubeData, col = Line) +
  guides(col = FALSE)

# 1.   Melt the volcano data such that it can be used to draw a 2D map in ggplot
ggVolcano <- melt(volcano)
names(ggVolcano) <- c("X", "Y", "Z")

# 2. 	Draw a "tile" plot of the data and colour by the height of the volcano
volcano <- qplot(x = X, y = Y, data = ggVolcano, 
                 fill = Z, geom = "tile")

# 3. 	Add thin contours to the plot every 2m and thicker contours every 10m
volcano <- volcano + geom_contour(aes(x = X, 
                                      y = Y, z = Z), 
                        data = ggVolcano, 
                        binwidth = 2) +
  geom_contour(aes(x = X, 
                   y = Y, z = Z), 
               data = ggVolcano, 
               binwidth = 10, size = 2)
  
# 4. 	Remove the default grey space around the edge of the plot
volcano <- volcano + theme(panel.background = element_rect(fill = NA),
                           panel.grid.major = element_line(colour = NA),
                           panel.grid.minor = element_line(colour = NA))


qplot(x = X, y = Y, data = ggVolcano, 
      fill = Z, geom = "tile") + 
  scale_x_continuous(expand = c(0,0)) + 
  scale_y_continuous(expand = c(0,0))
