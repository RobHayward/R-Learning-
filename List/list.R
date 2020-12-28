# Using lists
# This is from https://rforpublichealth.blogspot.com/2015/03/basics-of-lists.html
vec <- 1:4
df <- data.frame(y = c(1:3), x = c("m", "m", "f"))
char = "Hello"
list1 <- list(vec, df, char)
list1
as.list(vec)
names(list1) <- c("Numbers", "Some.data", "Letters")
list1
list1[[3]]
list1[3]
str(list1[[3]])
str(list1[3])
list1$Letters
list1[['Letters']]
list1[c(1, 3)]
list1$newthing <- lm(y~x, data = df)
list1[[5]] <- "new component"
list1[[5]]
list1$Letters <- NULL
list1
list1[[2]][1, ]
# initialise a list
list2 <- vector('list', 3)
# convert
unlist(list1)
#====================
# combine lists
mat.list <- list(mat1 = matrix(c(1,2,3,4), nrow = 2), 
                 mat2 = matrix(c(5,6,7,8), nrow = 2))
mat.list
do.call(rbind.data.frame, mat.list)
#============Part 2
# https://rforpublichealth.blogspot.com/2015/08/how-to-use-lists-in-r.html
# How to use lists
mylist <- list(x = c(1, 5, 7), y = c(4, 2, 6), z = c(0, 3, 4))
mylist
lapply(mylist, mean)
sapply(mylist, mean)
lapply(mylist, function(x) {(max(x) - min(x)) >=5})
sapply(mylist, function(x) {(max(x) - min(x)) >= 5})
#=============================
# lapply can be used to make a list. 
list2 <- lapply(1:3, function(x) matrix(rnorm(6, 10, 1), nrow = 2, ncol = 3))
list2
lapply(list2, colSums)
sapply(list2, colSums)
#====================================================
# List are great for storing information
set.seed(2000)
x <- rbinom(1000, 1, 0.6)
mydata <- data.frame(trt = x, 
                     out1 = x * 3 + rnorm(1000, 0, 3), 
                     out2 = x * 5 + rnorm(1000, 0, 5), 
                     out3 = rnorm(1000, 5, 3), 
                     out4 = x * 1 + rnorm(1000, 0, 8))
head(mydata)
results <- lapply(2:5, function(x) lm(mydata[, x] ~ trt, data = mydata))
# In this case, we are taking the vector c(2,3,4,5) and for each component of this vector, we’re running the model that we describe in the function. We can always name the components of the list as below, and I’ll print out the first two elements:
names(results) <- names(mydata)[2:5]
print(results, max = 4)
# This can also be used to store all the results
sapply(results, function(x) summary(x)$coefficients[2, 1:2])
