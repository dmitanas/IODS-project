# Anastasija Dmitrijeva, 17/11/2021, homework 3.

student_mat <- read.csv("data/student-mat.csv", sep = ";", header = TRUE)

student_por <- read.csv("data/student-por.csv", sep = ";", header = TRUE)

student_mat

student_por

str(student_mat)

dim(student_mat)

str(student_por)

dim(student_por)

library(dplyr)

free_cols <- c("failures","paid","absences","G1","G2","G3")

join_cols <- setdiff(colnames(student_por),free_cols)

mat_por <- inner_join(student_mat, student_por, by = join_cols, suffix = c(".mat", ".por"))

colnames(mat_por)

glimpse(mat_por)

alc <- select(mat_por, one_of(join_cols))

notjoined_columns <- colnames(student_mat)[!colnames(student_mat) %in% join_cols]

notjoined_columns

for(column_name in notjoined_columns) {
  two_columns <- select(mat_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]
  if(is.numeric(first_column)) {
    alc[column_name] <- round(rowMeans(two_columns))
  } else {
    alc[column_name] <- first_column
  }
}

glimpse(alc)

# Then use 'alc_use' to create a new logical 
# column 'high_use' which is TRUE for students for which 'alc_use' is greater than 2 (and FALSE otherwise)

library(dplyr)
library(ggplot2)

alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

alc <- mutate(alc, high_use = alc_use > 2)

glimpse(alc)

write.table(alc, file = "data/student_mat_por.txt")

read.table("student_mat_por.txt")
