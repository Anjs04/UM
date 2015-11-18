### match file UMPCs colume 10 to CC colume 1 and display CC  corresponding colume 2

## read file and CC don't have heading, head=false give V1,V2. as.is = TRUE make machine don't read same entrys as factor 
Frank = read.csv("Frank.csv", as.is=TRUE)
Frank[,1] =   gsub(" $", "", Frank[,1])

## read file and UMPCs has heading, as.is = TRUE make machine don't read same entrys as factor
UM = read.csv("UM.csv", as.is=TRUE)
UM[,13] =   gsub(" $", "", UM[,13])

## match all rows and colume 10 in UMPCs to all rows and colume 1 in CC, then match all
## matching rows in UMPCs to colume in CC
y = Frank[ match(as.character(UM[,13]),  Frank[,1]), 2 ]


### make new colume organisation in csv file
UM$Population = factor(y)

### create a new csv that copy UMPCs and make into UMPCCC
write.csv(UM, file = "UMPC.csv")


##Dates
dates = as.Date(UM$Date, format="%d-%b-%y")
UM$Classified= as.numeric(format(dates,"%Y"))

##Anjali
as.data.frame(xtabs(~Area+Organisation.Type, data=UM))
