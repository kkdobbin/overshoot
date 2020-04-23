#Data compilation script
library(dplyr)

#load cleaned sheets
Biocapandovershoot <- read.csv("Data/Biocapacityandovershoot2016.csv")
Biocapandovershoot <- Biocapandovershoot[-c(5,6)]

Biocap1971 <- read.csv("Data/biocapacitypercap1971.csv")

Biocap1986 <- read.csv("Data/biocapacitypercap1986.csv")

Biocap1996 <- read.csv("Data/biocapacitypercap1996.csv")

EF2017 <- read.csv("Data/Economicfreedom2017.csv")

GDPpercap <- read.csv("Data/GDPpercap.csv")

Gendergap <- read.csv("Data/GenderGap2018.csv")

Urban <- read.csv("Data/percenturbanpop.csv")

#Joins
WB <- left_join(GDPpercap, Urban, by="Countrycode")
WB2 <- full_join(WB, Gendergap, by = "Countrycode")
WB2 <- WB2[-9]
WB3 <- full_join(WB2, EF2017, by = "Countrycode")
WB3 <- WB3[-c(12)]
WB3 <- rename(WB3, Country = Country.x)


#Footprint data joins
FD <- full_join(Biocap1986, Biocap1971, by = "Country")
FD2 <- full_join(Biocap1996, FD, by= "Country" )
FD3 <- full_join(FD2, Biocapandovershoot, by = "Country")

#together
Data <- full_join(FD3, WB3, by = "Country")
#reorder columns to put country code by country name
Data2 <- Data[c(1, 8, 23, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 27, 28, 29)]

#write CVS
write.csv(Data2, "Data/mastercompileddata.csv")
#From there I resaved this as MasterdataApril2020 and cleaned it up by hand. Because the overshoot data doesn't 'have country codes had to join by country name which was not necessarily consistent between the two data sets. I merged duplicates, retaining all available data. Also stupidly I had left some of the regional and world data in the world bank data so had to remove those by hand as well. This data set IS STILL MISSING world systems position rank. And There are three sudan entries. Former sudan which I presume was pre-south sudan and sudan split and then more current footprint data for south sudan and sudan. This is the masterdataApril2020cleaned file which is saved in this R project data folder as well as I saved a copy in the data compilation folder of my regular documents for this project. 




