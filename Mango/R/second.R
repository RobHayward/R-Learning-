qplot(Ozone, Wind, data = airquality) +
  ggtitle("Ozone against Wind")
myPlot <- qplot(Ozone, Wind, data = airquality) 
myPlot + ggtitle("Ozonze against wind")
# there are a range of functions to control all  these compoents (gglim etc)
# Change the type of graphic.  Use geoms (geometry)
qplot(Line, TOTAL, data = tubeData, 
      geom = "boxplot")
# each of these lines is a factor. 
# all the geoms are available from the ggplot website. 

qplot(Line, TOTAL, data = tubeData) + 
  geom_boxplot()
# This is slight different because the points are printed first and then the 
# boxplot layered later. 
qplot(Height, Weight, data = demoData) + 
  geom_smooth()
# To add the geom wihtout the initial points, sue ggplot2.
# Second exercise
lam <- read.csv("Mango/Data/Lambourn.csv")
summary(lam)
head(lam)
str(lam)
lam$Year <- as.factor(lam$Year)
qplot(Year, MDD, data = lam) +
  geom_boxplot()
# -------------
x <- rnorm(100)
qplot(x, ) +
  geom_density()

qplot(x, geom = "density")
qplot(Ozone, Wind, data = airquality) +
  geom_smooth()

# Final question
qplot(Ozone, Wind, data = airquality) 
  
# Discrete and univariate data
qplot(Year, MDD, data = lam, geom = "violin")
#-----------
# barplot
qplot(Type, data = tubeData, geom = "bar")
exampleData <- data.frame(group = c("A", "B"), 
                          number = c(40, 50))
qplot(group, number, data = exampleData, 
      geom = "bar", stat = "identity")
# barcharts
# create factors
mtcars$gear <- factor(mtcars$gear)
mtcars$cyl <- factor(mtcars$cyl)

qplot(gear, data = mtcars, geom = "bar")
# stack data (fill and position)
qplot(gear, data = mtcars, geom = "bar", 
      fill = cyl, position = "dodge")
# dodge rather than stack for clarity. 
# panel may be better
qplot(gear, data = mtcars, geom = "bar", 
      fill = cyl, position = "fill")
# Proportionate positions (label is not correct)
# Alternative to pie? 

#-----------
# histogram

qplot(Excess, data = tubeData)

qplot(Excess, data = tubeData, geom = "histogram")
# Not needed but makes it clear. 

qplot(Excess, data = tubeData, geom = "histogram", 
      binwidth = 2)

qplot(Excess, data = tubeData, geom = "histogram", 
      binwidth = 0.5)

qplot(Excess, data = tubeData, geom = "histogram", 
      breaks = c(0, 5, 10, 15, 20, 25))
# This is in line with the base graphics package. 

# Change count to density 
qplot(Excess, y = ..density.., data = tubeData, geom = "histogram", 
      binwidth = 2)
# add y = ..density..
# statistical transformations are being transformed underneath. 
# These calculations are being added underneath. 
# this ..denisty.. has been created and will be used for the y axis. 

qplot(Excess, y = ..density.., data = tubeData, geom = "histogram", 
      binwidth = 2) +
  geom_density(col = "red")
#########
# Exercose 3
?demoData
qplot(Smokes, data = demoData, geom = "bar", 
      fill = Sex)
qplot(MDD, y = ..density.., geom = "histogram", data = lam) +
  geom_density(col = "red")
# the dots for ..density.. indicate that this variable is in the new data rather
# than the existing data
----------------------------------------------------
  # Data over time 
qplot(Time, Conc, data = pkData)
qplot(Time, Conc, data = pkData, geom = "line")
# There are a number of measures for each time period
qplot(Time, Conc, data = pkData, geom = "path")
qplot(Weight, Height, data = demoData, geom = "line")
# This si an example. 
# CCreate the date from the lam data
dates <- paste(lam$Year, lam$Month, lam$Day, sep = "-")
dates
lam$Date <- as.Date(dates)
head(lam)
qplot(Date, MDD, data = lam, geom = "line", 
        xlim = c(as.Date("2001-01-01"), 
                 as.Date("2002-01-01")))
