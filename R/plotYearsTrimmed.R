plotYearsTrimmed = function() {

  png("figs/YearsTrimmed.png")
  plot(table(UML$Year), main = "Distribution of Years in Trimmed Data")
  abline(v = 1960, col = "red")
  abline(v = 2008, col = "red")
  dev.off()

}