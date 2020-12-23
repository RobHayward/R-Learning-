# Using apply instead of loops
# This is from
# https://www.statforbiology.com/2020/stat_r_tidyverse_columnwise/
dataset <- read.csv('https://casaonofri.it/_datasets/Mycotoxins.csv', header = T)
funBec <- function(y, group){
  y <- as.numeric(unlist(dataset[, i + 3]))
  Count <- tapply(y, group, length)
  Mean <- tapply(y, group, mean)
  Max <- tapply(y, group, max)
  SE <- tapply(y, group, sd)/sqrt(Count)
  nPos <- tapply(y != 0, group, sum)
  PercPos <- tapply(y != 0, group, mean)*100
  muPos <- tapply(ifelse(y > 0, y, NA), group, mean, na.rm = TRUE)
  muPos[is.na(muPos)] <- 0
  sdPos <- tapply(ifslse(y > 0, y, NA), group, sd, na.rm = TRUE)
  SEpos <- sdPos/sqrt(nPos)
  data.frame(cbind(Count, Mean, Max, SE, nPos, PercPos, muPos, SEpos))
}
returnList <- apply(dataset[3:length(dataset[1, ])], 2, 
                      function(col) funBec(col, dataset$Region))
  
head(returnList)
str(dataset)
