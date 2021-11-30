human <- read.table("human.txt")

str(human)

dim(human)

# Description:
# The 'human' dataset originates from the United Nations Development Programme. 
# This dataset has 195 observations and 19 variables which are:
# Human Development Index rank (HDI.rank);
# country names (Country);
# Human Development Index (HDI); 
# Life expectancy at birth (life_exp);
# Expected years of schooling (edu_exp);
# Mean years of Education (mean_edu);
# Gross National Income GNI per Capita (GNI);
# GNI per Capita Rank Minus HDI Rank (GNI_HDI);
# Gender Inequality Index GII (GII.Rank);
# Maternal Mortality Ratio (mat_rate);
# Adolescent Birth Rate (adol_rate);
# Percent Representation in Parliament (repr_par);
# Population with Secondary Education Female (f_edu);
# Population with Secondary Education Male (m_edu);
# Labour Force Participation Rate Female (f_lab_rate);
# Labour Force Participation Rate Male (m_lab_rate);
# The ratio of Female and Male populations with secondary education in each country (fm_edu);
# The ratio of labour force participation of females and males in each country (fm_lab).

library(stringr)

str(human$GNI)

summary(human$GNI)

# Transformation of the Gross National Income (GNI) variable to numeric 

human$GNI %>% as.numeric

# Exclusion of unneeded variables: 
# keep only the columns matching the following variable names (described in the meta file above):  
# "Country", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F"

keep <- c("Country", "fm_edu", "fm_lab", "life_exp", "edu_exp", "GNI", "mat_rate", "adol_rate", "repr_par")

human <- select(human, one_of(keep))

human <- human[1:188, ]

complete.cases(human)

data.frame(human[-1], comp = complete.cases(human))

human_ <- filter(human, complete.cases(human))

rownames(human_)

str(human_)

rownames(human_) <- human_$Country

human_ <- select(human, -Country)

str(human_)

human__ <- human_[complete.cases(human_), ]

str(human__)

write.table(human__, file = "human2.txt", row.names = TRUE)