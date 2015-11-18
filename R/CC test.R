## read UMPCs as data big, BUT there are MUILTPLE of same company name  
### R treap same all same compnay name as one factor hence stringsasfactors = F
databig = read.csv("UMPCs.csv", stringsAsFactors=FALSE)
### read CC as datasmall
datasmall =  read.csv("CC.csv",header = F)
## number of rows in big data set 
dim(databig) [1]
i= dim(databig) [1]

for 
{ org = databig [i,10]
  row =  which(datasmall$V1 == org ,)
  catergory = datasmall[row]$V2 ,
  databig[i]$cat <-- catergory }
