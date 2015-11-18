createUM = function() {

  UM = rbind(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z)
  write.csv(UM, file = "./output/UM.csv")

  summary(UM)

}