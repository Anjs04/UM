howManyOrgs = function() {

  #Prints number of accounts covered by top 100 organistions
  sum(head(sort(table(UM$Organisation.Name), decreasing = TRUE), 60))
  
  #Prints top 100 organistions
  xx = head(sort(table(UM$Organisation.Name), decreasing = TRUE), 100)
  
  #Making a matrix for optimising organisation classification
  NumEntries = c(268, 276, 283, 289, 295, 299, 304, 307, 311, 314)
  NumTopOrg = c(70, 80, 90, 100, 110, 120, 130, 140, 150, 160)
  percentage = NumEntries/380
  ORGSUM = data.frame(NumEntries, NumTopOrg, percentage)
  #Conclusion is top 100 organisations is most efficient way to categorise large chunk of data
  
  write.csv(names(xx), file="./output/Top100.csv")
  barplot(head(sort(table(UM$Organisation.Name), decreasing = TRUE), 100))
  
}