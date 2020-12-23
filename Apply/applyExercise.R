#This is from http://r-exercises.com/2016/09/08/efficient-processing-with-apply-exercises/
dataset1 <- cbind(ObservationA = 16:8, observationB = 
                    c(20:19, 6:12))
dataset1
apply(dataset1, 1, mean, na.rm = TRUE)
apply(dataset1, 2, sum)
apply(dataset1, 2, sort)
apply(dataset1, 1, prod)
DerivativeFunction <- function(x) {log10(x) + 1}
apply(dataset1, 1, DerivativeFunction)
apply(dataset1, 1, function(x) log10(x) + 1)
round(apply(dataset1, 1, function(x) log10(x) + 1), 2)
apply(dataset1, 2, print)
apply(dataset1, 2, length)
apply(dataset1, 2, range)
#=============================================================
#https://www.r-exercises.com/2016/10/14/optimize-data
#-exploration-with-sapply-exercises/
dataset1 <- data.frame(observationA = 16:8, observationB = c(20:19, 6:12))  
dataset1
sapply(dataset1, length)
sapply(dataset1, sum)
sapply(dataset1, quantile)
sapply(dataset1, class)
DerivativeFunction <- function(x) {log10(x) + 1}
sapply(dataset1, DerivativeFunction)
sapply(dataset1, function(x) log10(x) + 1)
sapply(dataset1, range)
sapply(dataset1, print)
sapply(dataset1, mean)
sapply(dataset1, is.numeric)
#==========================================
# https://ademos.people.uic.edu/Chapter4.html
my.matrix <- matrix(c(1:10, 11:20, 21:30), nrow = 10, ncol = 3)
my.matrix
apply(my.matrix, 2, sum)
apply(my.matrix, 1, sum)
apply(my.matrix, 2, length)
apply(my.matrix, 2, function(x) length(x) - 1)
st.err <- function(x){
  sd(x)/sqrt(length(x))
}
apply(my.matrix, 2, st.err)
#======================
# Using 1:2 will ensure that the function operates on each cell. 
my.matrix2 <- apply(my.matrix, 1:2, function(x) x + 3)
my.matrix2
vec <- c(1:10)
# need to use lapply or some other version apply expected dataframe
# sapply will simplify
sapply(vec, sum)
#=========================================
?tapply
my.matrix
# add a factor
tdata <- as.data.frame(cbind(c(1,1,1,1,1,2,2,2,2,2), my.matrix))
tdata
tapply(tdata$V2, tdata$V1, mean)
  # will give the mean of V2 for each V1 factor. 
tapply(tdata$V2, tdata$V1, max)
#=======================================
#mapply
?mapply
# will create a new variable (v5 from the ratio of V1 and V2)
tdata$V5  <- mapply(function(x, y) x/y, tdata$V2, tdata$V3)
tdata$V5
# or create a new vector to take the calculated values
new.vec <- vector(mode = 'numeric', length = dim(tdata)[1])
new.vec <- mapply(function(x, y) x*y, tdata$V3, tdata$V4)
new.vec
