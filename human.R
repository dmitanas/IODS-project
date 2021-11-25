hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

str(hd)

dim(hd)

summary(hd)

str(gii)

dim(gii)

summary(gii)

library(dplyr)

colnames(hd)

colnames(hd)[3] <- "HDI"

colnames(hd)[4] <- "life_exp"

colnames(hd)[5] <- "edu_exp"

colnames(hd)[6] <- "mean_edu"

colnames(hd)[7] <- "GNI"

colnames(hd)[8] <- "GNI_HDI"

colnames(gii)[3] <- "GII"

colnames(gii)[4] <- "mat_rate"

colnames(gii)[5] <- "adol_rate"

colnames(gii)[6] <- "repr_par"

colnames(gii)[7] <- "f_edu"

colnames(gii)[8] <- "m_edu"

colnames(gii)[9] <- "f_lab_rate"

colnames(gii)[10] <- "m_lab_rate"

summary(gii)

gii <- mutate(gii, fm_edu = (f_edu / m_edu), fm_lab = (f_lab_rate / m_lab_rate))

join_by <- c("Country")

human <- inner_join(hd, gii, by = join_by, suffix = c(".hd", ".gii"))

dim(human)

write.table(human, file = "human.txt")



