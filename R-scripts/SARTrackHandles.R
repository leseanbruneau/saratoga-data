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

# Clean workspace
#rm(list = ls())

# Create data frame from csv file
trackHandles <- read.table("~/saratoga-data/csv/track-handles.txt", sep=",", header=TRUE, stringsAsFactors = TRUE)

# Verify header names in data frame
names(trackHandles)

# Define subset of days with Saratoga races
sarHandles <- subset(trackHandles, (RACES1 > 0))

# Verify counts - total and Saratoga Race days
nrow(trackHandles)

nrow(sarHandles)

# Saratoga Race Day Track Handle not provided - default to letter "U"; change to number 0
#sarHandles$HANDLE1[sarHandles$HANDLE1 == "U"] <- 0

# Calculate total amount bet on Saratoga races
sum(sarHandles$HANDLE1)

# Calculate total number of races at Saratoga
sum(sarHandles$RACES1)

# Calculate average amount bet per race
sum(sarHandles$HANDLE1) / sum(sarHandles$RACES1)

# Calculate 20% track payout from total amount bet
sum(sarHandles$HANDLE1) / sum(sarHandles$RACES1) * 0.2


