poissonCounts = function() {

  PoissonAccounts = glm(Freq ~ Area+Organisation.Type+Year+Classified, family = poisson(link = "log"), data = Counts)
  summary(PoissonAccounts)
  
}