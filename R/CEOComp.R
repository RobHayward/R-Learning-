library(XML)
CC <- c("integer", "integer", "character","character", "character", "character")
URL <- "http://www.equilar.com/nytimes/the-new-york-times-200-highest-paid-ceos"
table <- readHTMLTable(URL, header = TRUE, which = 1, stringsAsFactors = FALSE, 
colClass = CC)
head(table[,6])
table[,6] <- gsub("(\\$)", replacement = "", x = table[,6])
table[,6] <- as.numeric(gsub("(,)", replacement = "", x = table[,6]))
str(table)



a <- "$200,000,000"
ab <- gsub("\\$", replacement = "", x = a)
ab2 <- gsub(",", replacement = "", x = ab)
?gsub
ab2