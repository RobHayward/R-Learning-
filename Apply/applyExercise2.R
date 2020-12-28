# Using apply 
# http://rforpublichealth.blogspot.com/2012/09/the-infamous-apply-function.html
births <- data.frame(outcome.01 = c('lost', rep('live birth', 4)), 
                                    outcome.02 = c(NA, rep('live birth', 2), 
                                                   'lost', 'live birth'), 
                     outcome.03 = c(NA, rep('live brith', 2), NA, 'still born'), 
                     outcome.04 = c(NA, 'live brith', rep(NA, 2), 'live birth'), 
                     outcome.05 = c(NA, 'live birth', rep(NA, 3)))
births
births$childcount <- apply(births[, 1:5], MARGIN = 1, 
                           function(x) {sum(x == "live birth", na.rm = TRUE)})
births  
#======================================
originaldata <- data.frame(ID = 1:4, 
                      Age = c(99, 12, 15, -99), 
                      SEX = c(1, 2, 1, 1), 
                      Var1 = c(1, 2, 99, 1), 
                      Var2 = c(1, 2, 3, 1), 
                      Var3 = c(-99, 99, 1, 1))
originaldata
newdata <- apply(originaldata[, c(2, 4:6)], MARGIN = 2, 
                 function(x) {ifelse(x == 99 | x == -99, NA, x)})
alldata <- cbind(originaldata[, c(-2, -4:-6)], newdata)
alldata
#=================================================
# http://rforpublichealth.blogspot.com/2013/10/loops-revisited-how-to-rethink-macros.html
set.seed(10)
x <- rnorm(100, 5, 2)
z <- rnorm(100, 6, 5)
w <- rnorm(100, 3, 2)
y <- x * 2 + w * 0.5 + rnorm(100, 0, 1)
# this will create a binary that is 1 when y is less than 10
ybin <- as.numeric(y < 10)
mydata <- as.data.frame(cbind(x, z, w, y, ybin))
head(mydata)
xvars <- cbind(x, z, w)
summary(lm(ybin ~ xvars, data = mydata))                        
summary(glm(ybin ~ xvars, family = binomial(logit), data = mydata))
# Now take a sub-set of the data, ie where there are only men and shopkeepers 
data.sub <- as.data.frame(mydata[x > 2 & z < 3, c("x", "z", "ybin")])       
xvars.sub <- as.matrix(data.sub[, c("x", "z")])
summary(lm(ybin ~ xvars.sub, data = data.sub))                                      # apply regression to multiple sets of data
summary(lm(ybin ~ xvars.sub, data = data.sub,subset=x>2 & z<3))
# from the comments.  This is more efficient. 
apply(mydata[, c("y", "ybin")], 2, function(outcome){summary(lm(outcome~x+z))})
#==============================
# Create a new datafraome
Inc1990 <- rnorm(100, 5, 6)
Inc1991 <- rnorm(100, 3, 8)
Inc1992 <- rnorm(100, 4, 4)
Income <- as.data.frame(cbind(Inc1990, Inc1991, Inc1992))
years <- 1990:1992
head(Income)
for(i in seq(along = years)){
  Income[[paste0("hadInc_", years[i])]] <- as.numeric(Income[[i]] > 0)
}
head(Income)
#================================
race <- c(rep(1, 30), rep(2, 30), rep(3, 40))
age <- rnorm(100, 25, 3)
racedata <- as.data.frame(cbind(race, age, y))
racedata$race <- as.factor(racedata$race)
# now use lapply to run the summary of lm on each subset of racedata
lapply(1:3, function(index) summary(lm(y ~ age, data = 
                                         racedata[racedata$race == index, ])))
