# Ths is an exercises to download German football data and then to make a database. 
# It will be based on the R exercises in the first instance. 
# http://www.r-exercises.com/2017/08/08/soccer-data-sparring-scraping-merging-and-analyzing/?utm_source=rss&utm_medium=rss&utm_campaign=soccer-data-sparring-scraping-merging-and-analyzing
# It is based on Tony's sql exericses in the second place. 
# Then scrape the UK ariline data - it is in feedly data. 
#Scraping, merging and analysing
library(rvest)
# webpage that contains the links to the data
page <- html('http://www.football-data.co.uk/germany.php')
all_links <- page %>% 
  html_nodes("a") %>%  # find all the links
  html_attr("href")  # get the urls
#remove page from workspae
rm(page)
# keep only the files containing .csv
all_links <- grep("\\.csv", all_links, value = TRUE)
# starts at 93/94 so only need to rid 13 and 14. 
# Extract the year that the season starts
#season_start <- as.numeric(gsub(".+/([0-9]{2})/.+", "\\1", all_links))
#rm(season_start)
all_links <- all_links[gsub(".+(.{2}).csv$", "\\1", all_links) == "D1"]
#open empty list
data_list <- list()
# load all the data  files to the list
for(csv_file in all_links) {
  data_id <- paste0("season_", gsub(".+/([0-9]{4})/.+", "\\1", csv_file))
  cat("Starting to read in", data_id, "...")
  data_list[[data_id]] <- read.csv(paste0("http://www.football-data.co.uk/", csv_file), 
                                 na.strings = c("", "NA"))
  cat(" Done, fantastishe|\n")
}
#This now works
library(plyr)
bundesl <- rbind.fill(data_list)
empty_row <- rowSums(is.na(bundesl)) == ncol(bundesl)
sum(empty_row)
empty_col <- sapply(bundesl, function(x) sum(is.na(x)) == nrow(bundesl))
sum(empty_col)
# Continue without the empty columns and rows
bundesl <- bundesl[!empty_row, !empty_col]
# remove extra stuff
rm(empty_row, empty_col)
summary(nchar(as.character(bundesl$Date)))
head(bundesl$Date)        
bundesl$Date <- as.Date(bundesl$Date, "%d/%m/%y")
summary(bundesl$Date)
# Up to exercise 8