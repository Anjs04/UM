createClassified = function() {

  dates = as.Date(UM$Date, format="%d-%b-%y")
  UM$Classified= as.numeric(format(dates,"%Y"))
  write.csv(UM, file = "./output/UM.csv", row.names = FALSE)
  
}