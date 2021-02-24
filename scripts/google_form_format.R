# to load in the google form data and format it into an edge list

# setup ####

library(statnet)
library(openssl)

# load google form responses
raw_data = read.csv("./data/IST8X Network Survey.csv", header = TRUE, stringsAsFactors = FALSE)

# clean ####

clean_data = as.data.frame(apply(raw_data, 2, function(raw_col){
  clean_col = trimws(tolower(raw_col))
  return(clean_col)
}), stringsAsFactors = FALSE)

# transform ####

## make attributes table ####
class_att = data.frame("id" = clean_data$Who.is.your.favorite.fictional.character.,
                       "year" = clean_data$How.many.years.have.you.been.at.UC.Davis..including.this.year..,
                       "color" = clean_data$Please.select.a.color.,
                       "major" = clean_data$What.is.your.primary.major.,
                       stringsAsFactors = FALSE)

## make edge list ####

### get student edges ####
student_edges = apply(clean_data, 1, function(student){
  
  # make edgelist
  edges = data.frame("to" = unlist(strsplit(student["Please.name.at.least.5.10.students.at.UC.Davis.you.would.consider.friends."], "\n", fixed = TRUE)),
             "from" = student["What.is.your.name."],
             stringsAsFactors = FALSE)
  
  # reset row names
  row.names(edges) = 1:nrow(edges)
  
  # trim ws
  edges$to = trimws(edges$to)
  edges$from = trimws(edges$from)
  
  # return
  return(edges)
  
})

# convert to datafarme
student_edges = do.call(rbind, student_edges)

### get class edges ####

class_edges = apply(clean_data, 1, function(student){
  
  # make edgelist
  edges = data.frame("to" = unlist(strsplit(student["Please.list.the.course.IDs.of.all.the.courses.you.have.taken.in.the.past.academic.year...Winter.2020.Winter.2021.inclusive."], "\n", fixed = TRUE)),
                     "from" = student["What.is.your.name."],
                     stringsAsFactors = FALSE)
  
  # reset row names
  row.names(edges) = 1:nrow(edges)
  
  # trim ws
  edges$to = trimws(edges$to)
  edges$from = trimws(edges$from)
  
  # return
  return(edges)
  
})

# convert to datafarme
class_edges = do.call(rbind, class_edges)

# remove student names ####

# make alias key for student in class
student_key = data.frame("student" = clean_data$What.is.your.name.,
                       "alias" = clean_data$Who.is.your.favorite.fictional.character.,
                       stringsAsFactors = FALSE)

# make alias key for students not in class
unknown_key = data.frame("student" = unique(c(student_edges$to, student_edges$from)),
                         "alias" = NA,
                         stringsAsFactors = FALSE)

# remove students from class
unknown_key = unknown_key[!(unknown_key$student %in% student_key$student), ]
unknown_key$alias = sha1(unknown_key$student)

# merge
alias_key = rbind(student_key, unknown_key)

# replace student names with alias

student_edges = data.frame(apply(student_edges, c(1,2), function(cell){
  
  # replace student name with alias
  cell = alias_key[which(cell == alias_key$student), "alias"]
  # return
  return(cell)
  
}), stringsAsFactors = FALSE)

# replace student names in class edges

# merge with alias list and drop student names
class_edges = merge(class_edges, alias_key, by.x = "from", by.y = "student")[,2:3]

# rename alias column to from
colnames(class_edges)[colnames(class_edges) == "alias"] = "from"

# save out ####

write.csv(class_att, "./data/toy_attributes.csv", row.names = FALSE)
write.csv(student_edges, "./data/toy_edgelist.csv", row.names = FALSE)
write.csv(class_edges, "./data/toy_projected.csv", row.names = FALSE)

