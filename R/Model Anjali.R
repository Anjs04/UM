# Write the year each account was classified as unclaimed to UM as a variable.
dates = as.Date(UM$Date, format="%d-%b-%y")
UM$Classified= as.numeric(format(dates,"%Y"))
write.csv(UM, file = "UM.csv", row.names = FALSE)


# Table of counts of each Organisation.Type in each Area
TypeCounts = as.data.frame(xtabs(~Area+Organisation.Type, data=UM))

PoissonAccounts.1 <- glm(Freq ~ Organisation.Type + Area, family = poisson(link = "log"), data = TypeCounts)
summary(PoissonAccounts)
  
qqnorm(residuals(PoissonAccounts.1), pch=16, ylab="Residuals", xlab = "Amount", main = "PoissonAccounts")
qqline(residuals(PoissonAccounts.1))
plot(residuals(PoissonAccounts.1) ~ fitted(PoissonAccounts.1), pch=16, ylab="Residuals", xlab="Fitted Means")

par(mfrow=c(2,1))
qqnorm(residuals(PoissonAccounts), pch=16, ylab="Residuals", xlab = "Amount", main = "PoissonAccounts")
plot(residuals(PoissonAccounts) ~ fitted(PoissonAccounts), pch=16, ylab="Residuals", xlab="Fitted Means")
-------------------------------------------------------------------------------------------------------------------------

  
TypeClassified = as.data.frame(xtabs(~Classified+Organisation.Type, data=UM))
PoissonAccounts.2 <- glm(Freq ~ Organisation.Type + Classified, family = poisson(link = "log"), data = TypeClassified)

summary(TypeClassified)
# Errors here...
qqnorm(residuals(PoissonAccounts.2), pch=16, ylab="Residuals", xlab = "Amount", main = "TypeClassified")
qqline(residuals(PoissonAccounts.2))
plot(residuals(PoissonAccounts.2) ~ fitted(PoissonAccounts.2), pch=16, ylab="Residuals", xlab="Fitted Means")
-------------------------------------------------------------------------------------------------------------------------


TypeYear = as.data.frame(xtabs(~Year+Organisation.Type, data=UM))
PoissonAccounts.3 <- glm(Freq ~ Organisation.Type + Year, family = poisson(link = "log"), data = TypeYear)

summary(PoissonAccounts.3)

qqnorm(residuals(PoissonAccounts.3), pch=16, ylab="Residuals", xlab = "Amount", main = "TypeYear")
qqline(residuals(PoissonAccounts.3))
plot(residuals(PoissonAccounts.3) ~ fitted(PoissonAccounts.3), pch=16, ylab="Residuals", xlab="Fitted Means")
-------------------------------------------------------------------------------------------------------------------------


AreaClassified = as.data.frame(xtabs(~Classified+Area, data=UM))
PoissonAccounts.5 <- glm(Freq ~ Area + Classified, family = poisson(link = "log"), data = AreaClassified)

summary(PoissonAccounts.4)

qqnorm(residuals(PoissonAccounts.4), pch=16, ylab="Residuals", xlab = "Amount", main = "AreaYear")
qqline(residuals(PoissonAccounts.4))
plot(residuals(PoissonAccounts.4) ~ fitted(PoissonAccounts.4), pch=16, ylab="Residuals", xlab="Fitted Means")
-------------------------------------------------------------------------------------------------------------------------


AreaYear = as.data.frame(xtabs(~Year+Area, data=UM))
PoissonAccounts.5 <- glm(Freq ~ Area + Year, family = poisson(link = "log"), data = AreaYear)

summary(PoissonAccounts.5)

qqnorm(residuals(PoissonAccounts.5), pch=16, ylab="Residuals", xlab = "Amount", main = "AreaClassified")
qqline(residuals(PoissonAccounts.5))
plot(residuals(PoissonAccounts.5) ~ fitted(PoissonAccounts.4), pch=16, ylab="Residuals", xlab="Fitted Means")

-------------------------------------------------------------------------------------------------------------------------
par(mfrow=c(3,2))
qqnorm(residuals(PoissonAccounts.1), pch=16, ylab="Residuals", xlab = "Amount", main = "PoissonAccounts")
qqnorm(residuals(PoissonAccounts.2), pch=16, ylab="Residuals", xlab = "Amount", main = "TypeClassified")
qqnorm(residuals(PoissonAccounts.3), pch=16, ylab="Residuals", xlab = "Amount", main = "TypeYear")
qqnorm(residuals(PoissonAccounts.4), pch=16, ylab="Residuals", xlab = "Amount", main = "AreaYear")
qqnorm(residuals(PoissonAccounts.5), pch=16, ylab="Residuals", xlab = "Amount", main = "AreaClassified")
-------------------------------------------------------------------------------------------------------------------------
par(mfrow=c(3,2))
plot(residuals(PoissonAccounts.1) ~ fitted(PoissonAccounts.1), pch=16, ylab="Residuals", xlab="Fitted Means")
plot(residuals(PoissonAccounts.2) ~ fitted(PoissonAccounts.2), pch=16, ylab="Residuals", xlab="Fitted Means")
plot(residuals(PoissonAccounts.3) ~ fitted(PoissonAccounts.3), pch=16, ylab="Residuals", xlab="Fitted Means")
plot(residuals(PoissonAccounts.4) ~ fitted(PoissonAccounts.4), pch=16, ylab="Residuals", xlab="Fitted Means")
plot(residuals(PoissonAccounts.5) ~ fitted(PoissonAccounts.4), pch=16, ylab="Residuals", xlab="Fitted Means")

#Truncate data to 1960 < x < 2008
UML = subset(UM, Year > 1960 & Year < 2009)
plot(density((UML$Year)))
abline(v = 2008)
abline(v = 2009)

#Table with 4 variables
Counts = as.data.frame(xtabs(~Area+Organisation.Type+Year+Classified, data=UML))

#Turn variables numeric for smaller model
Counts$Year = as.numeric(Counts$Year)
Counts$Classified = as.numeric(Counts$Classified)

#Try Poisson model with trimmed data
PoissonAccounts.poly2 <- glm(Freq ~ Area+Organisation.Type+poly(Year,2)+poly(Classified,2), family = poisson(link = "log"), data = Counts)
qqnorm(residuals(PoissonAccounts.poly2), pch=16, ylab="Residuals", xlab = "Amount", main = "Poisson Distribution with Poly 2 Transform")
qqline(residuals(PoissonAccounts.poly2))

PoissonAccounts.poly3 <- glm(Freq ~ Area+Organisation.Type+poly(Year,3)+poly(Classified,3), family = poisson(link = "log"), data = Counts)
qqnorm(residuals(PoissonAccounts.poly3), pch=16, ylab="Residuals", xlab = "Amount", main = "Poisson Distribution with Poly 3 Transform")
qqline(residuals(PoissonAccounts.poly3))
#Best outcome

#If no adequately fitting model is found, we can still make inferences from the summary about the significance of each variable.
summary(PoissonAccounts.poly3)

#Try negative binomial model with trimmed data
require(MASS)
NegativeBin <- glm.nb(Freq ~ Area+Organisation.Type+Year+Classified, init.theta = 3, link = "log", data = Counts, trace=3)
summary(NegativeBin)
qqnorm(residuals(NegativeBin), pch=16, ylab="Residuals", xlab = "Amount", main = "NegBinAccounts")
plot(residuals(NegativeBin) ~ fitted(NegativeBin), pch=16, ylab="Residuals", xlab="Fitted Means")

#...smaller theta
NegativeBin <- glm.nb(Freq ~ Area+Organisation.Type+Year+Classified, init.theta = 2, link = "log", data = Counts)

#...adding only the 2-way interactions
NegativeBin <- glm.nb(Freq ~ (Area+Organisation.Type+Year+Classified)^2 - 1, data = Counts)

### Example of offset

p = sample(c(1,5), size=11, replace=TRUE)
x = seq(0,1,length=11)

mu = exp(1+2*x)*p

Y = rpois(length(mu), mu)
fit = glm(Y~x, family=poisson(link="log"))
fit2 = glm(Y~x+offset(log(p)), family=poisson(link="log"))



PoissonAccounts <- glm(Freq ~ Area+Organisation.Type+poly(Year,3)+poly(Classified,3), family = poisson(link = "log"), data = Counts)
qqnorm(residuals(PoissonAccounts.poly3), pch=16, ylab="Residuals", xlab = "Amount", main = "Poisson Distribution with Poly 3 Transform")
qqline(residuals(PoissonAccounts.poly3))