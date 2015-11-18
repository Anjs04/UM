plotPoissonPoly3 = function() {
  
  png("figs/plotPoissonPoly3.png")
  qqnorm(residuals(PoissonAccounts.poly3), pch=16, ylab="Residuals", xlab = "Number of Accounts", main = "Poisson Distribution with Poly 3 Transform")
  qqline(residuals(PoissonAccounts.poly3))
  dev.off()
  
}