# Multi-dimensions
qplot(Scheduled, Excess, data = tubeData, 
      col = Line)
# colour by tube line
qplot(Scheduled, Excess, data = tubeData, 
      shape = Line)
# Too many variables
# Implementing principles
qplot(Scheduled, Excess, data = tubeData, 
      shape = Type)
# Change size of points
qplot(Scheduled, Excess, data = tubeData, 
      shape = Type, size = TOTAL)
qplot(Scheduled, Excess, data = tubeData, 
      shape = Type, size = 2)
# This does not work.  Needs function I
qplot(Scheduled, Excess, data = tubeData, 
      shape = Line)
qplot(Scheduled, Excess, data = tubeData, 
      shape = Type, size = I(4))
qplot(Scheduled, Excess, data = tubeData, 
      col = I("blue"))
#-------------------
qplot(Wind, Ozone, data = airquality)

qplot(Wind, Ozone, data = airquality, 
      col = Month)
# as airquality is a numeric, it treats it as a continuous variable
qplot(Wind, Ozone, data = airquality, 
      col = factor(Month))
qplot(Wind, Ozone, data = airquality, 
      shape = Month)
# ggpot handles the cases.  This is a continuous variable. It cannot be broken up.
# Exercise 4.8
head(demoData)
qplot(Height, Weight, data = demoData, 
      col = Sex, shape = Smokes)
head(lam)
qplot(Date, MDD, data = lam, geom = "line", 
      xlim = c(as.Date("2001-01-01"), 
               as.Date("2002-01-01")), 
      col = MDD)
qplot(Date, MDD, data = lam,  
      xlim = c(as.Date("2001-01-01"), 
               as.Date("2002-01-01")), 
      col = MDD)
qplot(Date, MDD, data = lam,  
      xlim = c(as.Date("2001-01-01"), 
               as.Date("2002-01-01")), 
      col = MDD, size = I(0.5))
#--------------------------------------
qplot(Height, Weight, data = demoData, 
      shape = I(1))
# select the shape desired. In materials on page 4.6
qplot(Height, Weight, data = demoData, 
      shape = I(8))
qplot(Height, Weight, data = demoData, 
      shape = I(21), col = I("red"), 
      fill = I("yellow"), size = I(4))
# line style
qplot(Weight, Height, data = demoData, 
      geom = "line")
qplot(Weight, Height, data = demoData, 
      geom = "line", linetype = I(2))
# Examples in the materials (P 4.2.4)
# Find scale functions.  Page 4.3. 
# To control colours chose the manual conponent
grep("^scale_", objects("package:ggplot2"))
qplot(Weight, Height, data = demoData, 
      shape = Smokes) +
  scale_shape_manual(values = c(8, 0))
# uses the variables
# This can be used for any graphic. 
qplot(Weight, Height, data = demoData, 
      col = Sex) +
  scale_colour_manual(values = c("red", "blue"))
?scale_colour_continuous
# choose the high and low points for the scale. 
# Legend can also be controlled by the first scale value
qplot(Weight, Height, data = demoData, 
      col = Sex) +
  scale_colour_manual("Gender", values = c("red", "blue"))
# Panelling
#---------------------------------------------------------
#Multivariate graphic requires panelling
# Facets in ggplot
qplot(Weight, Height, data = demoData, 
      facets = . ~ Sex)
# there are two faceting functions 
# facet_grid is used here
qplot(Weight, Height, data = demoData, 
      facets = Smokes ~ Sex)
# This is rows and columns.  . is nothing on rows
qplot(Weight, Height, data = demoData) +
  facet_grid(. ~ Sex)
?facet_grid
# Drop will remove the empty levels. 
qplot(Month, Excess, data = tubeData)

qplot(Month, Excess, data = tubeData, 
      facets = . ~ Line)
qplot(Month, Excess, data = tubeData, 
      facets =  ~ Line)
# Take away the first period.  This will wrap the data
qplot(Month, Excess, data = tubeData) + 
      facet_wrap( ~ Line, as.table = FALSE)
qplot(Month, Excess, data = tubeData) + 
  facet_wrap( ~ Line, ncol = 5)
# 5 columns
# exercise 4.14
qplot(Conc, Time, data = pkData, 
      col = Dose)
qplot(Conc, Time, data = pkData, 
      facets = . ~ Dose)
qplot(Time, Conc, data = pkData, geom = "line",  
      group = Subject, 
      facets = . ~ Dose)
# POints are connected because there are more than one value for points.
# .  Need to be fixed with groups. 


# Advanced control aspects
# ggplot function.  Everything must be specified. 
ggplot()
# No layers
# Everything goes in the aes (aesthetic function)
ggplot() + 
  geom_line(aes(x = Time, y = Conc, group = Subject), data = pkData)
ggplot() + 
  geom_line(aes(x = Time, y = Conc, group = Subject, 
                col = factor(Dose)), data = pkData)
ggplot() + 
  geom_line(aes(x = Time, y = Conc, group = Subject, 
                col = factor(Dose)), data = pkData, 
            col = "red")
# red is outside the aes.  No need for I because ase defines the variables. 
# aes refers to the variables in the data
# Outside aes means that it is not associated with the variables. 
ggplot() + 
  geom_line(aes(x = Time, y = Conc, group = Subject, 
                col = factor(Dose)), data = pkData) +
            facet_grid(. ~ Dose)
# Everything can go in the ggplot function
# This is only used when the same data and primary variables are used. 
# However, it is possible to use multiple datasets
# Multiple dataset materials
#---------------------------------------------------------
# Show distribution of data under the panel
# polygon - draw a shape on the graphics region. 
# What is the path around the shape? 
head(pkData)
# all ids apart from conc
require(reshape2)
# This will determine the maximum and minimum value. at each time point. 
pkMelt <- melt(pkData, measure.vars = "Conc")
head(pkMelt)
pkMin <- dcast(pkMelt, Time ~ variable, min)
head(pkMin)
pkMax <- dcast(pkMelt, Time ~ variable, max)
head(pkMax)
pkSummary <- rbind(pkMin, pkMax[nrow(pkMax):1, ])
head(pkSummary)
# This is to create the range of the whole data
ggplot() + 
  geom_polygon(aes(Time, Conc), data = pkSummary, 
               alpha = 0.3) + 
  geom_line(aes(Time, Conc, 
                group = Subject), data = pkData) +
  facet_grid(. ~ Dose)
# alph sets the intensity of the plot. 
#-----------------------------------------------
# Scales
qplot(Month, Excess, data = tubeData)
qplot(Month, Excess, data = tubeData) + 
  scale_x_log10()
# switches to a log scale for the x axis. there are a wide range of transformations
# this can also be used to reverse vaules. 
qplot(Month, Excess, data = tubeData) + 
  scale_y_reverse()
require(scales)
qplot(Month, Excess, data = tubeData) + 
  scale_y_continuous(labels = dollar)
# This will change the label of the y to dollar. 
# There are a range of formats that can be used.
qplot(Weight, data = demoData, geom = "histogram",  
  binwidth = 5) + 
  facet_grid(Sex ~ .)
qplot(Weight, data = demoData, geom = "histogram",  
      binwidth = 5) + 
  facet_grid(Sex ~ . , scale = "free_y", 
             space = "free")
# coordinate system
# coord map
# If usual axis limits are used, this will cut the size of the data and will 
# affect the calculation of the statisistics.  Coord_cartesian command will 
# not trim the data when it adjusts the chart.
