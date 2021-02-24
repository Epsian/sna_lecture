# to load in the google form data and format it into an edge list

# setup ####

library(statnet)

# load google form responses

raw_data = read.csv("./data/IST8X Network Survey.csv", header = TRUE, stringsAsFactors = FALSE)