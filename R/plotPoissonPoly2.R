plotPoissonPoly2 = function() {
  
  png("figs/plotPoissonPoly2.png")
  qqnorm(residuals(PoissonAccounts.poly2), pch=16, ylab="Residuals", xlab = "Number of Accounts", main = "Poisson Distribution with Poly 2 Transform")
  qqline(residuals(PoissonAccounts.poly2))
  dev.off()
  
}