# to test various possible networks

library(statnet)

# data load

toy_attributes = read.csv("./data/toy_attributes.csv", header = TRUE, stringsAsFactors = FALSE)
toy_edgelist = read.csv("./data/toy_edgelist.csv", header = TRUE, stringsAsFactors = FALSE)
toy_projected = read.csv("./data/toy_projected.csv", header = TRUE, stringsAsFactors = FALSE)

student_net = network(toy_edgelist, directed = FALSE)
class_net = network(toy_projected, directed = FALSE)
