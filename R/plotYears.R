plotYears = function() {
  
  png("figs/Years.png")
  plot(table(UM$Year), main = "Distribution of Years in Unclaimed Money")
  abline(v = 1960, col = "red")
  abline(v = 2008, col = "red")
  dev.off()
  
}