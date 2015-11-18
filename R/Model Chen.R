## GLM Gaussian fits with log link function, but Normal QQ plot and Residuals vs fited mean plot are bad, heavily skewed to the right.
GaussianAmount = glm(Amount ~ Year + Organisation.Type + Area + Classified, family = gaussian(link = "log"), data=UM)
qqnorm(residuals(GaussianAmount), pch=16, ylab="Residuals", xlab = "Amount")
qqline(residuals(GaussianAmount))

plot(residuals(GaussianAmount) ~ fitted(GaussianAmount), pch=16, ylab="Residuals", xlab="Fitted Means")

## GLM Gaussian fits with canonical link function, Residual analysis show no differecne between log and canonical link
GaussianAmountC = glm(UM$Amount ~ UM$Year + UM$Organisation.Type + UM$Area + UM$Classified, family = gaussian(link = "identity"))
qqnorm(residuals(GaussianAmountC), pch=16, ylab="Residuals", xlab = "Amount")
qqline(residuals(GaussianAmountC))
plot(residuals(GaussianAmountC) ~ fitted(GaussianAmount), pch=16, ylab="Residuals", xlab="Fitted Means")

-------------------------------------------------------------------------------------------------------------------------
  
## GLM IverseGaussian fits with log link function
InverseGaussianAmount = glm(log(Amount) ~ poly(Year,2) + Organisation.Type + Area + poly(Classified,2) , 
                  family = inverse.gaussian(link = "log"), data=UML)
qqnorm(residuals(InverseGaussianAmount), pch=16, ylab="InverseResiduals", xlab = "Amount", main="InverseGaussian")
qqline(residuals(InverseGaussianAmount))
plot(residuals(InverseGaussianAmount) ~ fitted(InverseGaussianAmount), pch=16, ylab="InverseResiduals", 
     xlab="Fitted Means", main="InverseGaussian")
-------------------------------------------------------------------------------------------------------------------------
  
## GLM Poisson fits with log link function, but Normal QQ plot and Residuals vs fited mean plot are bad, 
## similar to Gaussian fit but less heavily skewed to the right. 
PoissonAmount = glm(UM$Amount ~ UM$Year + UM$Organisation.Type + UM$Area + UM$Classified, family = poisson(link = "log"))
qqnorm(residuals(PoissonAmount), pch=16, ylab="Residuals", xlab = "Amount")
qqline(residuals(PoissonAmount))
plot(residuals(PoissonAmount) ~ fitted(PoissonAmount), pch=16, ylab="Residuals", xlab="Fitted Means")

-----------------------------------------------------------------------------------------------------------------------
  
## GLM Gamma fits with log link function, but Normal QQ plot and Residuals vs fited mean plot similar to other fit
UM2 = na.omit(UM[,c("Amount", "Year", "Organisation.Type", "Area", "Classified")])
GammaAmount = glm(Amount ~ poly(Year,2) + Organisation.Type + Area + Classified, family = Gamma(link = "log"), data=UM2)
qqnorm(residuals(GammaAmount), pch=16, ylab="Residuals", xlab = "Amount")
qqline(residuals(GammaAmount))
plot(residuals(GammaAmount) ~ fitted(GammaAmount), pch=16, ylab="Residuals", xlab="Fitted Means")
plot(residuals(GammaAmount) ~ UM2$Year, pch=16, ylab="Residuals", xlab="Fitted Means")

GammaAmount = glm(Amount ~ Year + Organisation.Type + Area + Classified, family = inverse.gaussian(link = "log"), data=UM2)


-------------------------------------------------------------------------------------------------------------------------
  
## normal linear fit, just to show normal does not fit well
NormalAmount = lm(UM$Amount ~ UM$Year + UM$Organisation.Type + UM$Area + UM$Classified)
qqnorm(residuals(NormalAmount), pch=16, ylab="Residuals", xlab = "Amount")
qqline(residuals(NormalAmount))
plot(residuals(NormalAmount) ~ fitted(NormalAmount), pch=16, ylab="Residuals", xlab="Fitted Means")

-------------------------------------------------------------------------------------------------------------------------
  
## par() put 4 plots on one page 2 X 2 , each identified by their heading ( main = "heading" )
par(mfrow=c(2,2))
qqnorm(residuals(GaussianAmount), pch=16, ylab="Residuals", xlab = "Amount" , main = "GaussianAmount")
qqnorm(residuals(PoissonAmount), pch=16, mean = "PoissonAmount", ylab="Residuals", xlab = "Amount", main = "PoissonAmount")
qqnorm(residuals(GammaAmount), pch=16, mean = "GammaAmount", ylab="Residuals", xlab = "Amount", main = "GammaAmount")
qqnorm(residuals(NormalAmount), pch=16, mean = "NormalAmount", ylab="Residuals", xlab = "Amount", main = "NormalAmount")

-------------------------------------------------------------------------------------------------------------------------
  
## par() put 4 plots on one page 2 X 2 , each identified by their heading ( main = "heading" )
par(mfrow=c(2,2))
plot(residuals(GaussianAmount) ~ fitted(GaussianAmount), pch=16, ylab="Residuals", xlab="Fitted Means" , main = "GaussianAmount")
plot(residuals(PoissonAmount) ~ fitted(PoissonAmount), pch=16, ylab="Residuals", xlab="Fitted Means", main = "PoissonAmount")
plot(residuals(GammaAmount) ~ fitted(GammaAmount), pch=16, ylab="Residuals", xlab="Fitted Means", main = "GammaAmount")
plot(residuals(NormalAmount) ~ fitted(NormalAmount), pch=16, ylab="Residuals", xlab="Fitted Means", main = "NormalAmount")

### you require the statmod package to run the Tweedie GLM
require(statmod) 
fit.tweedie = glm(Amount ~ poly(Year,2) + Organisation.Type + Area + Classified, family=tweedie(link.power=0, var.power=2.7), data = UML)
qqnorm(residuals(tweedie), pch=16, ylab="Residuals", xlab = "Amount", main="Tweedie")
qqline(residuals(tweedie))
plot(residuals(tweedie) ~ fitted(tweedie), pch=16, ylab="Residuals", xlab="Fitted Means")

## trim the data to get ride of some iregularity
UM2 = na.omit(UM[,c("Amount", "Year", "Organisation.Type", "Area", "Classified")])
UML = subset(UM2, Year > 1960 & Year < 2009)
## try trimed data
GammaAmount = glm(Amount ~ poly(Year,2) + Organisation.Type + Area + poly(Classified,2), family = Gamma(link = "log"), data=UML)
qqnorm(residuals(GammaAmount), pch=16, ylab="Residuals", xlab = "Amount")
qqline(residuals(GammaAmount))
plot(residuals(GammaAmount) ~ fitted(GammaAmount), pch=16, ylab="Residuals", xlab="Fitted Means")
plot(residuals(GammaAmount) ~ UML$Year, pch=16, ylab="Residuals", xlab="Fitted Means")
## try to fit inversgaussian with trimed data didnt work
InverseGaussianAmount = glm(Amount ~ poly(Year,2) + Organisation.Type + Area + Classified, family = inverse.gaussian(link = "log"), data = UML)
qqnorm(residuals(InverseGaussianAmount), pch=16, ylab="Residuals", xlab = "Amount")
qqline(residuals(InverseGaussianAmount))
plot(residuals(InverseGaussianAmount) ~ fitted(GammaAmount), pch=16, ylab="Residuals", xlab="Fitted Means")
plot(residuals(InverseGaussianAmount) ~ UML$Year, pch=16, ylab="Residuals", xlab="Fitted Means")