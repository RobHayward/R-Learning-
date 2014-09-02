pollutantmean <- function(directory, pollutant, id = 1:332) {
  id <- formatC(id, width = 3, flag = "0")
  da <- paste("Data/", directory, "/", id, ".csv", sep = "")
  dat <- data.frame()
  for(i in 1:length(id)) {
  dat <- rbind(dat, read.csv(da[i]))
  }
if(pollutant == "sulfate"){
  col = 2
} else {
  col = 3
}
mn <- round(mean(dat[,col], na.rm = TRUE), digits = 3)
return(mn)
}
