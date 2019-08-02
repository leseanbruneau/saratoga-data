#############################################################
#
# LeSean Bruneau Blog
#   Website: http://leseanbruneau.com
#   Twitter: @leseanbruneau
#   Blog Post:  TBD
#
# Desc:  Simple R script to caculate Saratoga 2019 
#     track handles
#
#############################################################

# Set working directory - sar is the Ubuntu VM username
setwd('/home/sar/saratoga-data/csv')

# Verify working directory
getwd()

# Create data frame from csv file
trackHandles <- read.table("track-handles.txt", sep=",", header=TRUE, stringsAsFactors = TRUE)

# Verify header names in data frame
names(trackHandles)

# Define subset of days with Canterbury Park races
cbyHandles <- subset(trackHandles, (RACES3 > 0))

# Verify counts - total and Canterbury Park Race days
nrow(trackHandles)

nrow(cbyHandles)

# Calculate total amount bet on Canterbury Park races
sum(cbyHandles$HANDLE3)

# Calculate total number of races at Canterbury Park
sum(cbyHandles$RACES3)

# Calculate average amount bet per race
sum(cbyHandles$HANDLE3) / sum(cbyHandles$RACES3)

# Calculate 20% track payout from total amount bet
sum(cbyHandles$HANDLE3) / sum(cbyHandles$RACES3) * 0.2


