#This is from http://r-exercises.com/2016/09/08/
#efficient-processing-with-apply-exercises/
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
