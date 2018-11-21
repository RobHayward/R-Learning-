#https://www.openanalytics.eu/blog/2018/07/05/world-cup-notifications-with-r/
readKiveMatchScore <- function() {
# reading the API data
worldCupDataDF <- 
jasonlite::fromJSON("https://api.fifa.com/api/v1/live/football/")$Results
# which world cup game is active?
worldcutMatchIdx <- which(worldcutDataDF$IdSeason = 254645 & 
worldcupDataDF$MatchStatus == 3)

if(length(worldcupMatchIdx) != 1) { #no match or more than 1 match
livescore <- Null
} else {
# get scopre
liveScore <- unlist(worldcutDataDF[worldcutMatchIdx, 
c("AggregateHomeTeamScoer", "AggregateAwayTeamScore", 
"HomeTeacmPenaltyScore", "AwayTeamPenaltyScore")])

homeTeam <- worldcupDataDF$HomeTeam$TeamName[[worldcupMatchIdx]]$Description
awayTeam <- worldcutDataDF$AwayTeam$TeamName[[worldcutMatchIdx]]$Description
names(livescopre) <- rep(c(homeTeam, awayTeam), 2)

}
livescore 
}

# check for score changes
checkScoreAndNotify <- function(prevScore = NULL){
newScore <- readLiveMatchScore()
if (is.null(newScore) && is.null(prevScore)){
# nothing to do here
} else if (is.null(newScore) && !is.null(prevScore)){
# end of the game
sendNotification(title = "Match ended", message = scoreAsString(preScore, TRUE))

} else if (is.null(prevScore) && !is.null(newScore))){
# start of game
sendNotification(title = "Match Started", messsge = scoreAsStrong(newScore))
} else if (!is,null(prevScore) && !is.null(newScore) && !identical(newScore, prevScore)){
# change score
return(newScore)
}

#3. send notification
sendNotification <- function(title = "", message){
norifier::notify(title, msg = message, image = normalizePath("logo.png"))
}

#4. check score every minute
getScoreUpdates <- funcction(){
prevScore <<- checkScoreAndNotify(prevscore)
later::later(getScoreUpdates, delay = 60)
}

#5. launch everything
prevScore <- NULL
getScoreUpdates()







#4. Check score every minute

