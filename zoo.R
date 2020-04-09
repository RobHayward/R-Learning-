#zoo lesson
# https://www.r-exercises.com/2016/05/30/zoo-time-series-exercises/
require(zoo)
inData <- read.table('./ZooData.csv', stringsAsFactors = FALSE, sep = ',', header = 
                       TRUE)
head(inData)
inData$Date <- as.Date(inData$Date, format = "%d-%b-%y")
str(inData)
Z <- as.zoo(inData[, 4:10], order.by = inData$Date)
str(Z)
Z$Ratio <- Z$DeliveryVolume/Z$TotalVolume
plot(Z$Ratio)
aggregate(Z$Ratio, as.yearqtr, mean)
aggregate(Z$Ratio, as.yearmon, mean)
Z1 <- read.zoo(inData[3:7],  index.column = "Date")
Z2 <- read.zoo(inData[3, c(3, 8:10)], index.column = "Date")
Z3 <- merge(Z1, Z2)
identical(Z, Z3)
window(Z, start = as.Date("2015-02-01"), end = as.Date("2015-02-15"))
myVAWP <- function(x) {
  sum(x[, 1] * x[, 2])/sum(x[, 2])
}

ZD <- rollapply(cbind(Z$Close, Z$DeliveryVolume), width = 5, myVAWP, 
                   by.column = FALSE, align = 'right', by = 1)
ZT <- rollapply(cbind(Z$Close, Z$TotalVolume), width = 5, myVAWP, 
                   by.column = FALSE, align = 'right', by = 1)
R <- merge(Z, ZD, ZT)
R
na.aggregate(R$ZT, as.yearmon, mean)
R$Close - ave(R$ZT, as.yearmon(index(R)))
rownames(Z)
