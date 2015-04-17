# http://blog.rstudio.org/2015/04/09/readr-0-1-0/
#Test readr
library(readr)
da <- read_csv("Data/train.csv")
# this does not just show 10 lines.  What  is it? 
da
