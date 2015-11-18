### match file UMPCs colume 10 to CC colume 1 and display CC  corresponding colume 2

## read file and CC don't have heading, head=false give V1,V2. as.is = TRUE make machine don't read same entrys as factor 
CC = read.csv("CC.csv", header=FALSE, as.is=TRUE)

## read file and UMPCs has heading, as.is = TRUE make machine don't read same entrys as factor
UMPCs = read.csv("UMPCs.csv", as.is=TRUE)


## match all rows and colume 10 in UMPCs to all rows and colume 1 in CC, then match all
## matching rows in UMPCs to colume in CC
y = CC[ match(UMPCs[,10], CC[,1]), 2 ]


### make new colume organisation in csv file
UMPCs$Organisation.Type = factor(y)

### create a new csv that copy UMPCs and make into UMPCCC
write.csv(UMPCs, file = "UMPCCC.csv")

