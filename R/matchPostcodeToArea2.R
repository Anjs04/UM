#Imports ABS Postcode to Area 4 data (88 regions)
PCAREA <- read.csv("C:/Users/A/Dropbox/Quantitative Project/PCAREA.csv")

#Match UM and PCAREA
match(UM$Postcode, PCAREA$Postcode, nomatch = NULL, incomparables = NULL)
