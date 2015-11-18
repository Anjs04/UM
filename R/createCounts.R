createCounts = function() {

  Counts = as.data.frame(xtabs(~Area+Organisation.Type+Year+Classified, data=UML))
  
  Counts$Year = as.numeric(Counts$Year)
  Counts$Classified = as.numeric(Counts$Classified)
  
}