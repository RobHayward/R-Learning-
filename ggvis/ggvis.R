library(ggvis)
library(ggplot2)
da <- read.csv("C:/Users/Toshiba/Desktop/tubedata.csv")
head(da)
qplot(data = da, x = Month, y = Excess, col = Line) 
  qplot(data = da, x = Month, y = Excess, col = Line) +
  facet_wrap(~Line)
qplot(data = da, x = Month, y = Excess, col = Line) +
  facet_wrap(~Line) +
  geome_smooth( col - 'red')
# Last does not work.  geome's are already made
# scales and themes.
qplot(data = da, x = Month, y = Excess, col = Line) 
qplot(data = da, x = Month, y = Excess, col = Line) +
  facet_wrap(~Line) +
  theme_bw()
# JUst uses theme function. 
#-------------ggvis
myPlot <- ggvis(da, ~Month, ~Excess)
myPlot
class(myPlot)
# Viewer pain rather than plot. 
layer_points(myPlot)
# vaga is a version of d3 (javascript)
require(dplyr)
da %>%
  group_by(Line) %>%
  summarise(mean = mean(Excess)) %>%
  qplot(Line, mean, data = ., geom = "bar", stat = "identity")
# the dot changes the position of the argument tht is passed along.
#======
da %>%
  ggvis(~Month, ~Excess) %>%
  layer_points()
# Changing properties
# stroke
# fill
# size
# opacity
# map a variable to a property (use =)
da %>%
  ggvis(~Month, ~Excess) %>%
  layer_points(fill = ~Line)
da %>%
  ggvis(~Month, ~Excess) %>%
  layer_points(shape = ~Line)
da %>%
  ggvis(~Month, ~Excess) %>%
  layer_points(size = ~Stations)
da %>%
  ggvis(~Month, ~Excess, fill =  ~Line) %>%
  layer_points()
# set the property on the second line. Only 
# := for setting a property. 
da %>%
  ggvis(~Month, ~Excess) %>%
  layer_points(fill := "red", opacity := 0.7)
da %>%
  ggvis(~Month, ~Excess) %>%
  layer_points(shape := "square")
# Need the name for the shape (d3). 

data(mtcars)
head(mtcars)
mtcars %>%
ggvis(~mpg, ~wt)%>%
  layer_points(fill = ~factor(cyl))
# stops ggvis assuming that this is a continuous variable.
# Adding layers------------------
da %>%
  ggvis(~Line, ~Excess) %>%
  layer_boxplots()
mtcars%>%
  ggvis(~mpg, ~wt)%>%
  layer_points(fill = ~factor(cyl))%>%
  layer_smooths(stroke := "blue")%>%
  layer_model_predictions(model = "lm", stroke := "red")
# the colours are set for the layer. 
# interaction-----------------------------------
# Change properties of propertties. fill.hover will change the fill
da %>%
  ggvis(~Month, ~Excess)%>%
  layer_points(fill = ~Line, fill.hover := 'red', 
               size = 100, 
               size.hover := 1000)
# tool tips.  add_tooltip 
da %>%
  ggvis(~Month, ~Excess)%>%
  layer_points(fill = ~Line, fill.hover := 'red', 
               size = 100, 
               size.hover := 1000) %>%
  add_tooltip(function(data) data$Excess)
data(pkData)
head(pkData)
# There is an example that will allow all the data to be taken into
# the chart so that the data can be seen,. key is used. 
# ----------------------------
# Use features of shiny. Shiny is loaded underneath. 
da %>%
  ggvis(~Month, ~Excess)%>%
  layer_points(fill = ~Line, 
               size := input_slider(10, 1000, label = 
                                      "Size of points"))
# Can be used to change smoothing or confidence intervals. 
da %>%
  ggvis(~Month, ~Excess)%>%
  layer_points(fill = ~Line, 
               size := input_slider(10, 1000, label = 
                                      "Size of points"))
# Changes properties of the data. 
# add axis can control multiple axes and gridlines etc.  add_legend
# will control legend. 
