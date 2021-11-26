install.packages("tidyr")
install.packages("dplyr")

library(dplyr)
library(tidyr)

BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)

RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = T)

str(BPRS)

dim(BPRS)

summary(BPRS)

str(RATS)

dim(RATS)

summary(RATS)

write.table(BPRS, file = "BPRS.txt")

write.table(RATS, file = "RATS.txt")

BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
BPRS$week0 <- factor(BPRS$week0)
BPRS$week1 <- factor(BPRS$week1)
BPRS$week2 <- factor(BPRS$week2)
BPRS$week3 <- factor(BPRS$week3)
BPRS$week4 <- factor(BPRS$week4)
BPRS$week5 <- factor(BPRS$week5)
BPRS$week6 <- factor(BPRS$week6)
BPRS$week7 <- factor(BPRS$week7)
BPRS$week8 <- factor(BPRS$week8)

RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)
RATS$WD1 <- factor(RATS$WD1)
RATS$WD8 <- factor(RATS$WD8)
RATS$WD15 <- factor(RATS$WD15)
RATS$WD22 <- factor(RATS$WD22)
RATS$WD29 <- factor(RATS$WD29)
RATS$WD36 <- factor(RATS$WD36)
RATS$WD43 <- factor(RATS$WD43)
RATS$WD44 <- factor(RATS$WD44)
RATS$WD50 <- factor(RATS$WD50)
RATS$WD57 <- factor(RATS$WD57)
RATS$WD64 <- factor(RATS$WD64)

BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)

RATSL <-  RATS %>% gather(key = times, value = rats, -ID, -Group)

BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))

RATSL <-  RATSL %>% mutate(time = as.integer(substr(times,5,5)))

summary(BPRSL)

summary(RATSL)

str(BPRSL)

dim(BPRSL)

str(RATSL)

dim(RATSL)