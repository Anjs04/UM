anovaQuassiPoisson = function() {

  anovaQ = anova(quasiPoisson, test="F")
  summary(anovaQ)
  
}