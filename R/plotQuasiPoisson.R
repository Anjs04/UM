plotQuasiPoisson = function() {

  png("figs/plotQuasiPoissonQQ")
  qqnorm(residuals(quasiPoisson), pch=16, ylab="Residuals", xlab = "Amount", main = "PoissonAccounts")
  qqline(residuals(quasiPoisson))
  dev.off()
  
  png("figs/plotQuassiPoissonResiduals")
  plot(residuals(quasiPoisson) ~ fitted(quasiPoisson), pch=16, ylab="Residuals", xlab="Fitted Means")
  dev.off()
  
}