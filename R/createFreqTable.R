createFreqTable = function() {

  CountsUM = as.data.frame(xtabs(~ Area + Organisation.Type + Year + Classified + Description, data=UM))
  
  SortedCounts = CountsUM[order(-CountsUM$Freq), ]
  
  names(SortedCounts)[names(SortedCounts)=="Organisation.Type"] <- "Type"
  names(SortedCounts)[names(SortedCounts)=="Classified"] <- "Class."
  print(SortedCounts[1:30,], row.name=FALSE)
  
}