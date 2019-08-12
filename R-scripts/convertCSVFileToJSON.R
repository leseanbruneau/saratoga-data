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

# Install jsonlite package if needed
install.packages("jsonlite", repos="https://cran.r-project.org")

# Load jsonlite R library
library("jsonlite")

#install.packages("dplyr")
#library("dplyr")

# Create data frame from csv file
trackHandles <- read.table("~/saratoga-data/csv/track-handles.txt", sep=",", header=TRUE, stringsAsFactors = TRUE)

# write JSON file from csv file data
write_json(trackHandles, "~/saratoga-data/json/track-handles.json", pretty = TRUE)


# Create Saratoga 2019 Race Results data frame from CSV file
sarRaceResults <- read.table("~/Saratoga/saratoga-data/csv/all-2019-SAR-RaceResults.txt", sep=",", header=TRUE, stringsAsFactors = TRUE)

# write JSON file from csv file data
write_json(sarRaceResults, "~/Saratoga/saratoga-data/json/all-2019-SAR-RaceResults.json", pretty = TRUE)



