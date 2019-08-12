#############################################################
#
# LeSean Bruneau Blog
#   Website: http://leseanbruneau.com
#   Twitter: @leseanbruneau
#   Blog Post:  TBD
#
# Desc:  Simple R script to convert CSV file to JSON file
#
#############################################################

# Create Saratoga 2019 Race Results data frame from CSV file
#sarRaceResults <- read.table("~/saratoga-data/csv/all-2019-SAR-RaceResults.txt", sep=",", header=TRUE, stringsAsFactors = TRUE)


totalPPRaces <- function(races, pp) {
  totalRaces <- subset(races, races$NUMHORSES >= pp)

  return(nrow(totalRaces))
}

postTimeFavs <- function(races) {
  ptFavResults <- data.frame(matrix(ncol = 6))
  names(ptFavResults) <- c("races", "first", "second", "third", "fourth", "other")
  totalRaces <- subset(races, (races$NUMHORSES > 3))
  ptWin <- subset(totalRaces, (totalRaces$PTFAV1 == 'TRUE'))
  ptPlace <- subset(totalRaces, (totalRaces$PTFAV2 == 'TRUE'))
  ptShow <- subset(totalRaces, (totalRaces$PTFAV3 == 'TRUE'))
  ptFourth <- subset(totalRaces, (totalRaces$PTFAV4 == 'TRUE'))
  ptOther <- subset(totalRaces, ((totalRaces$PTFAV1 == 'FALSE') & (totalRaces$PTFAV2 == 'FALSE')
                            & (totalRaces$PTFAV3 == 'FALSE') & (totalRaces$PTFAV4 == 'FALSE'))) 
  
  ptFavResults[1,1] <- nrow(totalRaces)
  ptFavResults[1,2] <- round(nrow(ptWin) / nrow(totalRaces), digits = 3) 
  ptFavResults[1,3] <- round(nrow(ptPlace) / nrow(totalRaces), digits = 3)
  ptFavResults[1,4] <- round(nrow(ptShow) / nrow(totalRaces), digits = 3)
  ptFavResults[1,5] <- round(nrow(ptFourth) / nrow(totalRaces), digits = 3)
  ptFavResults[1,6] <- round(nrow(ptOther) / nrow(totalRaces), digits = 3)
  
  return (ptFavResults)
}

postPosWins <- function(races, postPos) {
  ppWins <- subset(races, (races$PPNUM1 == postPos))
  return(nrow(ppWins))
}

postPosPlace <- function(races, postPos) {
  ppPlace <- subset(races, (races$PPNUM2 == postPos))
  return(nrow(ppPlace))
}

postPosShow <- function(races, postPos) {
  ppShow <- subset(races, (races$PPNUM3 == postPos))
  return(nrow(ppShow))
}

postPosFourth <- function(races, postPos) {
  ppFourth <- subset(races, (races$PPNUM4 == postPos))
  return(nrow(ppFourth))
}


allPostPosResults <- function(races) {
  allppResults <- data.frame(matrix(ncol = 10))
  names(allppResults) <- c("PostPosNum", "Races", "Win", "WinPct", "Place", "PlacePct", "Show", "ShowPct", "Fourth", "FourthPct")
  
  ppReults <- data.frame(matrix(ncol = 10))
  names(ppReults) <- c("PostPosNum", "Races", "Win", "WinPct", "Place", "PlacePct", "Show", "ShowPct", "Fourth", "FourthPct")
  totalRaces <- subset(races, (races$NUMHORSES > 3))
  allPos <- max(totalRaces$NUMHORSES)

  for (post in 1:allPos) {
    ppReults <- c(post, totalPPRaces(totalRaces, post), 
                postPosWins(totalRaces, post), round(postPosWins(totalRaces, post) / totalPPRaces(totalRaces, post), digits=3),
                postPosPlace(totalRaces, post), round(postPosPlace(totalRaces, post) / totalPPRaces(totalRaces, post), digits=3),
                postPosShow(totalRaces, post), round(postPosShow(totalRaces, post) / totalPPRaces(totalRaces, post), digits=3),
                postPosFourth(totalRaces, post), round(postPosFourth(totalRaces, post) / totalPPRaces(totalRaces, post), digits=3))
    allppResults <- rbind(allppResults, ppReults)
  }
  
  #Remove first blank line from data frame
  allppResults <- tail(allppResults, -1)
  
  #print(allppResults, row.names = FALSE)
  
}






