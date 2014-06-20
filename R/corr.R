source("R/pollutantmean.R")
source("R/complete.R")
corr<- function(directory, threshold = 0) {
  dat <- complete("specdata")
  datem <- subset(dat, nobs >= threshold)
  id = datem$id
  temp <- rep(0, length(id))
if(length(id) != 0){
  id <- formatC(id, width = 3, flag = "0")
  da <- paste("Data/", directory, "/", id, ".csv", sep = "")
  da2 <- lapply(da, read.csv)
  temp <- rep(0, length(id))
  for(i in 1:length(id)){
  round(temp[i] <- cor(da2[[i]][2], da2[[i]][3], use = "pairwise.complete.obs" ), 
        digits = 5)
}
}
return(temp)
}

cr <- corr("specdata", 5000)
summary(cr)
length(cr)
threshold = 5000
directory = "specdata"
str(dat)
str(datem)
length(id)  != 0
head(id)
id
str(da)
str(da2)
str(temp)
rm(temp)
id
----------------  
 check the condition.
collect 
datem$id
length(id)
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
