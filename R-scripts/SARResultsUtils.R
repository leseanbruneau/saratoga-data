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

