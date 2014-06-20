pollutantmean <- function(directory, pollutant, id = 1:332) {
  id <- formatC(id, width = 3, flag = "0")
  da <- paste("Data/", directory, "/", id, ".csv", sep = "")
  dat <- data.frame()
  for(i in 1:length(id)) {
  dat <- rbind(dat, read.csv(da[i]))
  }
  str(dat)
if(pollutant == "sulfate"){
  col = 2
} else {
  col = 3
}
mean <- mean(dat[,col], na.rm = TRUE)
mean





for(i in 1:length(id)) {
  data <- data.frame(dl[[i]][col]) 
  data <- rbind(dl[[i]][col])
}
}
str(data)
data <- data.frame(dl[[i]][2])
tail(data)
length(id)
str(dl)
data <- rbind(dl[[010]][2], data)
head(dl[[2]][col])
str(data)
str(dl[[2]][2])
return(dm)
}
pollutantmean("specdata", "sulfate", 1:10)
directory = "specdata"
id = 9:10
str(dl[[1]][2])
id
  }
da <- read.csv()
str[][2]
pollutant <- "nitrate"
for(i in id){
  da <- paste("Data/", directory, "/", id, ".csv", sep = "")
class(dl)  
}
dim(dl)
i = 001
mean(dl[[1]][2], na.rm = TRUE)
dt <- cbind(dl[["id"]]$sulfate)

str(dl)
da <- read.csv(da)

l <- list(a = (1:4), b = rep(1, 4))
l
mapply(max, l[[1]])
mean(dl[["sulfate"]])
str(dl[[2]][2])
str(dl)
list.files(dl)
