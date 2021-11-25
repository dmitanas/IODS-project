library(dplyr)

learning2014 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt",
                           sep = "\t", 
                           header = TRUE)

dim(learning2014)

str(learning2014)

# Data set has 183 observations, 60 variables.

learning2014$gender
learning2014$Attitude

deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surf_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
stra_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
gender_questions <- c("gender")
attitude_questions <- c("Attitude")
age_questions <- c("Age")
points_questions <- c("Points")

deep_columns <- select(learning2014, one_of(deep_questions))
learning2014$deep <- rowMeans(deep_columns)

surf_columns <- select(learning2014, one_of(surf_questions))
learning2014$surf <- rowMeans(surf_columns)

stra_columns <- select(learning2014, one_of(stra_questions))
learning2014$stra <- rowMeans(stra_columns)

age_columns <- select(learning2014, one_of(age_questions))
learning2014$age <- rowMeans(age_columns)

points_columns <- select(learning2014, one_of(points_questions))
learning2014$points <- rowMeans(points_columns)

attitude_columns <- select(learning2014, one_of(attitude_questions))
learning2014$attitude <- rowMeans(attitude_columns)

keep_columns <- c("gender", "Age", "Attitude", "deep", "stra", "surf", "Points")

newlearning2014 <- select(learning2014, one_of(keep_columns))

str(newlearning2014)

newlearning2014 <- filter(newlearning2014, Points != 0)

str(newlearning2014)

?write.table

write.table(newlearning2014, file = "newlearning2014.txt")

read.table("newlearning2014.txt")

alc_cons <- read.table("student_mat_por.txt")

str(alc_cons)

dim(alc_cons)

alc_cons

colnames(alc_cons)

# This data deals with student achievement in secondary education of two Portuguese schools. It's attributes are student grades, demographic, social and school related features. This data is provided regarding the performance in two distinct subjects: Mathematics (mat) and Portuguese language (por). 
