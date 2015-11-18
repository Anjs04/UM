trim = function() {}

  UM2 = na.omit(UM[,c("Amount", "Year", "Organisation.Type", "Area", "Classified")])
  UML = subset(UM2, Year > 1960 & Year < 2009)

}