plotPoissonCounts = function() {
  
  png("figs/PoissonCounts.png")
  qqnorm(residuals(PoissonAccounts), pch=16, ylab="Residuals", xlab = "Number of Accounts", main = "Poisson Distribution with no polynomial transform")
  qqline(residuals(PoissonAccounts))
  
  png("figs/PoissonCountsVSYear.png")
  plot(residuals(PoissonAccounts) ~ Counts$Year, pch=16, ylab="Residuals", xlab="Fitted Means",  main = "Trend in Residuals")
  dev.off()
  
}
