# overshoot
SEM project exploring the interactions between world systems position, gender, development, neoliberalism and overshoot

# Data compilation
Used cleaned sub data sheets to compile a master data set with all needed variables. This happened in two stages corresponding to scripts datacompilation_initial and datacompilation_final with hand cleaning after each. Variables and their sources and definitions are all defined in data dictionary word doc which I will copy and paste into here as well. 

# Final data set is 

# Data dictionary 

This data dictionary is organized by sub-sheets of cleaned data (which can be found in the cleaned data folder) which are simply reformatted and reduced versions of the raw data downloads in the raw data folder. Variable names are underlined. The master data sheet was compiled by joining is sub-sheet of cleaned data in R and exporting it as a CSV. Datacompilation_initial script details this process and the hand cleaning done to the CSV afterwards

Cleaned data sub-sheets: 
•	Biocapacityandovershoot2016
o	Info
	Source: Footprintdata2019 (data year 2016) from global footprint network
	Data year: 2016
	N = 187
o	Variables
	Country – Name of country
	TEF_Consumption  - Total Ecological Footprint (Consumption). This indicates the consumption of biocapacity by a country’s inhabitants. Is equal to the ecological footprint of production + net ecological footprint of trade. Units are global hectares per person. 
	Total_Biocapacity – Biocapacity in global hectares per person. 
	Overshoot – Ecological (Deficit) or Reserve. Total_Biocapacity minus TEF_consumption. 
•	Biocapacitypercap1971
o	Info
	Source: biocapacitydata2016datayear from the 2019 (2016) public data package from global footprint network 
	Data year: 1971
	N = 142
o	Variables
	Country – country name
	BiocapPerCap_1971 – Total biocapacity per capita which is a summed total of biocapacity from crop land, grazing land, forest land, fishing grounds and built up lands. 
•	biocapacitypercap1996
o	Info
	Source: biocapacitydata2016datayear from the 2019 (2016) public data package from global footprint network 
	Data year: 1996
	N = 176
o	Variables
	Country – country name
	BiocapPerCap_1996 – Total biocapacity per capita which is a summed total of biocapacity from crop land, grazing land, forest land, fishing grounds and built up lands. 
•	biocapacitypercap1986
o	Info
	Source: biocapacitydata2016datayear from the 2019 (2016) public data package from global footprint network 
	Data year: 1986
	N = 155
o	Variables
	Country – country name
	BiocapPerCap_1986 – Total biocapacity per capita which is a summed total of biocapacity from crop land, grazing land, forest land, fishing grounds and built up lands. 
•	GenderGap2018
o	Info
	Source: Globalgendergapdata2018
	Data year: 2018
	N = 153 with some blanks so actually 148
o	Variables
	Countrycode – country code three letter
	Country – country name
	GenderGapIndex_2018 – Is the overall global gender gap index (indicator ID 27959) 
	GGGeconomicsub_2018 – Is the economic participation and opportunities sub index (indicator ID 28159)
	GGGeducationsub_2018 – Is the educational attainment sub index (indicator ID 28161)
	GGGhealthsub_2018 – Is the health and survival sub index (indicator ID 28163)
	GGGpoliticalsub_2018 – Is the political empowerment sub index (indicator ID 27961)
•	Percenturbanpop
o	Info
	Source: World Development Indicators downloaded 3/18/20
	N = 264
	Data years -  multiple (2014, 2016, 2018)
o	Variables
	Country – Country name
	Countrycode – country code three letters
	Percenturbanpop_2018 – Urban population (% of total population) for 2018 (indicator code SP.URB.TOTL.IN.ZS) data year 2018
	Percenturbanpop_2016 – Urban population (% of total population) for 2018 (indicator code SP.URB.TOTL.IN.ZS) data year 2016
	Percenturbanpop_2014 – Urban population (% of total population) for 2018 (indicator code SP.URB.TOTL.IN.ZS) data year 2014
•	GDPpercap
o	Info
	Source: World development indicators downloaded 3/18/20
	N = 264 with some blanks (at least 24 blanks for all three but some years have more)
	Data years – multiple (2014, 2016, 2018)
o	Variables
	Country – Country name
	Countrycode – Country code three letters
	GDPPCint_2014 - GSP per capita, PPP (constant 2011 international $) (indicator code NY.GDP.PCAP.PP.KD) data year 2014
	GDPPCint_2016 - GSP per capita, PPP (constant 2011 international $) (indicator code NY.GDP.PCAP.PP.KD) data year 2016
	GDPPCint_2018 - GSP per capita, PPP (constant 2011 international $) (indicator code NY.GDP.PCAP.PP.KD) data year 2018
	GDPPCus_2014 – GDP per capita (constant 2010 US$) (indicator code NY.GDP.PCAP.KD) data year 2014
	GDPPCus_2016 - GDP per capita (constant 2010 US$) (indicator code NY.GDP.PCAP.KD) data year 2016
	GDPPCus_2018 - GDP per capita (constant 2010 US$) (indicator code NY.GDP.PCAP.KD) data year 2018
•	Economicfreedom2017
o	Info
	Source: EconomicFreedomoftheworld2019data_FraserInstitute
	N = 162
	Data year = 2017
o	Variables
	Countrycode – three letter country code ISO
	Country – country name
	EFindex - Economic Freedom Summary Index comprised of five sub indices
	Govsize_subindex – Size of Government index
	Legal_subindex - Legal System & Property Rights index (note this is adjusted for gender)
	Soundmoney_subindex – Sound Money
	Trade_subindex - Freedom to Trade Internationally
	Regulation_subindex – Regulation 

Finally the Datacompilation_final script details a few final additions/adjustments to the dataset. Variables added in this stage include:

•	World systems position rank
o	Base data used was Clare’s 2007 data set column entitled “WSP2000_Rank”
	N = 114
	Also has “Countrycode” and “Country” fields for joining
	Compared it to the sage handbook on social network analysis chapter “a multiple-network analysis of the world system of nations, 1965-1999” 2014 by Kick et al. using table 22.1. They are reverse coded! But all correct
	Changed two country codes – Democratic republic of congo and Romania based on country code changes
•	R calculated variables
o	ChangeBC_1971_2016 – Total_biocapacity – biocapacitypercap_1971
o	ChangeBC_1986_2016 - Total_biocapacity – biocapacitypercap_1986
o	ChangeBC_1996_2016 - Total_biocapacity – biocapacitypercap_1996
