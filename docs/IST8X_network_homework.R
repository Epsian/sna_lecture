# homework assignment for IST8X Lecture 15 - Network Analysis (W21)

#██████╗  █████╗ ████████╗ █████╗ ██╗      █████╗ ██████╗ 
#██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██║     ██╔══██╗██╔══██╗
#██║  ██║███████║   ██║   ███████║██║     ███████║██████╔╝
#██║  ██║██╔══██║   ██║   ██╔══██║██║     ██╔══██║██╔══██╗
#██████╔╝██║  ██║   ██║   ██║  ██║███████╗██║  ██║██████╔╝
#╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ 

# ------------------------------------------------------------------------------
# This file will ask you to load in a network dataset, create a network
# from it, generate network measures, and interpret those measures.

# Questions will be comments in this file. Please write your code under
# the question headings. If the question asks for a text response, please
# write it as a comment under the heading.
# ------------------------------------------------------------------------------

# Setup ####

# packages
library(statnet)
library(visNetwork)

# data load
# load in the two data files from Canvas here

# (hw_attributes.csv)

# (hw_edgelist.csv)

# Homework problems ####

## Problem Set 1 - Network Data ################################################

# Use the following adjacency matrix to answer the question in this section
data.frame("A" = c(1,0,1,0), "B" = c(0,1,0,0), "C" = c(1,0,1,0), "D" = c(1,0,0,1), row.names = c("A", "B", "C", "D"))

### Question 1.1 ####
# In a comment, name all linked nodes if the above adjacency matrix
# was turned into a network.
# For example, if X and Y shared an edge, write "x <-> Y"
# Do not include self-edges (the diagonal).

### Question 1.2 ####
# If the above adjacency matrix were turned into a network, would it have
# weighted edges? How do you know?

### Question 1.3 ####
# If the above adjacency matrix were turned into a network, would it be
# directed or un-directed? How do you know?

## Problem Set 2 - Coding and Measures #########################################

# For this section you will need to create a network object from the
# hw_attributes and hw_edgelist files you downloaded. You will then use
# that network to answer the questions in this section.

### Question 2.1 ####
# Create a network object from the hw_attributes and hw_edgelist files.
# Make sure it is an undirected network.

### Question 2.2 ####
# How many nodes and edges are in this network?

### Question 2.3 ####
# Find the betweenness centrality of nodes in this network. What node has the
# highest betweenness centrality?

## Problem Set 3 - Interpretation ##############################################

# This section will ask you to interpret the network you have made thus far
# and explain the significance of the numbers you've been generating.

### Question 3.1 ####
# Plot the network you created above. Make it so that the node with the highest
# betweenness centrality is colored in RED.

### Question 3.2 ####
# Would you consider this network to be high or low density? Explain why.

### Question 3.3 ####
# Using everything you have made thus far to answer the following question: 
# In the context of this network, what is the significance of having the
# highest betweenness centrality?


























