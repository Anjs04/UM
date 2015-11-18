#Write the year each account was classified, as unclaimed, to UM as a new variable.
dates = as.Date(UM$Date, format="%d-%b-%y")
UM$Classified= as.numeric(format(dates,"%Y"))
write.csv(UM, file = "./output/UM.csv", row.names = FALSE)

#Plotting the distribution of years
plot(table(UM$Year), main = "Distribution of Years in Unclaimed Money")
abline(v = 1960, col = "red")
abline(v = 2008, col = "red")

#Trimming the data by year
UM2 = na.omit(UM[,c("Amount", "Year", "Organisation.Type", "Area", "Classified")])
UML = subset(UM2, Year > 1960 & Year < 2009)

#Plotting the distribution of years after trimming
plot(table(UML$Year), main = "Distribution of Years in Trimmed Data")
abline(v = 1960, col = "red")
abline(v = 2008, col = "red")

#Chen Individual
#Forming the models

## Gamma
GammaAmount = glm(Amount ~ poly(Year,2) + Organisation.Type + Area + poly(Classified,2), family = Gamma(link = "log"), data=UML)
qqnorm(residuals(GammaAmount), pch=16, ylab="Residuals", xlab = "Amount" , main = "Gamma Distribution")
qqline(residuals(GammaAmount))
plot(residuals(GammaAmount) ~ fitted(GammaAmount), pch=16, ylab="Residuals", xlab="Fitted Means",main = "Gamma Distribution")

## Gaussian
GaussianAmount = glm(Amount ~poly(Year, 2) + Organisation.Type + Area + poly(Classified, 2), family = gaussian(link = "identity"), data = UML)
qqnorm(residuals(GaussianAmount), pch=16, ylab="Residuals", xlab = "Amount", main = "Gaussian Distribution")
qqline(residuals(GaussianAmount))
plot(residuals(GaussianAmount) ~ fitted(GaussianAmount), pch=16, ylab="Residuals", xlab="Fitted Means", main = "Gaussian Distribution")

## Tweedie distribution requires statmod package
require(statmod) 
fit.twe = glm(Amount ~ poly(Year,2) + Organisation.Type + Area + poly(Classified, 2), family=tweedie(link.power=0, var.power=2.7), data = UML)
qqnorm(residuals(fit.twe), pch=16, ylab="Residuals", xlab = "Amount", main = "Tweedie Distribution with Power 2.7")
qqline(residuals(fit.twe))
plot(residuals(fit.twe) ~ fitted(fit.twe), pch=16, ylab="Residuals", xlab="Fitted Means", main = "Tweedie Distribution with Power 2.7")


#Evaluating the models

##Gamma vs Gaussian
par(mfrow=c(2,1))
qqnorm(residuals(GammaAmount), pch=16, ylab="Residuals", xlab = "Amount" , main = "Gamma Distribution")
qqnorm(residuals(GaussianAmount), pch=16, ylab="Residuals", xlab = "Amount", main = "Gaussian Distribution")
#Gamma is the winner


##Gamma vs Tweedie
par(mfrow=c(2,1))
qqnorm(residuals(GammaAmount), pch=16, ylab="Residuals", xlab = "Amount" , main = "Gamma Distribution")
qqline(residuals(GammaAmount))
qqnorm(residuals(fit.twe), pch=16, ylab="Residuals", xlab = "Amount", main = "Tweedie Distribution with Power 2.7")
qqline(residuals(fit.twe))
#Tweedie 2.7 is the winner

##Tweedie 2.7 vs Tweedie 2.5
fit.twe.5 = glm(Amount ~ poly(Year,2) + Organisation.Type + Area + poly(Classified, 2), family=tweedie(link.power=0, var.power=2.5), data = UML)
qqnorm(residuals(fit.twe), pch=16, ylab="Residuals", xlab = "Amount", main = "Tweedie Distribution with Power 2.7")
qqline(residuals(fit.twe))
qqnorm(residuals(fit.twe.5), pch=16, ylab="Residuals", xlab = "Amount", main = "Tweedie Distribution with Power 2.5")
qqline(residuals(fit.twe.5))
#Tweedie 2.7 is the winner

#No use in examining residual plots since qqplots show abnormality.
#Explain the use of "poly(___, 2)"
#Explain the Tweedie power

NormalAmount.nopoly = lm(log(Amount) ~ Year + Organisation.Type + Area + Classified, data=UML)
qqnorm(residuals(NormalAmount.nopoly), pch=16, ylab="Residuals", xlab = "Amount", main = "Normal Distribution without Poly Transform")
qqline(residuals(NormalAmount.nopoly))

NormalAmount.poly2 = lm(log(Amount) ~ poly(Year,2) + Organisation.Type + Area + poly(Classified,2), data=UML)
qqnorm(residuals(NormalAmount.poly2), pch=16, ylab="Residuals", xlab = "Amount", main = "Normal Distribution with Poly 2 Transform")
qqline(residuals(NormalAmount.poly2))
#Better than 1

NormalAmount.poly3 = lm(log(Amount) ~ poly(Year,3) + Organisation.Type + Area + poly(Classified,3), data=UML)
qqnorm(residuals(NormalAmount.poly3), pch=16, ylab="Residuals", xlab = "Amount", main = "Normal Distribution with Poly 3 Transform")
qqline(residuals(NormalAmount.poly3))
#Better than 2

NormalAmount.poly4 = lm(log(Amount) ~ poly(Year,4) + Organisation.Type + Area + poly(Classified,4), data=UML)
qqnorm(residuals(NormalAmount.poly4), pch=16, ylab="Residuals", xlab = "Amount", main = "Normal Distribution with Poly 4 Transform")
qqline(residuals(NormalAmount.poly4))
#Better than 3

NormalAmount.poly5 = lm(log(Amount) ~ poly(Year,5) + Organisation.Type + Area + poly(Classified,5), data=UML)
qqnorm(residuals(NormalAmount.poly5), pch=16, ylab="Residuals", xlab = "Amount", main = "Normal Distribution with Poly 5 Transform")
qqline(residuals(NormalAmount.poly5))
#Worse than 4


#Anjali Individual (using trimmed data)

#Tablulating the data using all four relevant variables
#Should I be using UML or UM?
Counts = as.data.frame(xtabs(~Area+Organisation.Type+Year+Classified, data=UML))

#Turn variables numeric for smaller model
Counts$Year = as.numeric(Counts$Year)
Counts$Classified = as.numeric(Counts$Classified)

#Try Poisson model with trimmed data
PoissonAccounts.poly2 <- glm(Freq ~ Area+Organisation.Type+poly(Year,2)+poly(Classified,2), family = poisson(link = "log"), data = Counts)
qqnorm(residuals(PoissonAccounts.poly2), pch=16, ylab="Residuals", xlab = "Number of Accounts", main = "Poisson Distribution with Poly 2 Transform")
qqline(residuals(PoissonAccounts.poly2))

PoissonAccounts.poly3 <- glm(Freq ~ Area+Organisation.Type+poly(Year,3)+poly(Classified,3), family = poisson(link = "log"), data = Counts)
qqnorm(residuals(PoissonAccounts.poly3), pch=16, ylab="Residuals", xlab = "Number of Accounts", main = "Poisson Distribution with Poly 3 Transform")
qqline(residuals(PoissonAccounts.poly3))
#Best outcome

#If no adequately fitting model is found, we can still make inferences from the summary about the significance of each variable.
summary(PoissonAccounts.poly3)

NormalAmount.nopoly = lm(log(Freq + 1) ~ Area + Organisation.Type + Year + Classified, data=na.omit(Counts))
qqnorm(residuals(NormalAmount.nopoly), pch=16, ylab="Residuals", xlab = "Number of Accounts", main = "Normal Distribution without Poly Transform")
qqline(residuals(NormalAmount.nopoly))

NormalAmount.poly2 = lm(log(Freq + 1) ~ Area + Organisation.Type + poly(Year, 2) + poly(Classified, 2), data=na.omit(Counts))
qqnorm(residuals(NormalAmount.poly2), pch=16, ylab="Residuals", xlab = "Number of Accounts", main = "Normal Distribution with Poly 2 Transform")
qqline(residuals(NormalAmount.poly2))
#Totally useless
