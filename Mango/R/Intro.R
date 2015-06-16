require(mangoTraining)
plot(demoData$Weight, demoData$Height)
# Sending graphic to another device
  # include the file extension
pdf("Mango/Figures/myPlot.pdf")
plot(demoData$Weight, demoData$Height)
dev.off()
# graphics.off() - will close all graphic devices. A reset. 
#------Colour
length(colours())
sample(colours(), 10)
rgb(255, 0, 0, maxColorValue = 255)
# will give the hexadecimal value
#---------------------------------------------------------
require(ggplot2)
# Two functions qplot and ggplot.  The former is quick. 
qplot(x = Weight, y = Height, data = demoData)
qplot(Height, data = demoData)
myPlot <- qplot(Height, data = demoData)
myPlot

qplot(x = Weight, y = Height, data = demoData, 
      main = "Height against Weight", 
      xlab = "Weight (kg)", 
      ylab = "Height (cm)")
# expression for greeks
qplot(x = Weight, y = Height, data = demoData, 
      main = "Height against Weight", 
      xlab = "Weight (kg)", 
      ylab = expression("Height ("*mu* ")"))

# use the fill range
qplot(x = Weight, y = Height, data = demoData, 
      main = "Height against Weight", 
      xlab = "Weight (kg)", 
      ylab = "Height (cm)", 
      xlim = c(0, 90), 
      ylim = c(0, 200))
# This looks rediculous. 
# Exercise 1
data("airquality")
qplot(x = Ozone, y = Wind,
      data = airquality,
      xlab = "ozone", 
      ylab = "airquality", 
      main = "Airquality and Ozone", 
      xlim = c(0, max(airquality$Wind))) 
# ---------------
?mtcars
wtPlot <- qplot(wt, data = mtcars, main = 
                  "Histogram of Mt Cars", 
                binwidth = 0.5, 
                xlab = "Weight (lb/1000")
wtPlot
# the last part of the exercise puts these two into a pdf file. Not completed. 