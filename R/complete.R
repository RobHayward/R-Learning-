complete <- function(directory, id = 1:332) {
  id2 <- formatC(id, width = 3, flag = "0")
  da <- paste("Data/", directory, "/", id2, ".csv", sep = "")
  dat <- lapply(da, read.csv)
temp <- rep(0, length(id))
  for(i in 1:length(id)){
  temp[i] <- sum(complete.cases(dat[[i]]))
}
frame <- data.frame(id = id, nobs = temp)
frame
return(frame)
}
