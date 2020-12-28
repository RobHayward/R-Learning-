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
# vapply will expect the type of data to be delivered to be specified. 
sapply(vec, sum)
sapply(vec, length)
#=========================================
# tapply will allow the data to be separated by a factor
?tapply
my.matrix
# add a factor
tdata <- as.data.frame(cbind(c(1,1,1,1,1,2,2,2,2,2), my.matrix))
tdata
tapply(tdata$V2, tdata$V1, mean)
  # will give the mean of V2 for each V1 factor. 
tapply(tdata$V2, tdata$V1, max)
# These are the helps for tapply
groups <- as.factor(rbinom(32, n = 5, prob = 0.4))
groups
tapply(groups, groups, length)
table(groups)
#==
head(warpbreaks)
tapply(warpbreaks$breaks, warpbreaks[, -1], sum)
# will count the sum for each of the factor columns
tapply(warpbreaks$breaks, warpbreaks[, 3, drop = FALSE], sum)
tapply(warpbreaks$breaks, warpbreaks[, 2, drop = FALSE], sum)
# will calculate sum accross one factor
tapply(warpbreaks$breaks, warpbreaks[, 3], sum)
#===
n <- 17
fac <- factor(rep_len(1:3, n), levels = 1:5)
fac
table(fac)
tapply(1:n, fac, sum)
tapply(1:n, fac, sum, default = 0)
tapply(1:n, fac, sum, simplify = FALSE)
# Put into a list
tapply(1:n, fac, range)
# creates a list becuase it cannot be simplified.
tapply(1:n, fac, quantile)
tapply(1:n, fac, length)
tapply(1:n, fac, length, default = 0)
#=======================================
tdata$V5  <- mapply(function(x, y) x/y, tdata$V2, tdata$V3)
tdata$V5
# or create a new vector to take the calculated values
new.vec <- vector(mode = 'numeric', length = dim(tdata)[1])
new.vec <- mapply(function(x, y) x*y, tdata$V3, tdata$V4)
#====
# quarterly aproval rating of US presidents.
head(presidents)
tail(presidents)
tapply(presidents, cycle(presidents), mean, na.rm = TRUE)
# will take the approval rating for each quarter
#============
ind <- list(c(1, 2, 2), c("A", "A", "B"))
ind
str(ind)
table(ind)
tapply(1:3, ind)
tapply(1:3, ind, sum)
#==========
summary <- tapply(tdata$V2, tdata$V1, function(x) c(mean(x), sd(x)))
summary
# will create a new variable (v5 from the ratio of V1 and V2)
#================================================================
#mapply
?mapply
mapply(rep, 1:9, 9:1)
tdata$V5  <- mapply(function(x,y) x/y , tdata$V2, tdata$V4)
tdata$V5
head(tdata)
my.vec <- vector(mode = 'numeric', length = 10)
my.vec <- mapply(function(x, y) x*y, tdata$V3, tdata$V4)
my.vec
#===========================================
library(MASS)
data(state)
head(state.x77)
str(state.x77)
apply(state.x77, 2, mean)
apply(state.x77, 2, median)
apply(state.x77, 2, sd)
state.summary <- apply(state.x77, 2, function(x) c(mean(x), sd(x)))
state.summary
state.range <- apply(state.x77, 2, function(x) c(min(x), median(x), max(x)))
state.range
#========
population <- state.x77[1:50]
area <- state.area
pop.dens <- mapply(function(x, y) x/y, population, area)
pop.dens
#==================
region.info <- tapply(population, state.region, 
                      function(x) c(min(x), median(x), max(x)))
region.info
