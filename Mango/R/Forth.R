#Statistical graphics
qplot(Excess, Scheduled, data = tubeData)
qplot(Time, Conc, data = pkData) +
  geom_smooth()
# geom_smooth calls stat_smooth
?stat_smooth
# method = auto.  This determines the method of smooth. 
qplot(Time, Conc, data = pkData) +
  geom_smooth(method = "lm", se = FALSE)
# Can change the default confidnece interval
# NA behaviour
# Create intequartile range
dcast(pkMelt, Time ~ variable, quantile, probs = c(0.05, 0, 0.95))
# Not sure.  I need to look at this. 
pkSummary <- case(pkMelt, Time + variable ~ . , quantle = probs = c(0.05, 0, 0.95))
qplot(x = Time, y = X5., ymin = X0., ymax = X95., 
      data = pkSummary, geom = "ribbon", 
      alpha = I(0.3)) + 
  geom_line()
# Not sure. 
#-----------------------------------------
qplot(Time, Conc, data = pkData)
? stat_summary
# Apply a stat to the data and provide the results
qplot(Time, Conc, data = pkData) + 
  stat_summary(fun.y = "median", geom = "point", 
               col = "red", size = 4)

quantFun <- function(x, ...){
out <- quantile(x, probs = c(0.05, 0.5, 0.95))
names(out) <- c("ymin", "y", "ymax")
out
}

qplot(Time, Conc, data = pkData, geom = "ribbon")   
  stat_summary(fun.data = "quantFun", geom = "errorbar", 
               col = "red", size = 4)
# Lost again. 


#-------------------
qplot(Date, MDD, data = lam) +
geom_smooth()

qplot(Year, MDD, data = lam) +
  stat_summary(fun.y = "median", geom = "point", col = "red", 
               shape = I("X"), size = I(5))
#------------------------
# Preparing for presentation
# Using themes.  At the moment it uses grey

qplot(Month, Excess, data = tubeData)
qplot(Month, Excess, data = tubeData) + 
  theme_bw()
qplot(Month, Excess, data = tubeData) + 
  theme_classic()
# This is like base R
qplot(Month, Excess, data = tubeData) + 
  theme_classic(base_size = 16)
# Increases the font size
# This can also be set globally
theme_set(theme_classic(base_size = 16))
qplot(Month, Excess, data = tubeData)
# Theme function can change the themes altogether.
?theme
qplot(Month, Excess, data = tubeData) + 
  facet_wrap(~ Line)
# To switch teh text in the panel. 
qplot(Weight, Height, data = demoData, 
  facets = Sex ~ Smokes) +
theme(strip.text.y = element_text(angle = 0))
# To change elements for each session. 

qplot(Month, Excess, data = tubeData, col = Line) +
  theme(legend.position = "bottom")
# To update the them so that the individual change does not have to be done each 
# time. 
theme_update(legend.position = "bottom")
# It is possible to create a theme for yourself. 
#-----------------------------------------------------------
# The legend. 
?guides
# Create a guide 
qplot(Month, Excess, data = tubeData, col = Line) +
  guides(col = guide_legend(title.position = "top"))
qplot(Month, Excess, data = tubeData, col = Line) +
  guides(col = guide_legend(title.position = "top", nrow = 3))
# Remove legend
qplot(Month, Excess, data = tubeData, col = Line) +
  guides(col = FALSE)
 

# Last exercise of the day
mvol <- melt(volcano)
# matrix of intensity (z) at each coordinate (x, y)
names(mvol) <- c("x", "y", "z")
head(mvol)
tail(mvol)
?volcano
# Example chapter 5.
qplot() +
  geom_tile(aes(x = x, y = y, fill = z), data = mvol) +
  
geom_contour(aes(x = x, y = y, z = z), data = mvol, binwidth = 10, size = 2)

# use panel.background (panel.backgrond and grids to change the background)
# scale_x_continyous(expand = c(0, 0)) will expand the chart the fill area. 
# ---------------------------------------

# Interactive graphics. 