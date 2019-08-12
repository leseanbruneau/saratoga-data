#############################################################
#
# LeSean Bruneau Blog
#   Website: http://leseanbruneau.com
#   Twitter: @leseanbruneau
#   Blog Post:  TBD
#
# Desc:  Program to get data statistics from Saratoga 2019 Season
#
#############################################################

# Load jsonlite R library
library("jsonlite")

# Create data frame from csv file
trackHandles <- read.table("~/saratoga-data/csv/track-handles.txt", sep=",", header=TRUE, stringsAsFactors = TRUE)

# write JSON file from csv file data
write_json(trackHandles, "~/saratoga-data/json/track-handles.json", pretty = TRUE)


# Create Saratoga 2019 Race Results data frame from CSV file
sarRaceResults <- read.table("~/saratoga-data/csv/all-2019-SAR-RaceResults.txt", sep=",", header=TRUE, stringsAsFactors = TRUE)

# write JSON file from csv file data
write_json(sarRaceResults, "~/saratoga-data/json/all-2019-SAR-RaceResults.json", pretty = TRUE)

# Get results for all post positions
allPPResults <- allPostPosResults(sarRaceResults)

write_json(allPPResults, "~/saratoga-data/json/allPPResults.json", pretty=TRUE)


