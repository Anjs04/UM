anovaPoissonPoly3 = function() {

  anova3 = anova(PoissonAccounts.poly3, test = "LRT")
  summary(anova3)

}