# ginal data compilation
library(dplyr)

#Upload hand cleaned data
CleanedData <- read.csv("Data/MasterdataApril2020cleaned.csv", stringsAsFactors = F)

CleanedData$BiocapPerCap_1996 <- as.numeric(CleanedData$BiocapPerCap_1996)
CleanedData$Countrycode <- as.factor(CleanedData$Countrycode)
CleanedData$Country <- as.factor(CleanedData$Country)
CleanedData$Overshoot <- as.numeric(CleanedData$Overshoot)

PS <- read.csv("Data/WSpositionrank2007dataClare.csv")

Finaldata <- full_join(CleanedData, PS, by = "Countrycode") # Note that this is still probably missing values that we could add based on table 22.1 in the sage handbook chapter since this only has the 114 countries Clare dealth with previously. After exporting this final data set need to go through and add

#clean up data
Finaldata <- Finaldata[-29]
Finaldata$Countrycode <- as.factor(Finaldata$Countrycode)

#Make change in biocapacity variables
Finaldata$ChangeBC_1971_2016 <- Finaldata$Total_Biocapacity - Finaldata$BiocapPerCap_1971
Finaldata$ChangeBC_1986_2016 <- Finaldata$Total_Biocapacity - Finaldata$BiocapPerCap_1986
Finaldata$ChangeBC_1996_2016 <- Finaldata$Total_Biocapacity - Finaldata$BiocapPerCap_1996

write.csv(Finaldata, "Data/mastercompileddata2.csv")








