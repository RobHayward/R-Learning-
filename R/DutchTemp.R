library(plyr)
library(dplyr)
library(ggplot2)
library(locfit)
library(plotrix)
r1 <- read.csv('Data/KNMI_20141130.txt',skip = 12) 
r1 <- r1[-1, ]
colnames(r1) = c("station", "Date", "TG", "TN", "TC")
r1$date <- as.Date(toString(r1$Date), format = "%Y%m%d")
r1$day <- as.POSIXlt(r1$date)$yday
head(r1)
str(r1)
# Now I have the data, I can createa chart that look like 
# http://www.r-bloggers.com/
#change-in-temperature-in-netherlands-over-the-last-century/